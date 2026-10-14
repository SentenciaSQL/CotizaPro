import 'package:intl/intl.dart';

int pow10(int exponent) {
  var result = 1;
  for (var i = 0; i < exponent; i++) {
    result *= 10;
  }
  return result;
}

/// Parses a decimal typed by the user into an integer scaled by [scale].
/// Accepts either comma or dot as the decimal separator and rejects
/// thousands separators. Returns null when the text is empty or invalid.
int? parseDecimalToScaled(String raw, int scale) {
  var text = raw.trim().replaceAll(' ', '').replaceAll('\u00A0', '');
  if (text.isEmpty) return null;
  text = text.replaceAll(',', '.');
  var negative = false;
  if (text.startsWith('-')) {
    negative = true;
    text = text.substring(1);
  } else if (text.startsWith('+')) {
    text = text.substring(1);
  }
  if (text.isEmpty || text == '.') return null;
  final parts = text.split('.');
  if (parts.length > 2) return null;
  final wholePart = parts.first.isEmpty ? '0' : parts.first;
  if (!RegExp(r'^\d+$').hasMatch(wholePart)) return null;
  var fraction = parts.length == 2 ? parts[1] : '';
  if (fraction.isNotEmpty && !RegExp(r'^\d+$').hasMatch(fraction)) {
    return null;
  }

  var whole = int.parse(wholePart);
  if (fraction.length > scale) {
    final roundDigit = int.parse(fraction[scale]);
    fraction = scale == 0 ? '' : fraction.substring(0, scale);
    if (roundDigit >= 5) {
      if (scale == 0) {
        whole += 1;
        fraction = '';
      } else {
        final bumped = int.parse(fraction.isEmpty ? '0' : fraction) + 1;
        final max = pow10(scale);
        if (bumped >= max) {
          whole += 1;
          fraction = ''.padRight(scale, '0');
        } else {
          fraction = bumped.toString().padLeft(scale, '0');
        }
      }
    }
  } else {
    fraction = fraction.padRight(scale, '0');
  }

  final fractionValue = scale == 0 || fraction.isEmpty ? 0 : int.parse(fraction);
  final scaled = whole * pow10(scale) + fractionValue;
  return negative ? -scaled : scaled;
}

int lineTotalMinor({
  required int quantityMilli,
  required int unitPriceMinor,
}) {
  final negative = (quantityMilli < 0) ^ (unitPriceMinor < 0);
  final product = quantityMilli.abs() * unitPriceMinor.abs();
  final rounded = (product + 500) ~/ 1000;
  return negative ? -rounded : rounded;
}

int percentOf(int amountMinor, int basisPoints) {
  if (amountMinor == 0 || basisPoints <= 0) return 0;
  final negative = amountMinor < 0;
  final rounded = (amountMinor.abs() * basisPoints + 5000) ~/ 10000;
  return negative ? -rounded : rounded;
}

int currencyScale(String currencyCode) {
  const zero = {
    'JPY',
    'KRW',
    'VND',
    'CLP',
    'PYG',
    'UGX',
    'XAF',
    'XOF',
    'ISK',
  };
  const three = {'BHD', 'KWD', 'OMR', 'TND', 'JOD'};
  final code = currencyCode.toUpperCase();
  if (zero.contains(code)) return 0;
  if (three.contains(code)) return 3;
  return 2;
}

String groupDigits(int value, String separator) {
  final negative = value < 0;
  final digits = value.abs().toString();
  final buffer = StringBuffer();
  for (var i = 0; i < digits.length; i++) {
    if (i > 0 && (digits.length - i) % 3 == 0) {
      buffer.write(separator);
    }
    buffer.write(digits[i]);
  }
  return negative ? '-${buffer.toString()}' : buffer.toString();
}

String formatScaled(int value, int scale, String locale) {
  final symbols = NumberFormat.decimalPattern(locale).symbols;
  final negative = value < 0;
  final abs = value.abs();
  final factor = pow10(scale);
  final whole = abs ~/ factor;
  final fraction = abs % factor;
  final grouped = groupDigits(whole, symbols.GROUP_SEP);
  if (scale == 0) return negative ? '-$grouped' : grouped;
  final fractionText = fraction.toString().padLeft(scale, '0');
  final text = '$grouped${symbols.DECIMAL_SEP}$fractionText';
  return negative ? '-$text' : text;
}

