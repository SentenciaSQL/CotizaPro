import 'package:cotizapro/core/money/money.dart';
import 'package:cotizapro/data/database/app_database.dart';

enum DiscountMode { none, percent, fixed }

enum LineKind { labor, material, service, product }

enum QuoteStatus { draft, sent, accepted, rejected }

enum QuoteDisplayStatus { draft, sent, accepted, rejected, expired }

enum UnitCode { unit, hour, day, meter, squareMeter, kg }

const unitCodes = <String>[
  'unit',
  'hour',
  'day',
  'meter',
  'squareMeter',
  'kg',
];

DateTime dateOnly(DateTime value) => DateTime(value.year, value.month, value.day);

QuoteStatus parseQuoteStatus(String value) {
  return QuoteStatus.values.firstWhere(
    (status) => status.name == value,
    orElse: () => QuoteStatus.draft,
  );
}

DiscountMode parseDiscountMode(String value) {
  return DiscountMode.values.firstWhere(
    (mode) => mode.name == value,
    orElse: () => DiscountMode.none,
  );
}

QuoteDisplayStatus displayStatusOf({
  required String status,
  required DateTime validUntil,
  DateTime? now,
}) {
  final parsed = parseQuoteStatus(status);
  if (parsed == QuoteStatus.sent &&
      dateOnly(validUntil).isBefore(dateOnly(now ?? DateTime.now()))) {
    return QuoteDisplayStatus.expired;
  }
  return switch (parsed) {
    QuoteStatus.draft => QuoteDisplayStatus.draft,
    QuoteStatus.sent => QuoteDisplayStatus.sent,
    QuoteStatus.accepted => QuoteDisplayStatus.accepted,
    QuoteStatus.rejected => QuoteDisplayStatus.rejected,
  };
}

class QuoteLineDraft {
  const QuoteLineDraft({
    required this.key,
    this.catalogItemId,
    required this.name,
    this.description = '',
    required this.unit,
    required this.kind,
    required this.quantityMilli,
    required this.unitPriceMinor,
  });

  final int key;
  final int? catalogItemId;
  final String name;
  final String description;
  final String unit;
  final String kind;
  final int quantityMilli;
  final int unitPriceMinor;

  int get lineTotal => lineTotalMinor(
    quantityMilli: quantityMilli,
    unitPriceMinor: unitPriceMinor,
  );

  QuoteLineDraft copyWith({
    int? catalogItemId,
    String? name,
    String? description,
    String? unit,
    String? kind,
    int? quantityMilli,
    int? unitPriceMinor,
    bool clearCatalog = false,
  }) {
    return QuoteLineDraft(
      key: key,
      catalogItemId: clearCatalog ? null : catalogItemId ?? this.catalogItemId,
      name: name ?? this.name,
      description: description ?? this.description,
      unit: unit ?? this.unit,
      kind: kind ?? this.kind,
      quantityMilli: quantityMilli ?? this.quantityMilli,
      unitPriceMinor: unitPriceMinor ?? this.unitPriceMinor,
    );
  }
}

class QuoteTotals {
  const QuoteTotals({
    required this.subtotalMinor,
    required this.discountMinor,
    required this.taxableMinor,
    required this.taxMinor,
    required this.feeMinor,
    required this.totalMinor,
  });

  final int subtotalMinor;
  final int discountMinor;
  final int taxableMinor;
  final int taxMinor;
  final int feeMinor;
  final int totalMinor;
}

QuoteTotals calculateTotals({
  required List<QuoteLineDraft> lines,
  required DiscountMode discountMode,
  required int discountBps,
  required int discountFixedMinor,
  required int taxRateBps,
  required int feeMinor,
}) {
  final subtotal = lines.fold<int>(0, (sum, line) => sum + line.lineTotal);
  final rawDiscount = switch (discountMode) {
    DiscountMode.none => 0,
    DiscountMode.percent => percentOf(subtotal, discountBps),
    DiscountMode.fixed => discountFixedMinor,
  };
  final discount = rawDiscount.clamp(0, subtotal);
  final taxable = subtotal - discount;
  final tax = percentOf(taxable, taxRateBps);
  final fee = feeMinor < 0 ? 0 : feeMinor;
  return QuoteTotals(
    subtotalMinor: subtotal,
    discountMinor: discount,
    taxableMinor: taxable,
    taxMinor: tax,
    feeMinor: fee,
    totalMinor: taxable + tax + fee,
  );
}

