import 'package:cotizapro/core/errors/app_exceptions.dart';
import 'package:cotizapro/data/database/app_database.dart';
import 'package:cotizapro/core/l10n/l10n_ext.dart';
import 'package:cotizapro/core/money/money.dart';
import 'package:cotizapro/core/widgets/app_widgets.dart';
import 'package:cotizapro/data/providers.dart';
import 'package:cotizapro/features/pro/limit_dialog.dart';
import 'package:cotizapro/features/quotations/quote_labels.dart';
import 'package:cotizapro/features/quotations/quote_models.dart';
import 'package:cotizapro/features/quotations/quote_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

class QuotationDetailScreen extends ConsumerWidget {
  const QuotationDetailScreen({super.key, required this.id});

  final int id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final quotes = ref.watch(quotesProvider);
    final lines = ref.watch(quoteLinesProvider(id));
    final quote = quotes.asData?.value.where((item) => item.id == id).firstOrNull;
    final storedLines = lines.asData?.value;
    return Scaffold(
      appBar: AppBar(
        title: Text(quote?.number ?? l10n.quotesTitle),
        actions: [
          if (quote != null)
            PopupMenuButton<String>(
              onSelected: (value) => _onMenu(context, ref, value),
              itemBuilder: (context) => [
                PopupMenuItem(value: 'edit', child: Text(l10n.edit)),
                PopupMenuItem(value: 'pdf', child: Text(l10n.previewPdf)),
                PopupMenuItem(value: 'share', child: Text(l10n.sharePdf)),
                PopupMenuItem(value: 'duplicate', child: Text(l10n.duplicate)),
                PopupMenuItem(value: 'delete', child: Text(l10n.delete)),
              ],
            ),
        ],
      ),
      body: quotes.isLoading || lines.isLoading
          ? const LoadingView()
          : quote == null || storedLines == null
          ? ErrorView(message: l10n.errorGeneric, retryLabel: l10n.retry)
          : _body(context, ref, quote, storedLines),
    );
  }

  Widget _body(BuildContext context, WidgetRef ref, Quotation quote, List<QuotationLine> lines) {
    final l10n = context.l10n;
    final locale = Localizations.localeOf(context).toString();
    final document = documentFromStored(quote, lines);
    final display = displayStatusOf(status: quote.status, validUntil: quote.validUntil);
    return ListView(
      padding: const EdgeInsets.fromLTRB(20, 8, 20, 32),
      children: [
        Row(
          children: [
            Expanded(child: Text(document.number, style: context.text.headlineMedium)),
            StatusBadge(label: statusLabel(l10n, display), tone: statusTone(display)),
          ],
        ),
        const SizedBox(height: 8),
        Text(l10n.changeStatus, style: context.text.bodySmall),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          children: [
            for (final status in QuoteStatus.values)
              ChoiceChip(
                label: Text(switch (status) {
                  QuoteStatus.draft => l10n.statusDraft,
                  QuoteStatus.sent => l10n.statusSent,
                  QuoteStatus.accepted => l10n.statusAccepted,
                  QuoteStatus.rejected => l10n.statusRejected,
                }),
                selected: quote.status == status.name,
                onSelected: (_) => ref.read(quotationRepositoryProvider).updateStatus(id, status),
              ),
          ],
        ),
        const SizedBox(height: 16),
        SurfacePanel(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(document.clientName, style: context.text.titleMedium),
              if (document.clientCompany.isNotEmpty) Text(document.clientCompany),
              if (document.clientEmail.isNotEmpty) Text(document.clientEmail),
              if (document.clientPhone.isNotEmpty) Text(document.clientPhone),
              if (document.clientAddress.isNotEmpty) Text(document.clientAddress),
              const SizedBox(height: 12),
              Text('${l10n.issueDate}: ${DateFormat.yMMMd(locale).format(document.issueDate.toLocal())}'),
              Text('${l10n.validUntil}: ${DateFormat.yMMMd(locale).format(document.validUntil.toLocal())}'),
            ],
          ),
        ),
        const SizedBox(height: 16),
        SurfacePanel(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Column(
            children: [
              for (final line in document.lines)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(line.name, style: context.text.titleSmall),
                            Text(
                              '${formatQuantity(line.quantityMilli, locale)} ${unitLabel(l10n, line.unit)} · ${kindLabel(l10n, line.kind)}',
                              style: context.text.bodySmall,
                            ),
                          ],
                        ),
                      ),
                      Text(formatMoney(line.lineTotal, document.currencyCode, locale)),
                    ],
                  ),
                ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        SurfacePanel(
          child: TotalsBlock(
            totals: document.totals,
            currencyCode: document.currencyCode,
            discountMode: document.discountMode,
            discountBps: document.discountBps,
            taxRateBps: document.taxRateBps,
            feeLabel: document.feeLabel,
          ),
        ),
        if (document.notes.trim().isNotEmpty) ...[
          const SizedBox(height: 16),
          Text(l10n.notes, style: context.text.titleSmall),
          const SizedBox(height: 4),
          Text(document.notes),
        ],
        if (document.terms.trim().isNotEmpty) ...[
          const SizedBox(height: 12),
          Text(l10n.terms, style: context.text.titleSmall),
          const SizedBox(height: 4),
          Text(document.terms),
        ],
        const SizedBox(height: 20),
        PrimaryButton(
          label: l10n.previewPdf,
          icon: Icons.picture_as_pdf_outlined,
          onPressed: () => context.push('/quote/$id/pdf'),
        ),
        const SizedBox(height: 8),
        SecondaryButton(
          label: l10n.edit,
          onPressed: () => context.push('/quote/$id/edit'),
        ),
      ],
    );
  }

  Future<void> _onMenu(BuildContext context, WidgetRef ref, String value) async {
    final l10n = context.l10n;
    switch (value) {
      case 'edit':
        context.push('/quote/$id/edit');
      case 'pdf':
      case 'share':
        context.push('/quote/$id/pdf');
      case 'duplicate':
        final isPro = ref.read(settingsProvider).asData?.value.isPro ?? false;
        final profile = await ref.read(profileRepositoryProvider).get();
        try {
          final newId = await ref.read(quotationRepositoryProvider).duplicate(
            id: id,
            profile: profile,
            isPro: isPro,
          );
          if (context.mounted) context.push('/quote/$newId');
        } on QuoteLimitException {
          if (context.mounted) {
            await showProLimitDialog(context, title: l10n.quoteLimitTitle, body: l10n.quoteLimitBody);
          }
        } catch (_) {
          if (context.mounted) showAppMessage(context, l10n.errorGeneric);
        }
      case 'delete':
        final confirmed = await showConfirmDialog(
          context,
          title: l10n.deleteQuoteTitle,
          body: l10n.deleteQuoteBody,
          confirmLabel: l10n.delete,
          cancelLabel: l10n.cancel,
          destructive: true,
        );
        if (!confirmed) return;
        await ref.read(quotationRepositoryProvider).deleteQuote(id);
        if (context.mounted) {
          showAppMessage(context, l10n.deleted);
          context.pop();
        }
    }
  }
}
