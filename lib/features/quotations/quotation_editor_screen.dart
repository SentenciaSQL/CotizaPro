import 'package:cotizapro/core/errors/app_exceptions.dart';
import 'package:cotizapro/core/l10n/l10n_ext.dart';
import 'package:cotizapro/core/money/money.dart';
import 'package:cotizapro/core/widgets/app_widgets.dart';
import 'package:cotizapro/data/database/app_database.dart';
import 'package:cotizapro/data/providers.dart';
import 'package:cotizapro/features/pro/limit_dialog.dart';
import 'package:cotizapro/features/quotations/quote_labels.dart';
import 'package:cotizapro/features/quotations/quote_models.dart';
import 'package:cotizapro/features/quotations/quote_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:printing/printing.dart';

import '../pdf/pdf_service.dart';

class QuotationEditorScreen extends ConsumerStatefulWidget {
  const QuotationEditorScreen({super.key, this.quotationId});

  final int? quotationId;

  @override
  ConsumerState<QuotationEditorScreen> createState() =>
      _QuotationEditorScreenState();
}

class _QuotationEditorScreenState extends ConsumerState<QuotationEditorScreen> {
  QuoteDraft? _draft;
  var _step = 0;
  var _dirty = false;
  var _loading = true;
  var _saving = false;
  var _lineKey = 1;
  String? _error;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    final profile = await ref.read(profileRepositoryProvider).get();
    final id = widget.quotationId;
    if (id == null) {
      final today = dateOnly(DateTime.now());
      setState(() {
        _draft = QuoteDraft(
          number: formatQuoteNumber(
            profile.quotePrefix,
            profile.nextQuoteNumber,
          ),
          issueDate: today,
          validUntil: today.add(Duration(days: profile.defaultValidityDays)),
          currencyCode: profile.currencyCode,
          notes: profile.defaultNotes,
          terms: profile.defaultTerms,
          taxRateBps: profile.defaultTaxBps,
        );
        _loading = false;
      });
      return;
    }
    final quote = await ref.read(quotationRepositoryProvider).getById(id);
    final lines = await ref.read(quotationRepositoryProvider).linesFor(id);
    if (!mounted) return;
    if (quote == null) {
      setState(() => _loading = false);
      return;
    }
    final draft = draftFromStored(quote, lines);
    _lineKey =
        draft.lines.fold(1, (max, line) => line.key > max ? line.key : max) + 1;
    setState(() {
      _draft = draft;
      _loading = false;
    });
  }

  void _update(QuoteDraft draft) {
    setState(() {
      _draft = draft;
      _dirty = true;
      _error = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final draft = _draft;
    final titles = [
      l10n.stepClient,
      l10n.stepItems,
      l10n.stepAmounts,
      l10n.stepReview,
    ];
    return PopScope(
      canPop: !_dirty && _step == 0,
      onPopInvokedWithResult: (didPop, result) async {
        if (didPop) return;
        if (_step > 0) {
          setState(() => _step -= 1);
          return;
        }
        final leave = await showConfirmDialog(
          context,
          title: l10n.unsavedTitle,
          body: l10n.unsavedBody,
          confirmLabel: l10n.discard,
          cancelLabel: l10n.keepEditing,
          destructive: true,
        );
        if (leave && context.mounted) context.pop();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(draft == null ? l10n.newQuote : titles[_step]),
          actions: [
            if (draft != null)
              IconButton(
                tooltip: l10n.previewPdf,
                onPressed: () => _preview(draft),
                icon: const Icon(Icons.picture_as_pdf_outlined),
              ),
          ],
        ),
        body: _loading
            ? const LoadingView()
            : draft == null
            ? ErrorView(message: l10n.errorGeneric, retryLabel: l10n.retry)
            : Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          l10n.stepOf(_step + 1, 4),
                          style: context.text.bodySmall,
                        ),
                        const SizedBox(height: 8),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(99),
                          child: LinearProgressIndicator(
                            value: (_step + 1) / 4,
                            minHeight: 4,
                            backgroundColor: context.palette.surfaceMuted,
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (_error != null)
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 20, 8),
                      child: Text(
                        _error!,
                        style: context.text.bodyMedium?.copyWith(
                          color: context.palette.danger,
                        ),
                      ),
                    ),
                  Expanded(
                    child: AnimatedSwitcher(
                      duration: const Duration(milliseconds: 180),
                      child: KeyedSubtree(
                        key: ValueKey(_step),
                        child: switch (_step) {
                          0 => _clientStep(draft),
                          1 => _itemsStep(draft),
                          2 => _amountsStep(draft),
                          _ => _reviewStep(draft),
                        },
                      ),
                    ),
                  ),
                  if (MediaQuery.viewInsetsOf(context).bottom == 0)
                    _footer(draft),
                ],
              ),
      ),
    );
  }

  Widget _clientStep(QuoteDraft draft) {
    final l10n = context.l10n;
    final locale = Localizations.localeOf(context).toString();
    return ListView(
      padding: const EdgeInsets.fromLTRB(20, 8, 20, 20),
      children: [
        SurfacePanel(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                draft.clientName.isEmpty ? l10n.noClientYet : draft.clientName,
                style: context.text.titleMedium,
              ),
              if (draft.clientCompany.isNotEmpty) Text(draft.clientCompany),
              if (draft.clientEmail.isNotEmpty) Text(draft.clientEmail),
              const SizedBox(height: 12),
              SecondaryButton(
                label: draft.clientName.isEmpty
                    ? l10n.selectClient
                    : l10n.changeClient,
                onPressed: () => _pickClient(draft),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        TextFormField(
          key: const ValueKey('quote-number'),
          initialValue: draft.number,
          decoration: InputDecoration(
            labelText: l10n.quoteNumber,
            helperText: widget.quotationId == null ? l10n.numberPreview : null,
            helperMaxLines: 2,
          ),
          onChanged: (value) => _update(draft.copyWith(number: value)),
        ),
        const SizedBox(height: 12),
        _dateTile(l10n.issueDate, draft.issueDate, locale, (date) {
          var next = draft.copyWith(issueDate: date);
          if (dateOnly(next.validUntil).isBefore(dateOnly(date))) {
            next = next.copyWith(validUntil: date);
          }
          _update(next);
        }),
        const SizedBox(height: 8),
        _dateTile(
          l10n.validUntil,
          draft.validUntil,
          locale,
          (date) => _update(draft.copyWith(validUntil: date)),
        ),
      ],
    );
  }

  Widget _dateTile(
    String label,
    DateTime value,
    String locale,
    ValueChanged<DateTime> onPick,
  ) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 4),
      title: Text(label),
      subtitle: Text(DateFormat.yMMMd(locale).format(value)),
      trailing: const Icon(Icons.calendar_today_outlined),
      onTap: () async {
        final picked = await showDatePicker(
          context: context,
          initialDate: value,
          firstDate: DateTime(2000),
          lastDate: DateTime(2100),
        );
        if (picked != null) onPick(dateOnly(picked));
      },
    );
  }

  Widget _itemsStep(QuoteDraft draft) {
    final l10n = context.l10n;
    final locale = Localizations.localeOf(context).toString();
    return ListView(
      padding: const EdgeInsets.fromLTRB(20, 8, 20, 20),
      children: [
        Row(
          children: [
            Expanded(
              child: SecondaryButton(
                label: l10n.addFromCatalog,
                onPressed: () => _pickCatalog(draft),
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: SecondaryButton(
                label: l10n.addManual,
                onPressed: () => _editLine(draft, null),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        if (draft.lines.isEmpty)
          EmptyState(
            icon: Icons.playlist_add_rounded,
            title: l10n.emptyLinesTitle,
            body: l10n.emptyLinesBody,
          )
        else
          SurfacePanel(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Column(
              children: [
                for (final line in draft.lines)
                  ListTile(
                    title: Text(line.name),
                    subtitle: Text(
                      '${formatQuantity(line.quantityMilli, locale)} ${unitLabel(l10n, line.unit)} · ${kindLabel(l10n, line.kind)}',
                    ),
                    trailing: Text(
                      formatMoney(line.lineTotal, draft.currencyCode, locale),
                    ),
                    onTap: () => _editLine(draft, line),
                  ),
              ],
            ),
          ),
      ],
    );
  }

  Widget _amountsStep(QuoteDraft draft) {
    final l10n = context.l10n;
    final locale = Localizations.localeOf(context).toString();
    final scale = currencyScale(draft.currencyCode);
    return ListView(
      padding: const EdgeInsets.fromLTRB(20, 8, 20, 20),
      children: [
        Text(l10n.discount, style: context.text.titleSmall),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          children: [
            ChoiceChip(
              label: Text(l10n.discountNone),
              selected: draft.discountMode == DiscountMode.none,
              onSelected: (_) =>
                  _update(draft.copyWith(discountMode: DiscountMode.none)),
            ),
            ChoiceChip(
              label: Text(l10n.discountPercent),
              selected: draft.discountMode == DiscountMode.percent,
              onSelected: (_) =>
                  _update(draft.copyWith(discountMode: DiscountMode.percent)),
            ),
            ChoiceChip(
              label: Text(l10n.discountFixed),
              selected: draft.discountMode == DiscountMode.fixed,
              onSelected: (_) =>
                  _update(draft.copyWith(discountMode: DiscountMode.fixed)),
            ),
          ],
        ),
        if (draft.discountMode == DiscountMode.percent) ...[
          const SizedBox(height: 12),
          _scaledField(
            label: l10n.discountPercent,
            value: draft.discountBps,
            scale: 2,
            locale: locale,
            onChanged: (value) => _update(draft.copyWith(discountBps: value)),
          ),
        ],
        if (draft.discountMode == DiscountMode.fixed) ...[
          const SizedBox(height: 12),
          _scaledField(
            label: l10n.discountFixed,
            value: draft.discountFixedMinor,
            scale: scale,
            locale: locale,
            onChanged: (value) =>
                _update(draft.copyWith(discountFixedMinor: value)),
          ),
        ],
        const SizedBox(height: 16),
        _scaledField(
          label: l10n.taxPercent,
          value: draft.taxRateBps,
          scale: 2,
          locale: locale,
          onChanged: (value) => _update(draft.copyWith(taxRateBps: value)),
        ),
        const SizedBox(height: 6),
        Text(l10n.taxHint, style: context.text.bodySmall),
        const SizedBox(height: 16),
        TextFormField(
          key: const ValueKey('fee-label'),
          initialValue: draft.feeLabel,
          decoration: InputDecoration(labelText: l10n.feeLabel),
          onChanged: (value) => _update(draft.copyWith(feeLabel: value)),
        ),
        const SizedBox(height: 12),
        _scaledField(
          label: l10n.feeAmount,
          value: draft.feeMinor,
          scale: scale,
          locale: locale,
          onChanged: (value) => _update(draft.copyWith(feeMinor: value)),
        ),
        const SizedBox(height: 12),
        TextFormField(
          key: const ValueKey('notes'),
          initialValue: draft.notes,
          minLines: 2,
          maxLines: 4,
          decoration: InputDecoration(labelText: l10n.notes),
          onChanged: (value) => _update(draft.copyWith(notes: value)),
        ),
        const SizedBox(height: 12),
        TextFormField(
          key: const ValueKey('terms'),
          initialValue: draft.terms,
          minLines: 2,
          maxLines: 4,
          decoration: InputDecoration(labelText: l10n.terms),
          onChanged: (value) => _update(draft.copyWith(terms: value)),
        ),
      ],
    );
  }

  Widget _scaledField({
    required String label,
    required int value,
    required int scale,
    required String locale,
    required ValueChanged<int> onChanged,
  }) {
    return TextFormField(
      key: ValueKey('scaled-$label'),
      initialValue: scaledToInput(value, scale, locale),
      keyboardType: const TextInputType.numberWithOptions(decimal: true),
      decoration: InputDecoration(labelText: label),
      onChanged: (text) {
        if (text.trim().isEmpty) {
          onChanged(0);
          return;
        }
        final parsed = parseDecimalToScaled(text, scale);
        if (parsed != null && parsed >= 0) onChanged(parsed);
      },
    );
  }

  Widget _reviewStep(QuoteDraft draft) {
    final l10n = context.l10n;
    final locale = Localizations.localeOf(context).toString();
    return ListView(
      padding: const EdgeInsets.fromLTRB(20, 8, 20, 20),
      children: [
        SurfacePanel(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(draft.number, style: context.text.titleLarge),
              const SizedBox(height: 4),
              Text(draft.clientName, style: context.text.titleMedium),
              if (draft.clientCompany.isNotEmpty) Text(draft.clientCompany),
              const SizedBox(height: 8),
              Text(
                '${l10n.issueDate}: ${DateFormat.yMMMd(locale).format(draft.issueDate)}',
              ),
              Text(
                '${l10n.validUntil}: ${DateFormat.yMMMd(locale).format(draft.validUntil)}',
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        for (final line in draft.lines)
          ListTile(
            contentPadding: EdgeInsets.zero,
            title: Text(line.name),
            subtitle: Text(
              '${formatQuantity(line.quantityMilli, locale)} ${unitLabel(l10n, line.unit)}',
            ),
            trailing: Text(
              formatMoney(line.lineTotal, draft.currencyCode, locale),
            ),
          ),
        const SizedBox(height: 8),
        TotalsBlock(
          totals: draft.totals,
          currencyCode: draft.currencyCode,
          discountMode: draft.discountMode,
          discountBps: draft.discountBps,
          taxRateBps: draft.taxRateBps,
          feeLabel: draft.feeLabel,
        ),
        const SizedBox(height: 16),
        SecondaryButton(
          label: l10n.previewPdf,
          onPressed: () => _preview(draft),
        ),
        const SizedBox(height: 8),
        SecondaryButton(label: l10n.sharePdf, onPressed: () => _share(draft)),
      ],
    );
  }

  Widget _footer(QuoteDraft draft) {
    final l10n = context.l10n;
    final locale = Localizations.localeOf(context).toString();
    final last = _step == 3;
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 12, 20, 12),
      decoration: BoxDecoration(
        color: context.palette.surface,
        border: Border(top: BorderSide(color: context.palette.line)),
      ),
      child: SafeArea(
        top: false,
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(l10n.total, style: context.text.bodyMedium),
                ),
                Text(
                  formatMoney(
                    draft.totals.totalMinor,
                    draft.currencyCode,
                    locale,
                  ),
                  style: context.text.titleMedium,
                ),
              ],
            ),
            const SizedBox(height: 10),
            if (last) ...[
              PrimaryButton(
                label: l10n.saveDraft,
                loading: _saving,
                onPressed: () => _save(draft, QuoteStatus.draft),
              ),
              const SizedBox(height: 8),
              SecondaryButton(
                label: l10n.markSent,
                onPressed: _saving
                    ? null
                    : () => _save(draft, QuoteStatus.sent),
              ),
            ] else
              PrimaryButton(
                label: l10n.continueAction,
                onPressed: () => _next(draft),
              ),
          ],
        ),
      ),
    );
  }

  void _next(QuoteDraft draft) {
    final error = _validate(draft, forSend: false, step: _step);
    if (error != null) {
      setState(() => _error = error);
      return;
    }
    setState(() {
      _error = null;
      _step += 1;
    });
  }

  String? _validate(
    QuoteDraft draft, {
    required bool forSend,
    required int step,
  }) {
    final l10n = context.l10n;
    if (step >= 0 && draft.clientName.trim().isEmpty) return l10n.needClient;
    if (dateOnly(draft.validUntil).isBefore(dateOnly(draft.issueDate))) {
      return l10n.validityError;
    }
    if (draft.discountMode == DiscountMode.percent &&
        (draft.discountBps < 0 || draft.discountBps > 10000)) {
      return l10n.invalidAmount;
    }
    if (draft.taxRateBps < 0 || draft.taxRateBps > 10000) {
      return l10n.invalidAmount;
    }
    if (draft.discountMode == DiscountMode.fixed &&
        draft.discountFixedMinor > draft.totals.subtotalMinor &&
        draft.discountFixedMinor > 0) {
      return l10n.discountTooHigh;
    }
    for (final line in draft.lines) {
      if (line.name.trim().isEmpty) return l10n.fieldRequired;
      if (line.quantityMilli <= 0) return l10n.invalidQuantity;
      if (line.unitPriceMinor < 0) return l10n.invalidAmount;
    }
    if (forSend && draft.lines.isEmpty) return l10n.needLineToSend;
    return null;
  }

  Future<void> _save(QuoteDraft draft, QuoteStatus status) async {
    final error = _validate(
      draft,
      forSend: status == QuoteStatus.sent,
      step: 3,
    );
    if (error != null) {
      setState(() => _error = error);
      return;
    }
    setState(() => _saving = true);
    final l10n = context.l10n;
    try {
      final profile = await ref.read(profileRepositoryProvider).get();
      final isPro = ref.read(settingsProvider).asData?.value.isPro ?? false;
      final id = await ref
          .read(quotationRepositoryProvider)
          .save(draft: draft, profile: profile, isPro: isPro, status: status);
      final saved = await ref.read(quotationRepositoryProvider).getById(id);
      ref.invalidate(quoteLinesProvider(id));
      if (!mounted || saved == null) return;
      setState(() {
        _draft = draft.copyWith(id: id, number: saved.number, status: status);
        _dirty = false;
        _saving = false;
      });
      showAppMessage(context, l10n.quoteSaved);
    } on QuoteLimitException {
      if (!mounted) return;
      setState(() => _saving = false);
      await showProLimitDialog(
        context,
        title: l10n.quoteLimitTitle,
        body: l10n.quoteLimitBody,
      );
    } on DuplicateQuoteNumberException {
      if (mounted) {
        setState(() {
          _saving = false;
          _error = l10n.duplicateNumber;
        });
      }
    } catch (_) {
      if (mounted) {
        setState(() => _saving = false);
        showAppMessage(context, l10n.errorGeneric);
      }
    }
  }

  Future<void> _preview(QuoteDraft draft) async {
    final profile = await ref.read(profileRepositoryProvider).get();
    if (!mounted) return;
    context.push(
      '/quote/preview',
      extra: documentFromDraft(draft, profile: profile),
    );
  }

  Future<void> _share(QuoteDraft draft) async {
    final savedId = await _saveAndReturn(draft, draft.status);
    if (savedId == null || !mounted) return;
    final quote = await ref.read(quotationRepositoryProvider).getById(savedId);
    final lines = await ref.read(quotationRepositoryProvider).linesFor(savedId);
    final settings = await ref.read(settingsRepositoryProvider).get();
    if (quote == null || !mounted) return;
    final bytes = await PdfService().build(
      document: documentFromStored(quote, lines),
      options: PdfOptions.fromSettings(settings),
      labels: _labels(context.l10n),
      locale: Localizations.localeOf(context).toString(),
    );
    await Printing.sharePdf(bytes: bytes, filename: '${quote.number}.pdf');
  }

  Future<int?> _saveAndReturn(QuoteDraft draft, QuoteStatus status) async {
    final error = _validate(draft, forSend: false, step: 3);
    if (error != null) {
      setState(() => _error = error);
      return null;
    }
    try {
      final profile = await ref.read(profileRepositoryProvider).get();
      final isPro = ref.read(settingsProvider).asData?.value.isPro ?? false;
      final id = await ref
          .read(quotationRepositoryProvider)
          .save(draft: draft, profile: profile, isPro: isPro, status: status);
      final saved = await ref.read(quotationRepositoryProvider).getById(id);
      if (mounted && saved != null) {
        setState(() {
          _draft = draft.copyWith(
            id: id,
            number: saved.number,
            status: parseQuoteStatus(saved.status),
          );
          _dirty = false;
        });
      }
      return id;
    } on QuoteLimitException {
      if (mounted) {
        await showProLimitDialog(
          context,
          title: context.l10n.quoteLimitTitle,
          body: context.l10n.quoteLimitBody,
        );
      }
      return null;
    } catch (_) {
      if (mounted) showAppMessage(context, context.l10n.errorGeneric);
      return null;
    }
  }

  PdfLabels _labels(dynamic l10n) {
    return PdfLabels(
      quote: l10n.pdfQuote as String,
      billTo: l10n.pdfBillTo as String,
      from: l10n.pdfFrom as String,
      number: l10n.pdfNumber as String,
      currency: l10n.currency as String,
      issueDate: l10n.pdfIssueDate as String,
      validUntil: l10n.pdfValidUntil as String,
      concept: l10n.pdfConcept as String,
      qty: l10n.pdfQty as String,
      unit: l10n.pdfUnit as String,
      price: l10n.pdfPrice as String,
      amount: l10n.pdfAmount as String,
      subtotal: l10n.pdfSubtotal as String,
      discount: l10n.pdfDiscount as String,
      tax: l10n.pdfTax as String,
      fee: l10n.pdfFee as String,
      total: l10n.pdfTotal as String,
      notes: l10n.pdfNotes as String,
      terms: l10n.pdfTerms as String,
      page: (current, total) =>
          (l10n.pdfPage as String Function(int, int))(current, total),
      madeWith: l10n.pdfMadeWith as String,
      draft: l10n.pdfDraft as String,
      acceptedBy: l10n.pdfAcceptedBy as String,
      date: l10n.pdfDate as String,
      signature: l10n.pdfSignature as String,
      kind: (kind) => kindLabel(context.l10n, kind),
      unitName: (unit) => unitLabel(context.l10n, unit),
    );
  }

  Future<void> _pickClient(QuoteDraft draft) async {
    final selected = await showModalBottomSheet<Client>(
      context: context,
      isScrollControlled: true,
      builder: (context) => _ClientPicker(onCreate: _quickClient),
    );
    if (selected == null) return;
    _update(
      draft.copyWith(
        clientId: selected.id,
        clientName: selected.name,
        clientCompany: selected.company ?? '',
        clientEmail: selected.email ?? '',
        clientPhone: selected.phone ?? '',
        clientAddress: selected.address ?? '',
        clientTaxId: selected.taxId ?? '',
      ),
    );
  }

  Future<Client?> _quickClient() async {
    final l10n = context.l10n;
    final name = TextEditingController();
    final email = TextEditingController();
    final phone = TextEditingController();
    final created = await showModalBottomSheet<Client>(
      context: context,
      isScrollControlled: true,
      builder: (sheetContext) {
        return Padding(
          padding: EdgeInsets.fromLTRB(
            20,
            8,
            20,
            20 + MediaQuery.viewInsetsOf(sheetContext).bottom,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(l10n.quickClient, style: context.text.titleMedium),
              const SizedBox(height: 12),
              TextField(
                controller: name,
                decoration: InputDecoration(labelText: l10n.clientName),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: email,
                decoration: InputDecoration(labelText: l10n.email),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: phone,
                decoration: InputDecoration(labelText: l10n.phone),
              ),
              const SizedBox(height: 12),
              PrimaryButton(
                label: l10n.save,
                onPressed: () async {
                  if (name.text.trim().isEmpty) return;
                  final isPro =
                      ref.read(settingsProvider).asData?.value.isPro ?? false;
                  try {
                    final id = await ref
                        .read(clientRepositoryProvider)
                        .create(
                          name: name.text,
                          email: email.text,
                          phone: phone.text,
                          isPro: isPro,
                        );
                    final client = await ref
                        .read(clientRepositoryProvider)
                        .getById(id);
                    if (sheetContext.mounted) {
                      Navigator.pop(sheetContext, client);
                    }
                  } on ClientLimitException {
                    if (sheetContext.mounted) Navigator.pop(sheetContext);
                    if (!mounted) return;
                    await showProLimitDialog(
                      context,
                      title: l10n.clientLimitTitle,
                      body: l10n.clientLimitBody,
                    );
                  }
                },
              ),
            ],
          ),
        );
      },
    );
    name.dispose();
    email.dispose();
    phone.dispose();
    return created;
  }

  Future<void> _pickCatalog(QuoteDraft draft) async {
    await showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      builder: (context) => _CatalogPicker(
        currency: draft.currencyCode,
        onAdd: (item) {
          final current = _draft;
          if (current == null) return;
          final line = QuoteLineDraft(
            key: _lineKey++,
            catalogItemId: item.id,
            name: item.name,
            description: item.description ?? '',
            unit: item.unit,
            kind: item.kind,
            quantityMilli: 1000,
            unitPriceMinor: item.unitPriceMinor,
          );
          _update(current.copyWith(lines: [...current.lines, line]));
          showAppMessage(context, context.l10n.addedConcept);
        },
      ),
    );
  }

  Future<void> _editLine(QuoteDraft draft, QuoteLineDraft? existing) async {
    final result = await showModalBottomSheet<_LineResult>(
      context: context,
      isScrollControlled: true,
      builder: (context) =>
          _LineSheet(currency: draft.currencyCode, existing: existing),
    );
    if (result == null) return;
    if (result.removed && existing != null) {
      _update(
        draft.copyWith(
          lines: draft.lines.where((line) => line.key != existing.key).toList(),
        ),
      );
      return;
    }
    final line = result.line;
    if (line == null) return;
    if (existing == null) {
      _update(
        draft.copyWith(lines: [...draft.lines, line.copyWithKey(_lineKey++)]),
      );
    } else {
      _update(
        draft.copyWith(
          lines: [
            for (final current in draft.lines)
              if (current.key == existing.key) line else current,
          ],
        ),
      );
    }
  }
}

