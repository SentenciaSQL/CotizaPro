import 'package:cotizapro/core/catalog/catalog_categories.dart';
import 'package:cotizapro/core/errors/app_exceptions.dart';
import 'package:cotizapro/core/l10n/l10n_ext.dart';
import 'package:cotizapro/core/money/money.dart';
import 'package:cotizapro/core/widgets/app_widgets.dart';
import 'package:cotizapro/data/providers.dart';
import 'package:cotizapro/features/pro/limit_dialog.dart';
import 'package:cotizapro/features/quotations/quote_labels.dart';
import 'package:cotizapro/features/quotations/quote_models.dart';
import 'package:cotizapro/features/services_catalog/catalog_labels.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class CatalogFormScreen extends ConsumerStatefulWidget {
  const CatalogFormScreen({super.key, this.itemId});

  final int? itemId;

  @override
  ConsumerState<CatalogFormScreen> createState() => _CatalogFormScreenState();
}

class _CatalogFormScreenState extends ConsumerState<CatalogFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final _name = TextEditingController();
  final _description = TextEditingController();
  final _price = TextEditingController();
  String _category = 'general';
  String _unit = 'unit';
  String _kind = 'service';
  var _ready = false;
  var _loading = false;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    final id = widget.itemId;
    if (id == null) {
      setState(() => _ready = true);
      return;
    }
    final item = await ref.read(catalogRepositoryProvider).getById(id);
    if (!mounted) return;
    if (item != null) {
      final locale = Localizations.localeOf(context).toString();
      final currency =
          ref.read(profileProvider).asData?.value.currencyCode ?? 'USD';
      _name.text = item.name;
      _description.text = item.description ?? '';
      _category = normalizeCatalogCategory(item.category);
      _price.text = scaledToInput(
        item.unitPriceMinor,
        currencyScale(currency),
        locale,
      );
      _unit = unitCodes.contains(item.unit) ? item.unit : 'unit';
      _kind = item.kind;
    }
    setState(() => _ready = true);
  }

  @override
  void dispose() {
    _name.dispose();
    _description.dispose();
    _price.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final editing = widget.itemId != null;
    return Scaffold(
      appBar: AppBar(
        title: Text(editing ? l10n.editItem : l10n.newItem),
        actions: [
          if (editing)
            IconButton(
              tooltip: l10n.delete,
              onPressed: _delete,
              icon: const Icon(Icons.delete_outline_rounded),
            ),
        ],
      ),
      body: !_ready
          ? const LoadingView()
          : Form(
              key: _formKey,
              child: ListView(
                padding: const EdgeInsets.fromLTRB(20, 8, 20, 32),
                children: [
                  TextFormField(
                    controller: _name,
                    decoration: InputDecoration(labelText: l10n.itemName),
                    validator: (value) => value == null || value.trim().isEmpty
                        ? l10n.fieldRequired
                        : null,
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
                    controller: _description,
                    minLines: 2,
                    maxLines: 4,
                    decoration: InputDecoration(
                      labelText: l10n.itemDescription,
                    ),
                  ),
                  const SizedBox(height: 12),
                  AppSelectField<String>(
                    label: l10n.category,
                    value: _category,
                    items: [
                      for (final id in <String>{
                        ...catalogCategoryIds,
                        _category,
                      })
                        DropdownMenuItem(
                          value: id,
                          child: Text(catalogCategoryLabel(l10n, id)),
                        ),
                    ],
                    onChanged: (value) {
                      if (value == null) return;
                      setState(() => _category = value);
                    },
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
                    controller: _price,
                    keyboardType: const TextInputType.numberWithOptions(
                      decimal: true,
                    ),
                    decoration: InputDecoration(labelText: l10n.price),
                    validator: (value) {
                      final currency =
                          ref
                              .read(profileProvider)
                              .asData
                              ?.value
                              .currencyCode ??
                          'USD';
                      final parsed = parseDecimalToScaled(
                        value ?? '',
                        currencyScale(currency),
                      );
                      if (parsed == null || parsed < 0) {
                        return l10n.invalidAmount;
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  Text(l10n.kind, style: context.text.titleSmall),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 8,
                    children: [
                      for (final kind in [
                        'labor',
                        'material',
                        'service',
                        'product',
                      ])
                        ChoiceChip(
                          label: Text(kindLabel(l10n, kind)),
                          selected: _kind == kind,
                          onSelected: (_) => setState(() => _kind = kind),
                        ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Text(l10n.pdfUnit, style: context.text.titleSmall),
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
                  const SizedBox(height: 20),
                  PrimaryButton(
                    label: l10n.save,
                    loading: _loading,
                    onPressed: _save,
                  ),
                ],
              ),
            ),
    );
  }

  Future<void> _save() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() => _loading = true);
    final l10n = context.l10n;
    final currency =
        ref.read(profileProvider).asData?.value.currencyCode ?? 'USD';
    final price = parseDecimalToScaled(_price.text, currencyScale(currency))!;
    final isPro = ref.read(settingsProvider).asData?.value.isPro ?? false;
    try {
      final repo = ref.read(catalogRepositoryProvider);
      if (widget.itemId == null) {
        await repo.create(
          name: _name.text,
          description: _description.text,
          category: _category,
          unit: _unit,
          unitPriceMinor: price,
          kind: _kind,
          isPro: isPro,
        );
      } else {
        await repo.updateItem(
          id: widget.itemId!,
          name: _name.text,
          description: _description.text,
          category: _category,
          unit: _unit,
          unitPriceMinor: price,
          kind: _kind,
        );
      }
      if (!mounted) return;
      showAppMessage(context, l10n.itemSaved);
      context.pop();
    } on CatalogLimitException {
      if (!mounted) return;
      await showProLimitDialog(
        context,
        title: l10n.catalogLimitTitle,
        body: l10n.catalogLimitBody,
      );
    } catch (_) {
      if (mounted) showAppMessage(context, l10n.errorGeneric);
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }

  Future<void> _delete() async {
    final l10n = context.l10n;
    final confirmed = await showConfirmDialog(
      context,
      title: l10n.deleteItemTitle,
      body: l10n.deleteItemBody,
      confirmLabel: l10n.delete,
      cancelLabel: l10n.cancel,
      destructive: true,
    );
    if (!confirmed || widget.itemId == null) return;
    await ref.read(catalogRepositoryProvider).deleteItem(widget.itemId!);
    if (mounted) {
      showAppMessage(context, l10n.deleted);
      context.pop();
    }
  }
}
