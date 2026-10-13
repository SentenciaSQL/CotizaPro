import 'dart:io';

import 'package:cotizapro/core/constants/limits.dart';
import 'package:cotizapro/core/l10n/l10n_ext.dart';
import 'package:cotizapro/core/money/money.dart';
import 'package:cotizapro/core/widgets/app_widgets.dart';
import 'package:cotizapro/data/database/app_database.dart';
import 'package:cotizapro/data/providers.dart';
import 'package:cotizapro/features/ads/ad_banner.dart';
import 'package:cotizapro/features/pro/limit_dialog.dart';
import 'package:cotizapro/features/quotations/quote_labels.dart';
import 'package:cotizapro/features/quotations/quote_models.dart';
import 'package:cotizapro/features/quotations/quote_tile.dart';
import 'package:cotizapro/l10n/generated/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

class QuotationListScreen extends ConsumerStatefulWidget {
  const QuotationListScreen({super.key});

  @override
  ConsumerState<QuotationListScreen> createState() => _QuotationListScreenState();
}

class _QuotationListScreenState extends ConsumerState<QuotationListScreen> {
  final _search = TextEditingController();
  String _query = '';
  String _filter = 'all';
  DateTime? _from;
  DateTime? _to;

  @override
  void dispose() {
    _search.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final quotes = ref.watch(quotesProvider);
    final settings = ref.watch(settingsProvider).asData?.value;
    final isPro = settings?.isPro ?? false;
    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.quotesTitle),
        actions: [
          IconButton(
            tooltip: l10n.exportCsv,
            onPressed: () => _export(context, isPro),
            icon: const Icon(Icons.ios_share_rounded),
          ),
          IconButton(
            tooltip: l10n.newQuote,
            onPressed: () => _create(context, isPro),
            icon: const Icon(Icons.add_rounded),
          ),
        ],
      ),
      body: quotes.when(
        loading: () => const LoadingView(),
        error: (error, stack) => ErrorView(
          message: l10n.errorGeneric,
          retryLabel: l10n.retry,
          onRetry: () => ref.invalidate(quotesProvider),
        ),
        data: (items) {
          final visible = _apply(items);
          return ListView(
            padding: const EdgeInsets.fromLTRB(20, 8, 20, 24),
            children: [
              SearchField(
                controller: _search,
                hint: l10n.searchQuotes,
                onChanged: (value) => setState(() => _query = value),
              ),
              const SizedBox(height: 12),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    for (final filter in ['all', 'draft', 'sent', 'accepted', 'rejected', 'expired'])
                      Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: FilterChip(
                          label: Text(_filterLabel(l10n, filter)),
                          selected: _filter == filter,
                          onSelected: (_) => setState(() => _filter = filter),
                        ),
                      ),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () => _pickRange(context, isPro),
                      child: Text(_rangeLabel(context), overflow: TextOverflow.ellipsis),
                    ),
                  ),
                  if (_from != null || _to != null)
                    IconButton(
                      tooltip: l10n.clearDates,
                      onPressed: () => setState(() {
                        _from = null;
                        _to = null;
                      }),
                      icon: const Icon(Icons.close_rounded),
                    ),
                ],
              ),
              const SizedBox(height: 8),
              if (items.isEmpty)
                EmptyState(
                  icon: Icons.history_rounded,
                  title: l10n.emptyHistoryTitle,
                  body: l10n.emptyHistoryBody,
                  actionLabel: l10n.newQuote,
                  onAction: () => _create(context, isPro),
                )
              else if (visible.isEmpty)
                Padding(
                  padding: const EdgeInsets.only(top: 32),
                  child: Text(l10n.noFilterResults, textAlign: TextAlign.center, style: context.text.bodyMedium),
                )
              else
                SurfacePanel(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: [
                      for (var i = 0; i < visible.length; i++) ...[
                        if (i > 0) Divider(height: 1, color: context.palette.line),
                        QuoteTile(
                          quote: visible[i],
                          onTap: () => context.push('/quote/${visible[i].id}'),
                        ),
                      ],
                    ],
                  ),
                ),
              const AdBannerSlot(),
            ],
          );
        },
      ),
    );
  }

  List<Quotation> _apply(List<Quotation> items) {
    final query = _query.trim().toLowerCase();
    return items.where((quote) {
      final display = displayStatusOf(status: quote.status, validUntil: quote.validUntil);
      final matchesFilter = switch (_filter) {
        'draft' => display == QuoteDisplayStatus.draft,
        'sent' => display == QuoteDisplayStatus.sent,
        'accepted' => display == QuoteDisplayStatus.accepted,
        'rejected' => display == QuoteDisplayStatus.rejected,
        'expired' => display == QuoteDisplayStatus.expired,
        _ => true,
      };
      if (!matchesFilter) return false;
      final day = dateOnly(quote.issueDate);
      if (_from != null && day.isBefore(dateOnly(_from!))) return false;
      if (_to != null && day.isAfter(dateOnly(_to!))) return false;
      if (query.isEmpty) return true;
      final haystack = '${quote.number} ${quote.clientName} ${quote.clientCompany ?? ''}'.toLowerCase();
      return haystack.contains(query);
    }).toList();
  }

  String _filterLabel(AppLocalizations l10n, String filter) {
    return switch (filter) {
      'draft' => l10n.filterDraft,
      'sent' => l10n.filterSent,
      'accepted' => l10n.filterAccepted,
      'rejected' => l10n.filterRejected,
      'expired' => l10n.filterExpired,
      _ => l10n.filterAll,
    };
  }

  String _rangeLabel(BuildContext context) {
    final l10n = context.l10n;
    final locale = Localizations.localeOf(context).toString();
    if (_from == null && _to == null) return '${l10n.dateFrom} – ${l10n.dateTo}';
    String fmt(DateTime? value) => value == null ? '…' : DateFormat.yMMMd(locale).format(value);
    return '${fmt(_from)} – ${fmt(_to)}';
  }

  Future<void> _pickRange(BuildContext context, bool isPro) async {
    if (!isPro) {
      await showProLimitDialog(
        context,
        title: context.l10n.proRequiredTitle,
        body: context.l10n.proRequiredBody,
      );
      return;
    }
    final now = DateTime.now();
    final range = await showDateRangePicker(
      context: context,
      firstDate: DateTime(2000),
      lastDate: DateTime(now.year + 5),
      initialDateRange: _from != null && _to != null
          ? DateTimeRange(start: _from!, end: _to!)
          : null,
    );
    if (range == null) return;
    setState(() {
      _from = range.start;
      _to = range.end;
    });
  }

  Future<void> _create(BuildContext context, bool isPro) async {
    final count = ref.read(quotesProvider).asData?.value.length ?? 0;
    if (!isPro && count >= freeQuoteLimit) {
      await showProLimitDialog(
        context,
        title: context.l10n.quoteLimitTitle,
        body: context.l10n.quoteLimitBody,
      );
      return;
    }
    if (context.mounted) context.push('/quote/new');
  }

  Future<void> _export(BuildContext context, bool isPro) async {
    final l10n = context.l10n;
    if (!isPro) {
      await showProLimitDialog(context, title: l10n.proRequiredTitle, body: l10n.exportCsvProBody);
      return;
    }
    final items = _apply(ref.read(quotesProvider).asData?.value ?? const []);
    final locale = Localizations.localeOf(context).toString();
    final buffer = StringBuffer('number,status,client,issueDate,validUntil,currency,total\n');
    for (final quote in items) {
      final display = displayStatusOf(status: quote.status, validUntil: quote.validUntil);
      buffer.writeln(
        [
          _csv(quote.number),
          _csv(statusLabel(l10n, display)),
          _csv(quote.clientName),
          _csv(DateFormat('yyyy-MM-dd').format(quote.issueDate.toLocal())),
          _csv(DateFormat('yyyy-MM-dd').format(quote.validUntil.toLocal())),
          quote.currencyCode,
          formatScaled(quote.totalMinor, currencyScale(quote.currencyCode), locale),
        ].join(','),
      );
    }
    final dir = await getTemporaryDirectory();
    final file = File(p.join(dir.path, 'cotizapro-historial.csv'));
    await file.writeAsString(buffer.toString());
    await SharePlus.instance.share(
      ShareParams(files: [XFile(file.path, mimeType: 'text/csv', name: 'cotizapro-historial.csv')]),
    );
  }

  String _csv(String value) {
    final escaped = value.replaceAll('"', '""');
    return '"$escaped"';
  }
}