class _LineResult {
  const _LineResult({this.line, this.removed = false});
  final QuoteLineDraft? line;
  final bool removed;
}

extension on QuoteLineDraft {
  QuoteLineDraft copyWithKey(int key) {
    return QuoteLineDraft(
      key: key,
      catalogItemId: catalogItemId,
      name: name,
      description: description,
      unit: unit,
      kind: kind,
      quantityMilli: quantityMilli,
      unitPriceMinor: unitPriceMinor,
    );
  }
}

class _ClientPicker extends ConsumerStatefulWidget {
  const _ClientPicker({required this.onCreate});
  final Future<Client?> Function() onCreate;

  @override
  ConsumerState<_ClientPicker> createState() => _ClientPickerState();
}

class _ClientPickerState extends ConsumerState<_ClientPicker> {
  final _search = TextEditingController();
  String _query = '';

  @override
  void dispose() {
    _search.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final clients =
        ref.watch(clientsProvider).asData?.value ?? const <Client>[];
    final query = _query.trim().toLowerCase();
    final visible = clients
        .where(
          (client) =>
              query.isEmpty || client.name.toLowerCase().contains(query),
        )
        .toList();
    return DraggableScrollableSheet(
      expand: false,
      initialChildSize: 0.75,
      builder: (context, controller) {
        return Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 12),
          child: Column(
            children: [
              SearchField(
                controller: _search,
                hint: l10n.searchClients,
                onChanged: (value) => setState(() => _query = value),
              ),
              const SizedBox(height: 8),
              Align(
                alignment: Alignment.centerLeft,
                child: TextButton(
                  onPressed: () async {
                    final created = await widget.onCreate();
                    if (created != null && context.mounted) {
                      Navigator.pop(context, created);
                    }
                  },
                  child: Text(l10n.quickClient),
                ),
              ),
              Expanded(
                child: visible.isEmpty
                    ? Center(child: Text(l10n.noMatches))
                    : ListView.builder(
                        controller: controller,
                        itemCount: visible.length,
                        itemBuilder: (context, index) {
                          final client = visible[index];
                          return ListTile(
                            leading: InitialsAvatar(name: client.name),
                            title: Text(client.name),
                            subtitle: Text(client.company ?? ''),
                            onTap: () => Navigator.pop(context, client),
                          );
                        },
                      ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _CatalogPicker extends ConsumerStatefulWidget {
  const _CatalogPicker({required this.currency, required this.onAdd});
  final String currency;
  final ValueChanged<CatalogItem> onAdd;

  @override
  ConsumerState<_CatalogPicker> createState() => _CatalogPickerState();
}

class _CatalogPickerState extends ConsumerState<_CatalogPicker> {
  final _search = TextEditingController();
  String _query = '';

  @override
  void dispose() {
    _search.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final locale = Localizations.localeOf(context).toString();
    final items =
        ref.watch(catalogProvider).asData?.value ?? const <CatalogItem>[];
    final query = _query.trim().toLowerCase();
    final visible = items
        .where(
          (item) => query.isEmpty || item.name.toLowerCase().contains(query),
        )
        .toList();
    return DraggableScrollableSheet(
      expand: false,
      initialChildSize: 0.8,
      builder: (context, controller) {
        return Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 12),
          child: Column(
            children: [
              SearchField(
                controller: _search,
                hint: l10n.searchCatalog,
                onChanged: (value) => setState(() => _query = value),
              ),
              const SizedBox(height: 8),
              Expanded(
                child: visible.isEmpty
                    ? Center(
                        child: Text(
                          items.isEmpty
                              ? l10n.emptyCatalogBody
                              : l10n.noMatches,
                        ),
                      )
                    : ListView.builder(
                        controller: controller,
                        itemCount: visible.length,
                        itemBuilder: (context, index) {
                          final item = visible[index];
                          return ListTile(
                            title: Text(item.name),
                            subtitle: Text(kindLabel(l10n, item.kind)),
                            trailing: Text(
                              formatMoney(
                                item.unitPriceMinor,
                                widget.currency,
                                locale,
                              ),
                            ),
                            onTap: () => widget.onAdd(item),
                          );
                        },
                      ),
              ),
              PrimaryButton(
                label: l10n.done,
                onPressed: () => Navigator.pop(context),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _LineSheet extends StatefulWidget {
  const _LineSheet({required this.currency, this.existing});
  final String currency;
  final QuoteLineDraft? existing;

  @override
  State<_LineSheet> createState() => _LineSheetState();
}

class _LineSheetState extends State<_LineSheet> {
  late final TextEditingController _name;
  late final TextEditingController _description;
  late final TextEditingController _qty;
  late final TextEditingController _price;
  late String _unit;
  late String _kind;
  String? _error;

  @override
  void initState() {
    super.initState();
    final existing = widget.existing;
    _name = TextEditingController(text: existing?.name ?? '');
    _description = TextEditingController(text: existing?.description ?? '');
    _unit = existing?.unit ?? 'unit';
    _kind = existing?.kind ?? 'service';
    _qty = TextEditingController();
    _price = TextEditingController();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_qty.text.isEmpty) {
      final locale = Localizations.localeOf(context).toString();
      final existing = widget.existing;
      _qty.text = existing == null
          ? '1'
          : scaledToInput(existing.quantityMilli, 3, locale);
      _price.text = existing == null
          ? ''
          : scaledToInput(
              existing.unitPriceMinor,
              currencyScale(widget.currency),
              locale,
            );
    }
  }

  @override
  void dispose() {
    _name.dispose();
    _description.dispose();
    _qty.dispose();
    _price.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Padding(
      padding: EdgeInsets.fromLTRB(
        20,
        8,
        20,
        16 + MediaQuery.viewInsetsOf(context).bottom,
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.existing == null ? l10n.manualConcept : l10n.editConcept,
              style: context.text.titleMedium,
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _name,
              decoration: InputDecoration(labelText: l10n.lineName),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: _description,
              decoration: InputDecoration(labelText: l10n.lineDescription),
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              children: [
                for (final kind in ['labor', 'material', 'service', 'product'])
                  ChoiceChip(
                    label: Text(kindLabel(l10n, kind)),
                    selected: _kind == kind,
                    onSelected: (_) => setState(() => _kind = kind),
                  ),
              ],
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              children: [
                for (final unit in unitCodes)
                  ChoiceChip(
                    label: Text(unitLabel(l10n, unit)),
                    selected: _unit == unit,
                    onSelected: (_) => setState(() => _unit = unit),
                  ),
              ],
            ),
            const SizedBox(height: 8),
            TextField(
              controller: _qty,
              keyboardType: const TextInputType.numberWithOptions(
                decimal: true,
              ),
              decoration: InputDecoration(labelText: l10n.quantity),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: _price,
              keyboardType: const TextInputType.numberWithOptions(
                decimal: true,
              ),
              decoration: InputDecoration(labelText: l10n.unitPrice),
            ),
            if (_error != null) ...[
              const SizedBox(height: 8),
              Text(_error!, style: TextStyle(color: context.palette.danger)),
            ],
            const SizedBox(height: 12),
            PrimaryButton(label: l10n.apply, onPressed: _apply),
            if (widget.existing != null)
              TextButton(
                onPressed: () =>
                    Navigator.pop(context, const _LineResult(removed: true)),
                child: Text(l10n.removeConcept),
              ),
          ],
        ),
      ),
    );
  }

  void _apply() {
    final l10n = context.l10n;
    final qty = parseDecimalToScaled(_qty.text, 3);
    final price = parseDecimalToScaled(
      _price.text.isEmpty ? '0' : _price.text,
      currencyScale(widget.currency),
    );
    if (_name.text.trim().isEmpty) {
      setState(() => _error = l10n.fieldRequired);
      return;
    }
    if (qty == null || qty <= 0) {
      setState(() => _error = l10n.invalidQuantity);
      return;
    }
    if (price == null || price < 0) {
      setState(() => _error = l10n.invalidAmount);
      return;
    }
    Navigator.pop(
      context,
      _LineResult(
        line: QuoteLineDraft(
          key: widget.existing?.key ?? 0,
          catalogItemId: widget.existing?.catalogItemId,
          name: _name.text.trim(),
          description: _description.text.trim(),
          unit: _unit,
          kind: _kind,
          quantityMilli: qty,
          unitPriceMinor: price,
        ),
      ),
    );
  }
}
