import 'package:cotizapro/core/constants/limits.dart';
import 'package:cotizapro/core/l10n/l10n_ext.dart';
import 'package:cotizapro/core/money/money.dart';
import 'package:cotizapro/core/widgets/app_widgets.dart';
import 'package:cotizapro/data/providers.dart';
import 'package:cotizapro/features/ads/ad_banner.dart';
import 'package:cotizapro/features/pro/limit_dialog.dart';
import 'package:cotizapro/features/quotations/quote_labels.dart';
import 'package:cotizapro/features/services_catalog/catalog_labels.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class CatalogListScreen extends ConsumerStatefulWidget {
  const CatalogListScreen({super.key});

  @override
  ConsumerState<CatalogListScreen> createState() => _CatalogListScreenState();
}

class _CatalogListScreenState extends ConsumerState<CatalogListScreen> {
  final _search = TextEditingController();
  String _query = '';
  String _category = '';

  @override
  void dispose() {
    _search.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final catalog = ref.watch(catalogProvider);
    final currency =
        ref.watch(profileProvider).asData?.value.currencyCode ?? 'USD';
    final isPro = ref.watch(settingsProvider).asData?.value.isPro ?? false;
    final locale = Localizations.localeOf(context).toString();
    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.catalogTitle),
        actions: [
          IconButton(
            tooltip: l10n.newItem,
            onPressed: () => _create(context, isPro),
            icon: const Icon(Icons.add_rounded),
          ),
        ],
      ),
      body: catalog.when(
        loading: () => const LoadingView(),
        error: (error, stack) => ErrorView(
          message: l10n.errorGeneric,
          retryLabel: l10n.retry,
          onRetry: () => ref.invalidate(catalogProvider),
        ),
        data: (items) {
          final categories = orderedCatalogCategories(
            items.map((item) => item.category),
          );
          final query = _query.trim().toLowerCase();
          final visible = items.where((item) {
            if (_category.isNotEmpty && item.category != _category) {
              return false;
            }
            if (query.isEmpty) return true;
            return '${item.name} ${item.description ?? ''} ${item.category}'
                .toLowerCase()
                .contains(query);
          }).toList();
          if (items.isEmpty) {
            return EmptyState(
              icon: Icons.inventory_2_outlined,
              title: l10n.emptyCatalogTitle,
              body: l10n.emptyCatalogBody,
              actionLabel: l10n.newItem,
              onAction: () => _create(context, isPro),
            );
          }
          return ListView(
            padding: const EdgeInsets.fromLTRB(20, 8, 20, 24),
            children: [
              SearchField(
                controller: _search,
                hint: l10n.searchCatalog,
                onChanged: (value) => setState(() => _query = value),
              ),
              if (categories.isNotEmpty) ...[
                const SizedBox(height: 12),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      FilterChip(
                        label: Text(l10n.allCategories),
                        selected: _category.isEmpty,
                        onSelected: (_) => setState(() => _category = ''),
                      ),
                      for (final category in categories)
                        Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: FilterChip(
                            label: Text(catalogCategoryLabel(l10n, category)),
                            selected: _category == category,
                            onSelected: (_) =>
                                setState(() => _category = category),
                          ),
                        ),
                    ],
                  ),
                ),
              ],
              const SizedBox(height: 12),
              if (visible.isEmpty)
                Padding(
                  padding: const EdgeInsets.only(top: 32),
                  child: Text(l10n.noMatches, textAlign: TextAlign.center),
                )
              else
                SurfacePanel(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Column(
                    children: [
                      for (final item in visible)
                        ListTile(
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          title: Text(
                            item.name,
                            style: context.text.titleSmall,
                          ),
                          subtitle: Padding(
                            padding: const EdgeInsets.only(top: 4),
                            child: Wrap(
                              spacing: 8,
                              runSpacing: 6,
                              crossAxisAlignment: WrapCrossAlignment.center,
                              children: [
                                CategoryTag(
                                  label: catalogCategoryLabel(
                                    l10n,
                                    item.category.trim().isEmpty
                                        ? 'general'
                                        : item.category,
                                  ),
                                ),
                                Text(
                                  '${kindLabel(l10n, item.kind)} · ${unitLabel(l10n, item.unit)}',
                                  style: context.text.bodySmall,
                                ),
                              ],
                            ),
                          ),
                          trailing: Text(
                            formatMoney(item.unitPriceMinor, currency, locale),
                            style: context.text.titleSmall,
                          ),
                          onTap: () => context.push('/catalog/${item.id}/edit'),
                        ),
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

  Future<void> _create(BuildContext context, bool isPro) async {
    final count = ref.read(catalogProvider).asData?.value.length ?? 0;
    if (!isPro && count >= freeCatalogLimit) {
      await showProLimitDialog(
        context,
        title: context.l10n.catalogLimitTitle,
        body: context.l10n.catalogLimitBody,
      );
      return;
    }
    if (context.mounted) context.push('/catalog/new');
  }
}
