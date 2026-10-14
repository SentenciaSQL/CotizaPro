import 'package:cotizapro/core/l10n/l10n_ext.dart';
import 'package:cotizapro/core/widgets/app_widgets.dart';
import 'package:cotizapro/data/providers.dart';
import 'package:cotizapro/features/pdf/pdf_service.dart';
import 'package:cotizapro/features/quotations/quote_labels.dart';
import 'package:cotizapro/features/quotations/quote_models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:printing/printing.dart';

class PdfPreviewScreen extends ConsumerWidget {
  const PdfPreviewScreen({super.key, this.quotationId, this.document});

  final int? quotationId;
  final QuoteDocument? document;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    if (document != null) {
      return _preview(context, ref, document!);
    }
    final id = quotationId;
    if (id == null) {
      return Scaffold(
        appBar: AppBar(title: Text(l10n.previewPdf)),
        body: ErrorView(message: l10n.errorGeneric, retryLabel: l10n.retry),
      );
    }
    final quotes = ref.watch(quotesProvider);
    final lines = ref.watch(quoteLinesProvider(id));
    if (quotes.isLoading || lines.isLoading) {
      return Scaffold(
        appBar: AppBar(title: Text(l10n.previewPdf)),
        body: const LoadingView(),
      );
    }
    final quote = quotes.asData?.value
        .where((item) => item.id == id)
        .firstOrNull;
    final storedLines = lines.asData?.value;
    if (quote == null || storedLines == null) {
      return Scaffold(
        appBar: AppBar(title: Text(l10n.previewPdf)),
        body: ErrorView(message: l10n.errorGeneric, retryLabel: l10n.retry),
      );
    }
    return _preview(context, ref, documentFromStored(quote, storedLines));
  }

  Widget _preview(BuildContext context, WidgetRef ref, QuoteDocument document) {
    final l10n = context.l10n;
    final locale = Localizations.localeOf(context).toString();
    final settings = ref.watch(settingsProvider).asData?.value;
    final options = settings == null
        ? const PdfOptions(
            showLogo: false,
            showBranding: true,
            showNotes: true,
            showTerms: true,
            showSignature: false,
            showTagline: false,
          )
        : PdfOptions.fromSettings(settings);
    final labels = PdfLabels(
      quote: l10n.pdfQuote,
      billTo: l10n.pdfBillTo,
      from: l10n.pdfFrom,
      number: l10n.pdfNumber,
      currency: l10n.currency,
      issueDate: l10n.pdfIssueDate,
      validUntil: l10n.pdfValidUntil,
      concept: l10n.pdfConcept,
      qty: l10n.pdfQty,
      unit: l10n.pdfUnit,
      price: l10n.pdfPrice,
      amount: l10n.pdfAmount,
      subtotal: l10n.pdfSubtotal,
      discount: l10n.pdfDiscount,
      tax: l10n.pdfTax,
      fee: l10n.pdfFee,
      total: l10n.pdfTotal,
      notes: l10n.pdfNotes,
      terms: l10n.pdfTerms,
      page: l10n.pdfPage,
      madeWith: l10n.pdfMadeWith,
      draft: l10n.pdfDraft,
      acceptedBy: l10n.pdfAcceptedBy,
      date: l10n.pdfDate,
      signature: l10n.pdfSignature,
      kind: (kind) => kindLabel(l10n, kind),
      unitName: (unit) => unitLabel(l10n, unit),
    );
    return Scaffold(
      appBar: AppBar(
        title: Text(
          document.number.isEmpty ? l10n.previewPdf : document.number,
        ),
      ),
      body: PdfPreview(
        canChangeOrientation: false,
        canChangePageFormat: false,
        canDebug: false,
        pdfFileName:
            '${document.number.isEmpty ? 'cotizacion' : document.number}.pdf',
        loadingWidget: const LoadingView(),
        build: (format) {
          return PdfService().build(
            document: document,
            options: options,
            labels: labels,
            locale: locale,
          );
        },
      ),
    );
  }
}