String scaledToInput(int value, int scale, String locale) {
  if (value == 0) return '';
  final separator = NumberFormat.decimalPattern(locale).symbols.DECIMAL_SEP;
  final negative = value < 0;
  final abs = value.abs();
  final factor = pow10(scale);
  final whole = abs ~/ factor;
  final fraction = abs % factor;
  if (scale == 0 || fraction == 0) {
    return negative ? '-$whole' : '$whole';
  }
  var fractionText = fraction.toString().padLeft(scale, '0');
  while (fractionText.endsWith('0')) {
    fractionText = fractionText.substring(0, fractionText.length - 1);
  }
  final text = '$whole$separator$fractionText';
  return negative ? '-$text' : text;
}

String formatQuantity(int quantityMilli, String locale) {
  final symbols = NumberFormat.decimalPattern(locale).symbols;
  final negative = quantityMilli < 0;
  final abs = quantityMilli.abs();
  final whole = abs ~/ 1000;
  var fraction = (abs % 1000).toString().padLeft(3, '0');
  while (fraction.endsWith('0')) {
    fraction = fraction.substring(0, fraction.length - 1);
  }
  final grouped = groupDigits(whole, symbols.GROUP_SEP);
  final text = fraction.isEmpty
      ? grouped
      : '$grouped${symbols.DECIMAL_SEP}$fraction';
  return negative ? '-$text' : text;
}

String formatPercentBps(int basisPoints, String locale) {
  final symbols = NumberFormat.decimalPattern(locale).symbols;
  final negative = basisPoints < 0;
  final abs = basisPoints.abs();
  final whole = abs ~/ 100;
  var fraction = (abs % 100).toString().padLeft(2, '0');
  while (fraction.endsWith('0')) {
    fraction = fraction.substring(0, fraction.length - 1);
  }
  final number = fraction.isEmpty
      ? '$whole'
      : '$whole${symbols.DECIMAL_SEP}$fraction';
  return negative ? '-$number%' : '$number%';
}

String formatMoney(int minor, String currencyCode, String locale) {
  final code = currencyCode.toUpperCase();
  final scale = currencyScale(code);
  final negative = minor < 0;
  final amount = formatScaled(minor.abs(), scale, locale);
  NumberFormat symbols;
  try {
    symbols = NumberFormat.simpleCurrency(name: code, locale: locale);
  } catch (_) {
    return negative ? '-$amount $code' : '$amount $code';
  }
  final symbol = symbols.currencySymbol;
  final sample = symbols.format(1).trimLeft();
  final symbolFirst = sample.startsWith(symbol);
  if (!symbolFirst) {
    return negative ? '-$amount $symbol' : '$amount $symbol';
  }
  final after = sample.substring(symbol.length);
  final spaced = after.startsWith(' ') || after.startsWith('\u00A0');
  final body = spaced ? '$symbol $amount' : '$symbol$amount';
  return negative ? '-$body' : body;
}

const supportedCurrencies = <String>[
  'USD',
  'EUR',
  'MXN',
  'COP',
  'ARS',
  'CLP',
  'PEN',
  'BRL',
  'UYU',
  'PYG',
  'BOB',
  'CRC',
  'DOP',
  'GTQ',
  'HNL',
  'NIO',
  'PAB',
  'GBP',
  'CAD',
];

String currencyForCountry(String? countryCode) {
  switch (countryCode?.toUpperCase()) {
    case 'ES':
    case 'DE':
    case 'FR':
    case 'IT':
    case 'PT':
    case 'IE':
    case 'NL':
    case 'BE':
    case 'AT':
    case 'FI':
    case 'GR':
      return 'EUR';
    case 'MX':
      return 'MXN';
    case 'CO':
      return 'COP';
    case 'AR':
      return 'ARS';
    case 'CL':
      return 'CLP';
    case 'PE':
      return 'PEN';
    case 'BR':
      return 'BRL';
    case 'UY':
      return 'UYU';
    case 'PY':
      return 'PYG';
    case 'BO':
      return 'BOB';
    case 'CR':
      return 'CRC';
    case 'DO':
      return 'DOP';
    case 'GT':
      return 'GTQ';
    case 'HN':
      return 'HNL';
    case 'NI':
      return 'NIO';
    case 'PA':
      return 'PAB';
    case 'GB':
      return 'GBP';
    case 'CA':
      return 'CAD';
    default:
      return 'USD';
  }
}
