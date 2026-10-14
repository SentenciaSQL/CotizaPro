import 'dart:io';

import 'package:cotizapro/core/money/money.dart';
import 'package:cotizapro/features/quotations/quote_models.dart';
import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class PdfLabels {
  const PdfLabels({
    required this.quote,
    required this.billTo,
    required this.from,
    required this.number,
    required this.currency,
    required this.issueDate,
    required this.validUntil,
    required this.concept,
    required this.qty,
    required this.unit,
    required this.price,
    required this.amount,
    required this.subtotal,
    required this.discount,
    required this.tax,
    required this.fee,
    required this.total,
    required this.notes,
    required this.terms,
    required this.page,
    required this.madeWith,
    required this.draft,
    required this.acceptedBy,
    required this.date,
    required this.signature,
    required this.kind,
    required this.unitName,
  });

  final String quote;
  final String billTo;
  final String from;
  final String number;
  final String currency;
  final String issueDate;
  final String validUntil;
  final String concept;
  final String qty;
  final String unit;
  final String price;
  final String amount;
  final String subtotal;
  final String discount;
  final String tax;
  final String fee;
  final String total;
  final String notes;
  final String terms;
  final String Function(int current, int total) page;
  final String madeWith;
  final String draft;
  final String acceptedBy;
  final String date;
  final String signature;
  final String Function(String kind) kind;
  final String Function(String unit) unitName;
}

