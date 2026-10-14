import 'package:cotizapro/core/constants/limits.dart';
import 'package:cotizapro/core/theme/app_colors.dart';
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

class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final profile = ref.watch(profileProvider);
    final quotes = ref.watch(quotesProvider);
    final settings = ref.watch(settingsProvider);
    if (profile.isLoading || quotes.isLoading || settings.isLoading) {
      return const Scaffold(body: LoadingView());
    }
    if (profile.hasError || quotes.hasError) {
      return Scaffold(
        body: ErrorView(
          message: l10n.errorGeneric,
          retryLabel: l10n.retry,
          onRetry: () {
            ref.invalidate(profileProvider);
            ref.invalidate(quotesProvider);
          },
        ),
      );
    }
    final business = profile.requireValue;
    final items = quotes.requireValue;
    final isPro = settings.asData?.value.isPro ?? false;
    final name = business.businessName.trim().isEmpty
        ? l10n.yourBusiness
        : business.businessName.trim();
    final greeting = greetingFor(
      context.l10n,
      DateTime.now(),
      business.ownerName,
    );
    final openCount = items.where((quote) {
      final display = displayStatusOf(
        status: quote.status,
        validUntil: quote.validUntil,
      );
      return display == QuoteDisplayStatus.draft ||
          display == QuoteDisplayStatus.sent;
    }).length;
    final accepted = items.where(
      (quote) => quote.status == QuoteStatus.accepted.name,
    );
    final acceptedInCurrency = accepted.where(
      (quote) => quote.currencyCode == business.currencyCode,
    );
    final acceptedSum = acceptedInCurrency.fold<int>(
      0,
      (sum, quote) => sum + quote.totalMinor,
    );
    final locale = Localizations.localeOf(context).toString();

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView(
                padding: const EdgeInsets.fromLTRB(20, 12, 20, 12),
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              greeting,
                              style: context.text.bodyMedium?.copyWith(
                                color: context.palette.muted,
                              ),
                            ),
                            const SizedBox(height: 4),
                            GestureDetector(
                              onTap: () => context.push('/settings/profile'),
                              child: Text(
                                name,
                                style: context.text.headlineMedium,
                              ),
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                        tooltip: l10n.settingsTitle,
                        onPressed: () => context.push('/settings'),
                        icon: const Icon(Icons.settings_outlined),
                      ),
                    ],
                  ),
                  if (business.businessName.trim().isEmpty) ...[
                    const SizedBox(height: 16),
                    SurfacePanel(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            l10n.completeProfileTitle,
                            style: context.text.titleMedium,
                          ),
                          const SizedBox(height: 6),
                          Text(
                            l10n.completeProfileBody,
                            style: context.text.bodyMedium?.copyWith(
                              color: context.palette.muted,
                            ),
                          ),
                          const SizedBox(height: 12),
                          SecondaryButton(
                            label: l10n.completeProfileAction,
                            onPressed: () => context.push('/settings/profile'),
                          ),
                        ],
                      ),
                    ),
                  ],
                  const SizedBox(height: 16),
                  if (!isPro)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: Text(
                        l10n.freeUsage(items.length, freeQuoteLimit),
                        style: context.text.bodySmall,
                      ),
                    ),
                  if (items.isEmpty)
                    EmptyState(
                      icon: Icons.description_outlined,
                      title: l10n.emptyQuotesTitle,
                      body: l10n.emptyQuotesBody,
                      expand: false,
                    )
                  else ...[
                    SurfacePanel(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(l10n.summary, style: context.text.titleMedium),
                          const SizedBox(height: 14),
                          Row(
                            children: [
                              _Stat(
                                value: '${items.length}',
                                label: l10n.statQuotes,
                              ),
                              _Stat(value: '$openCount', label: l10n.statOpen),
                              _Stat(
                                value: '${accepted.length}',
                                label: l10n.statAccepted,
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          Text(
                            l10n.statAcceptedAmount(business.currencyCode),
                            style: context.text.bodySmall,
                          ),
                          const SizedBox(height: 2),
                          Text(
                            formatMoney(
                              acceptedSum,
                              business.currencyCode,
                              locale,
                            ),
                            style: context.text.titleLarge,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    SectionLabel(
                      title: l10n.recentQuotes,
                      action: l10n.seeAll,
                      onAction: () => context.go('/quotations'),
                    ),
                    SurfacePanel(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        children: [
                          for (var i = 0; i < items.take(5).length; i++) ...[
                            if (i > 0)
                              Divider(height: 1, color: context.palette.line),
                            QuoteTile(
                              quote: items[i],
                              onTap: () =>
                                  context.push('/quote/${items[i].id}'),
                            ),
                          ],
                        ],
                      ),
                    ),
                  ],
                  const SizedBox(height: 20),
                  GridView.count(
                    crossAxisCount: 2,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    mainAxisSpacing: 12,
                    crossAxisSpacing: 12,
                    childAspectRatio: 1.7,
                    children: [
                      _Shortcut(
                        icon: Icons.people_outline_rounded,
                        title: l10n.shortcutClients,
                        hint: l10n.shortcutClientsHint,
                        onTap: () => context.go('/clients'),
                      ),
                      _Shortcut(
                        icon: Icons.inventory_2_outlined,
                        title: l10n.shortcutCatalog,
                        hint: l10n.shortcutCatalogHint,
                        onTap: () => context.go('/catalog'),
                      ),
                      _Shortcut(
                        icon: Icons.history_rounded,
                        title: l10n.shortcutHistory,
                        hint: l10n.shortcutHistoryHint,
                        onTap: () => context.go('/quotations'),
                      ),
                      _Shortcut(
                        icon: Icons.storefront_outlined,
                        title: l10n.shortcutProfile,
                        hint: l10n.shortcutProfileHint,
                        onTap: () => context.push('/settings/profile'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 4, 20, 12),
              child: PrimaryButton(
                label: items.isEmpty ? l10n.createFirstQuote : l10n.newQuote,
                icon: Icons.add_rounded,
                onPressed: () => _createQuote(context, ref, items, isPro),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _createQuote(
    BuildContext context,
    WidgetRef ref,
    List<Quotation> items,
    bool isPro,
  ) async {
    if (!isPro && items.length >= freeQuoteLimit) {
      await showProLimitDialog(
        context,
        title: context.l10n.quoteLimitTitle,
        body: context.l10n.quoteLimitBody,
      );
      return;
    }
    if (context.mounted) context.push('/quote/new');
  }
}

class _Stat extends StatelessWidget {
  const _Stat({required this.value, required this.label});
  final String value;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(value, style: context.text.titleLarge),
          const SizedBox(height: 2),
          Text(label, style: context.text.bodySmall),
        ],
      ),
    );
  }
}

class _Shortcut extends StatelessWidget {
  const _Shortcut({
    required this.icon,
    required this.title,
    required this.hint,
    required this.onTap,
  });

  final IconData icon;
  final String title;
  final String hint;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: context.palette.surface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppRadius.lg),
        side: BorderSide(color: context.palette.line),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(AppRadius.lg),
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(icon, color: context.palette.teal),
              const Spacer(),
              Text(title, style: context.text.titleSmall),
              Text(
                hint,
                style: context.text.bodySmall,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