class QuoteDraft {
  QuoteDraft({
    this.id,
    this.clientId,
    this.clientName = '',
    this.clientCompany = '',
    this.clientEmail = '',
    this.clientPhone = '',
    this.clientAddress = '',
    this.clientTaxId = '',
    required this.number,
    required this.issueDate,
    required this.validUntil,
    required this.currencyCode,
    this.notes = '',
    this.terms = '',
    this.discountMode = DiscountMode.none,
    this.discountBps = 0,
    this.discountFixedMinor = 0,
    this.taxRateBps = 0,
    this.feeLabel = '',
    this.feeMinor = 0,
    this.status = QuoteStatus.draft,
    List<QuoteLineDraft>? lines,
  }) : lines = lines ?? <QuoteLineDraft>[];

  final int? id;
  final int? clientId;
  final String clientName;
  final String clientCompany;
  final String clientEmail;
  final String clientPhone;
  final String clientAddress;
  final String clientTaxId;
  final String number;
  final DateTime issueDate;
  final DateTime validUntil;
  final String currencyCode;
  final String notes;
  final String terms;
  final DiscountMode discountMode;
  final int discountBps;
  final int discountFixedMinor;
  final int taxRateBps;
  final String feeLabel;
  final int feeMinor;
  final QuoteStatus status;
  final List<QuoteLineDraft> lines;

  QuoteTotals get totals => calculateTotals(
    lines: lines,
    discountMode: discountMode,
    discountBps: discountBps,
    discountFixedMinor: discountFixedMinor,
    taxRateBps: taxRateBps,
    feeMinor: feeMinor,
  );

  QuoteDraft copyWith({
    int? id,
    bool clearId = false,
    int? clientId,
    bool clearClient = false,
    String? clientName,
    String? clientCompany,
    String? clientEmail,
    String? clientPhone,
    String? clientAddress,
    String? clientTaxId,
    String? number,
    DateTime? issueDate,
    DateTime? validUntil,
    String? currencyCode,
    String? notes,
    String? terms,
    DiscountMode? discountMode,
    int? discountBps,
    int? discountFixedMinor,
    int? taxRateBps,
    String? feeLabel,
    int? feeMinor,
    QuoteStatus? status,
    List<QuoteLineDraft>? lines,
  }) {
    return QuoteDraft(
      id: clearId ? null : id ?? this.id,
      clientId: clearClient ? null : clientId ?? this.clientId,
      clientName: clientName ?? this.clientName,
      clientCompany: clientCompany ?? this.clientCompany,
      clientEmail: clientEmail ?? this.clientEmail,
      clientPhone: clientPhone ?? this.clientPhone,
      clientAddress: clientAddress ?? this.clientAddress,
      clientTaxId: clientTaxId ?? this.clientTaxId,
      number: number ?? this.number,
      issueDate: issueDate ?? this.issueDate,
      validUntil: validUntil ?? this.validUntil,
      currencyCode: currencyCode ?? this.currencyCode,
      notes: notes ?? this.notes,
      terms: terms ?? this.terms,
      discountMode: discountMode ?? this.discountMode,
      discountBps: discountBps ?? this.discountBps,
      discountFixedMinor: discountFixedMinor ?? this.discountFixedMinor,
      taxRateBps: taxRateBps ?? this.taxRateBps,
      feeLabel: feeLabel ?? this.feeLabel,
      feeMinor: feeMinor ?? this.feeMinor,
      status: status ?? this.status,
      lines: lines ?? this.lines,
    );
  }
}