class PdfService {
  Future<Uint8List> build({
    required QuoteDocument document,
    required PdfOptions options,
    required PdfLabels labels,
    required String locale,
  }) async {
    final fonts = await _fonts();
    final navy = const PdfColor(11 / 255, 31 / 255, 58 / 255);
    final teal = const PdfColor(14 / 255, 124 / 255, 120 / 255);
    final ink = const PdfColor(20 / 255, 32 / 255, 51 / 255);
    final muted = const PdfColor(92 / 255, 107 / 255, 126 / 255);
    final line = const PdfColor(225 / 255, 231 / 255, 238 / 255);
    final soft = const PdfColor(243 / 255, 245 / 255, 247 / 255);
    final totals = document.totals;
    pw.MemoryImage? logo;
    if (options.showLogo && document.logoPath != null) {
      final file = File(document.logoPath!);
      if (await file.exists()) {
        final bytes = await file.readAsBytes();
        if (bytes.isNotEmpty) logo = pw.MemoryImage(bytes);
      }
    }

    final doc = pw.Document(
      theme: pw.ThemeData.withFont(base: fonts.regular, bold: fonts.bold),
      title: '${labels.quote} ${document.number}',
      author: document.businessName,
    );

    doc.addPage(
      pw.MultiPage(
        maxPages: 80,
        pageTheme: pw.PageTheme(
          pageFormat: PdfPageFormat.a4,
          margin: const pw.EdgeInsets.fromLTRB(40, 36, 40, 48),
          theme: pw.ThemeData.withFont(base: fonts.regular, bold: fonts.bold),
          buildBackground: (context) {
            if (document.status != QuoteStatus.draft) return pw.SizedBox();
            return pw.FullPage(
              ignoreMargins: true,
              child: pw.Center(
                child: pw.Transform.rotate(
                  angle: -0.5,
                  child: pw.Text(
                    labels.draft,
                    style: pw.TextStyle(
                      font: fonts.bold,
                      fontSize: 64,
                      color: const PdfColor(0.90, 0.93, 0.95),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
        header: (context) {
          if (context.pageNumber == 1) return pw.SizedBox();
          return pw.Container(
            margin: const pw.EdgeInsets.only(bottom: 12),
            padding: const pw.EdgeInsets.only(bottom: 8),
            decoration: pw.BoxDecoration(
              border: pw.Border(bottom: pw.BorderSide(color: line, width: 0.6)),
            ),
            child: pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
              children: [
                pw.Text(
                  document.businessName.isEmpty
                      ? labels.quote
                      : document.businessName,
                  style: pw.TextStyle(
                    font: fonts.semibold,
                    fontSize: 11,
                    color: navy,
                  ),
                ),
                pw.Text(
                  document.number,
                  style: pw.TextStyle(fontSize: 11, color: muted),
                ),
              ],
            ),
          );
        },
        footer: (context) {
          return pw.Container(
            margin: const pw.EdgeInsets.only(top: 8),
            child: pw.Column(
              children: [
                pw.Container(height: 0.6, color: line),
                pw.SizedBox(height: 8),
                pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  children: [
                    pw.Expanded(
                      child: pw.Text(
                        options.showBranding
                            ? labels.madeWith
                            : document.footer,
                        style: pw.TextStyle(fontSize: 8, color: muted),
                      ),
                    ),
                    pw.Text(
                      labels.page(context.pageNumber, context.pagesCount),
                      style: pw.TextStyle(fontSize: 8, color: muted),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
        build: (context) => [
          pw.Row(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              if (logo != null) ...[
                pw.Container(
                  width: 56,
                  height: 56,
                  margin: const pw.EdgeInsets.only(right: 12),
                  child: pw.Image(logo, fit: pw.BoxFit.contain),
                ),
              ],
              pw.Expanded(
                child: pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Text(
                      document.businessName.isEmpty
                          ? labels.quote
                          : document.businessName,
                      style: pw.TextStyle(
                        font: fonts.bold,
                        fontSize: 18,
                        color: navy,
                      ),
                    ),
                    if (options.showTagline &&
                        document.tagline.trim().isNotEmpty)
                      pw.Padding(
                        padding: const pw.EdgeInsets.only(top: 2),
                        child: pw.Text(
                          document.tagline,
                          style: pw.TextStyle(fontSize: 10, color: teal),
                        ),
                      ),
                    if (document.businessOwner.trim().isNotEmpty)
                      pw.Text(
                        document.businessOwner,
                        style: pw.TextStyle(fontSize: 10, color: muted),
                      ),
                  ],
                ),
              ),
              pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.end,
                children: [
                  pw.Text(
                    labels.quote.toUpperCase(),
                    style: pw.TextStyle(
                      font: fonts.semibold,
                      fontSize: 11,
                      color: teal,
                      letterSpacing: 1.2,
                    ),
                  ),
                  pw.SizedBox(height: 4),
                  pw.Text(
                    document.number,
                    style: pw.TextStyle(
                      font: fonts.bold,
                      fontSize: 16,
                      color: navy,
                    ),
                  ),
                ],
              ),
            ],
          ),
          pw.SizedBox(height: 10),
          pw.Container(height: 2, color: teal),
          pw.SizedBox(height: 16),
          pw.Row(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Expanded(
                child: _party(
                  labels.from,
                  _businessLines(document),
                  fonts,
                  ink,
                  muted,
                ),
              ),
              pw.SizedBox(width: 16),
              pw.Expanded(
                child: _party(
                  labels.billTo,
                  _clientLines(document),
                  fonts,
                  ink,
                  muted,
                ),
              ),
            ],
          ),
          pw.SizedBox(height: 14),
          pw.Container(
            padding: const pw.EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: pw.BoxDecoration(
              color: soft,
              borderRadius: pw.BorderRadius.circular(6),
            ),
            child: pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
              children: [
                _meta(
                  labels.issueDate,
                  _date(document.issueDate, locale),
                  fonts,
                  muted,
                  ink,
                ),
                _meta(
                  labels.validUntil,
                  _date(document.validUntil, locale),
                  fonts,
                  muted,
                  ink,
                ),
                _meta(
                  labels.currency,
                  document.currencyCode,
                  fonts,
                  muted,
                  ink,
                ),
              ],
            ),
          ),
          pw.SizedBox(height: 16),
          _table(document, labels, locale, fonts, navy, ink, muted, line),
          pw.SizedBox(height: 12),
          pw.Row(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Expanded(child: pw.SizedBox()),
              pw.SizedBox(
                width: 230,
                child: _totals(
                  document,
                  totals,
                  labels,
                  locale,
                  fonts,
                  navy,
                  muted,
                  teal,
                ),
              ),
            ],
          ),
          if (options.showNotes && document.notes.trim().isNotEmpty) ...[
            pw.SizedBox(height: 18),
            _block(labels.notes, document.notes, fonts, navy, ink),
          ],
          if (options.showTerms && document.terms.trim().isNotEmpty) ...[
            pw.SizedBox(height: 12),
            _block(labels.terms, document.terms, fonts, navy, ink),
          ],
          if (document.footer.trim().isNotEmpty && options.showBranding) ...[
            pw.SizedBox(height: 12),
            pw.Text(
              document.footer,
              style: pw.TextStyle(fontSize: 9, color: muted),
            ),
          ],
          if (options.showSignature) ...[
            pw.SizedBox(height: 28),
            pw.Row(
              children: [
                _signLine(labels.acceptedBy, fonts, muted, line),
                pw.SizedBox(width: 24),
                _signLine(labels.date, fonts, muted, line),
                pw.SizedBox(width: 24),
                _signLine(labels.signature, fonts, muted, line),
              ],
            ),
          ],
        ],
      ),
    );
    return doc.save();
  }

  pw.Widget _party(
    String title,
    List<String> lines,
    _Fonts fonts,
    PdfColor ink,
    PdfColor muted,
  ) {
    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.Text(
          title.toUpperCase(),
          style: pw.TextStyle(
            font: fonts.semibold,
            fontSize: 8,
            color: muted,
            letterSpacing: 0.6,
          ),
        ),
        pw.SizedBox(height: 4),
        for (var i = 0; i < lines.length; i++)
          pw.Text(
            lines[i],
            style: pw.TextStyle(
              font: i == 0 ? fonts.semibold : fonts.regular,
              fontSize: i == 0 ? 11 : 9,
              color: ink,
            ),
          ),
      ],
    );
  }

  List<String> _businessLines(QuoteDocument document) {
    return [
      if (document.businessName.trim().isNotEmpty) document.businessName,
      if (document.businessTaxId.trim().isNotEmpty) document.businessTaxId,
      if (document.businessAddress.trim().isNotEmpty) document.businessAddress,
      if (document.businessPhone.trim().isNotEmpty) document.businessPhone,
      if (document.businessEmail.trim().isNotEmpty) document.businessEmail,
      if (document.businessWebsite.trim().isNotEmpty) document.businessWebsite,
    ];
  }

  List<String> _clientLines(QuoteDocument document) {
    return [
      if (document.clientName.trim().isNotEmpty) document.clientName,
      if (document.clientCompany.trim().isNotEmpty) document.clientCompany,
      if (document.clientTaxId.trim().isNotEmpty) document.clientTaxId,
      if (document.clientAddress.trim().isNotEmpty) document.clientAddress,
      if (document.clientPhone.trim().isNotEmpty) document.clientPhone,
      if (document.clientEmail.trim().isNotEmpty) document.clientEmail,
    ];
  }

  pw.Widget _meta(
    String label,
    String value,
    _Fonts fonts,
    PdfColor muted,
    PdfColor ink,
  ) {
    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.Text(label, style: pw.TextStyle(fontSize: 8, color: muted)),
        pw.Text(
          value,
          style: pw.TextStyle(font: fonts.semibold, fontSize: 11, color: ink),
        ),
      ],
    );
  }

  pw.Widget _table(
    QuoteDocument document,
    PdfLabels labels,
    String locale,
    _Fonts fonts,
    PdfColor navy,
    PdfColor ink,
    PdfColor muted,
    PdfColor line,
  ) {
    pw.Widget cell(
      String text, {
      bool header = false,
      bool right = false,
      bool bold = false,
    }) {
      return pw.Padding(
        padding: const pw.EdgeInsets.symmetric(horizontal: 6, vertical: 6),
        child: pw.Text(
          text,
          textAlign: right ? pw.TextAlign.right : pw.TextAlign.left,
          style: pw.TextStyle(
            font: header || bold ? fonts.semibold : fonts.regular,
            fontSize: header ? 8 : 9,
            color: header ? PdfColors.white : ink,
          ),
        ),
      );
    }

    return pw.Table(
      border: pw.TableBorder(
        bottom: pw.BorderSide(color: line, width: 0.4),
        horizontalInside: pw.BorderSide(color: line, width: 0.3),
      ),
      columnWidths: {
        0: const pw.FlexColumnWidth(4.4),
        1: const pw.FlexColumnWidth(1.1),
        2: const pw.FlexColumnWidth(1.3),
        3: const pw.FlexColumnWidth(1.8),
        4: const pw.FlexColumnWidth(1.8),
      },
      children: [
        pw.TableRow(
          decoration: pw.BoxDecoration(color: navy),
          children: [
            cell(labels.concept, header: true),
            cell(labels.qty, header: true, right: true),
            cell(labels.unit, header: true),
            cell(labels.price, header: true, right: true),
            cell(labels.amount, header: true, right: true),
          ],
        ),
        for (final line in document.lines)
          pw.TableRow(
            children: [
              pw.Padding(
                padding: const pw.EdgeInsets.symmetric(
                  horizontal: 6,
                  vertical: 6,
                ),
                child: pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Text(
                      line.name,
                      style: pw.TextStyle(
                        font: fonts.semibold,
                        fontSize: 9,
                        color: ink,
                      ),
                    ),
                    if (line.description.trim().isNotEmpty)
                      pw.Text(
                        line.description,
                        style: pw.TextStyle(fontSize: 8, color: muted),
                      ),
                    pw.Text(
                      labels.kind(line.kind),
                      style: pw.TextStyle(fontSize: 8, color: muted),
                    ),
                  ],
                ),
              ),
              cell(formatQuantity(line.quantityMilli, locale), right: true),
              cell(labels.unitName(line.unit)),
              cell(
                formatMoney(line.unitPriceMinor, document.currencyCode, locale),
                right: true,
              ),
              cell(
                formatMoney(line.lineTotal, document.currencyCode, locale),
                right: true,
                bold: true,
              ),
            ],
          ),
      ],
    );
  }

  pw.Widget _totals(
    QuoteDocument document,
    QuoteTotals totals,
    PdfLabels labels,
    String locale,
    _Fonts fonts,
    PdfColor navy,
    PdfColor muted,
    PdfColor teal,
  ) {
    String money(int value) =>
        formatMoney(value, document.currencyCode, locale);
    pw.Widget row(String label, String value, {bool strong = false}) {
      return pw.Padding(
        padding: const pw.EdgeInsets.symmetric(vertical: 2),
        child: pw.Row(
          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
          children: [
            pw.Text(
              label,
              style: pw.TextStyle(
                fontSize: 9,
                color: strong ? PdfColors.white : muted,
              ),
            ),
            pw.Text(
              value,
              style: pw.TextStyle(
                font: strong ? fonts.bold : fonts.semibold,
                fontSize: strong ? 12 : 9,
                color: strong ? PdfColors.white : navy,
              ),
            ),
          ],
        ),
      );
    }

    final discountLabel = document.discountMode == DiscountMode.percent
        ? '${labels.discount} (${formatPercentBps(document.discountBps, locale)})'
        : labels.discount;
    final taxLabel =
        '${labels.tax} (${formatPercentBps(document.taxRateBps, locale)})';
    final feeLabel = document.feeLabel.trim().isEmpty
        ? labels.fee
        : document.feeLabel.trim();
    return pw.Column(
      children: [
        row(labels.subtotal, money(totals.subtotalMinor)),
        if (totals.discountMinor > 0)
          row(discountLabel, '-${money(totals.discountMinor)}'),
        if (document.taxRateBps > 0) row(taxLabel, money(totals.taxMinor)),
        if (totals.feeMinor > 0) row(feeLabel, money(totals.feeMinor)),
        pw.SizedBox(height: 6),
        pw.Container(
          padding: const pw.EdgeInsets.symmetric(horizontal: 10, vertical: 8),
          decoration: pw.BoxDecoration(
            color: navy,
            borderRadius: pw.BorderRadius.circular(6),
          ),
          child: row(labels.total, money(totals.totalMinor), strong: true),
        ),
      ],
    );
  }

  pw.Widget _block(
    String title,
    String body,
    _Fonts fonts,
    PdfColor navy,
    PdfColor ink,
  ) {
    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.Text(
          title,
          style: pw.TextStyle(font: fonts.semibold, fontSize: 10, color: navy),
        ),
        pw.SizedBox(height: 3),
        pw.Text(
          body,
          style: pw.TextStyle(fontSize: 9, color: ink, lineSpacing: 2),
        ),
      ],
    );
  }

  pw.Widget _signLine(
    String label,
    _Fonts fonts,
    PdfColor muted,
    PdfColor line,
  ) {
    return pw.Expanded(
      child: pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          pw.Container(height: 0.6, color: line),
          pw.SizedBox(height: 4),
          pw.Text(label, style: pw.TextStyle(fontSize: 8, color: muted)),
        ],
      ),
    );
  }

  String _date(DateTime value, String locale) {
    final local = value.toLocal();
    const monthsEs = [
      'ene',
      'feb',
      'mar',
      'abr',
      'may',
      'jun',
      'jul',
      'ago',
      'sep',
      'oct',
      'nov',
      'dic',
    ];
    const monthsEn = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec',
    ];
    final months = locale.startsWith('es') ? monthsEs : monthsEn;
    return '${local.day} ${months[local.month - 1]} ${local.year}';
  }

  Future<_Fonts> _fonts() async {
    return _Fonts(
      regular: pw.Font.ttf(
        await rootBundle.load('assets/fonts/Manrope-Regular.ttf'),
      ),
      semibold: pw.Font.ttf(
        await rootBundle.load('assets/fonts/Manrope-SemiBold.ttf'),
      ),
      bold: pw.Font.ttf(await rootBundle.load('assets/fonts/Manrope-Bold.ttf')),
    );
  }
}

class _Fonts {
  const _Fonts({
    required this.regular,
    required this.semibold,
    required this.bold,
  });
  final pw.Font regular;
  final pw.Font semibold;
  final pw.Font bold;
}