class QuoteDocument {
  const QuoteDocument({
    required this.number,
    required this.status,
    required this.expired,
    required this.clientName,
    required this.clientCompany,
    required this.clientEmail,
    required this.clientPhone,
    required this.clientAddress,
    required this.clientTaxId,
    required this.issueDate,
    required this.validUntil,
    required this.currencyCode,
    required this.notes,
    required this.terms,
    required this.businessName,
    required this.businessOwner,
    required this.businessTaxId,
    required this.businessEmail,
    required this.businessPhone,
    required this.businessAddress,
    required this.businessWebsite,
    required this.tagline,
    required this.footer,
    required this.logoPath,
    required this.lines,
    required this.discountMode,
    required this.discountBps,
    required this.discountFixedMinor,
    required this.taxRateBps,
    required this.feeLabel,
    required this.feeMinor,
  });

  final String number;
  final QuoteStatus status;
  final bool expired;
  final String clientName;
  final String clientCompany;
  final String clientEmail;
  final String clientPhone;
  final String clientAddress;
  final String clientTaxId;
  final DateTime issueDate;
  final DateTime validUntil;
  final String currencyCode;
  final String notes;
  final String terms;
  final String businessName;
  final String businessOwner;
  final String businessTaxId;
  final String businessEmail;
  final String businessPhone;
  final String businessAddress;
  final String businessWebsite;
  final String tagline;
  final String footer;
  final String? logoPath;
  final List<QuoteLineDraft> lines;
  final DiscountMode discountMode;
  final int discountBps;
  final int discountFixedMinor;
  final int taxRateBps;
  final String feeLabel;
  final int feeMinor;

  QuoteTotals get totals => calculateTotals(
    lines: lines,
    discountMode: discountMode,
    discountBps: discountBps,
    discountFixedMinor: discountFixedMinor,
    taxRateBps: taxRateBps,
    feeMinor: feeMinor,
  );
}

String formatQuoteNumber(String prefix, int number) {
  final clean = prefix.trim().isEmpty ? 'COT-' : prefix.trim();
  return '$clean${number.toString().padLeft(4, '0')}';
}

String composeBusinessAddress(BusinessProfile profile) {
  return composeAddressParts(
    line: profile.addressLine,
    postalCode: profile.postalCode,
    city: profile.city,
    region: profile.region,
    country: profile.country,
  );
}

String composeAddressParts({
  String? line,
  String? postalCode,
  String? city,
  String? region,
  String? country,
}) {
  String clean(String? value) => value?.trim() ?? '';
  final cityLine = [
    clean(postalCode),
    clean(city),
  ].where((part) => part.isNotEmpty).join(' ');
  final regionLine = [
    clean(region),
    clean(country),
  ].where((part) => part.isNotEmpty).join(', ');
  return [
    clean(line),
    cityLine,
    regionLine,
  ].where((part) => part.isNotEmpty).join('\n');
}

QuoteDocument documentFromDraft(
  QuoteDraft draft, {
  required BusinessProfile profile,
  String? logoPath,
}) {
  final display = displayStatusOf(
    status: draft.status.name,
    validUntil: draft.validUntil,
  );
  return QuoteDocument(
    number: draft.number,
    status: draft.status,
    expired: display == QuoteDisplayStatus.expired,
    clientName: draft.clientName,
    clientCompany: draft.clientCompany,
    clientEmail: draft.clientEmail,
    clientPhone: draft.clientPhone,
    clientAddress: draft.clientAddress,
    clientTaxId: draft.clientTaxId,
    issueDate: draft.issueDate,
    validUntil: draft.validUntil,
    currencyCode: draft.currencyCode,
    notes: draft.notes,
    terms: draft.terms,
    businessName: profile.businessName,
    businessOwner: profile.ownerName,
    businessTaxId: profile.taxId ?? '',
    businessEmail: profile.email ?? '',
    businessPhone: profile.phone ?? '',
    businessAddress: composeBusinessAddress(profile),
    businessWebsite: profile.website ?? '',
    tagline: profile.tagline,
    footer: profile.pdfFooter,
    logoPath: logoPath ?? profile.logoPath,
    lines: draft.lines,
    discountMode: draft.discountMode,
    discountBps: draft.discountBps,
    discountFixedMinor: draft.discountFixedMinor,
    taxRateBps: draft.taxRateBps,
    feeLabel: draft.feeLabel,
    feeMinor: draft.feeMinor,
  );
}

QuoteDocument documentFromStored(
  Quotation quote,
  List<QuotationLine> lines,
) {
  final display = displayStatusOf(
    status: quote.status,
    validUntil: quote.validUntil,
  );
  return QuoteDocument(
    number: quote.number,
    status: parseQuoteStatus(quote.status),
    expired: display == QuoteDisplayStatus.expired,
    clientName: quote.clientName,
    clientCompany: quote.clientCompany ?? '',
    clientEmail: quote.clientEmail ?? '',
    clientPhone: quote.clientPhone ?? '',
    clientAddress: quote.clientAddress ?? '',
    clientTaxId: quote.clientTaxId ?? '',
    issueDate: quote.issueDate,
    validUntil: quote.validUntil,
    currencyCode: quote.currencyCode,
    notes: quote.notes,
    terms: quote.terms,
    businessName: quote.businessName,
    businessOwner: quote.businessOwner,
    businessTaxId: quote.businessTaxId ?? '',
    businessEmail: quote.businessEmail ?? '',
    businessPhone: quote.businessPhone ?? '',
    businessAddress: quote.businessAddress ?? '',
    businessWebsite: quote.businessWebsite ?? '',
    tagline: quote.businessTagline,
    footer: quote.businessFooter,
    logoPath: quote.logoSnapshotPath,
    lines: [
      for (final line in lines)
        QuoteLineDraft(
          key: line.id,
          catalogItemId: line.catalogItemId,
          name: line.name,
          description: line.description ?? '',
          unit: line.unit,
          kind: line.kind,
          quantityMilli: line.quantityMilli,
          unitPriceMinor: line.unitPriceMinor,
        ),
    ],
    discountMode: parseDiscountMode(quote.discountMode),
    discountBps: quote.discountBps,
    discountFixedMinor: quote.discountFixedMinor,
    taxRateBps: quote.taxRateBps,
    feeLabel: quote.feeLabel,
    feeMinor: quote.feeMinor,
  );
}

QuoteDraft draftFromStored(Quotation quote, List<QuotationLine> lines) {
  final document = documentFromStored(quote, lines);
  return QuoteDraft(
    id: quote.id,
    clientId: quote.clientId,
    clientName: document.clientName,
    clientCompany: document.clientCompany,
    clientEmail: document.clientEmail,
    clientPhone: document.clientPhone,
    clientAddress: document.clientAddress,
    clientTaxId: document.clientTaxId,
    number: document.number,
    issueDate: document.issueDate,
    validUntil: document.validUntil,
    currencyCode: document.currencyCode,
    notes: document.notes,
    terms: document.terms,
    discountMode: document.discountMode,
    discountBps: document.discountBps,
    discountFixedMinor: document.discountFixedMinor,
    taxRateBps: document.taxRateBps,
    feeLabel: document.feeLabel,
    feeMinor: document.feeMinor,
    status: document.status,
    lines: document.lines,
  );
}

class PdfOptions {
  const PdfOptions({
    required this.showLogo,
    required this.showBranding,
    required this.showNotes,
    required this.showTerms,
    required this.showSignature,
    required this.showTagline,
  });

  final bool showLogo;
  final bool showBranding;
  final bool showNotes;
  final bool showTerms;
  final bool showSignature;
  final bool showTagline;

  factory PdfOptions.fromSettings(AppSetting settings) {
    final pro = settings.isPro;
    return PdfOptions(
      showLogo: pro && settings.pdfShowLogo,
      showBranding: !(pro && settings.pdfHideBranding),
      showNotes: settings.pdfShowNotes,
      showTerms: settings.pdfShowTerms,
      showSignature: pro && settings.pdfShowSignature,
      showTagline: pro && settings.pdfShowTagline,
    );
  }
}
