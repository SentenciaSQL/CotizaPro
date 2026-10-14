import 'package:cotizapro/core/catalog/catalog_categories.dart';
import 'package:cotizapro/core/theme/app_colors.dart';
import 'package:cotizapro/core/widgets/app_widgets.dart';
import 'package:cotizapro/l10n/generated/app_localizations.dart';
import 'package:flutter/material.dart';

String catalogCategoryLabel(AppLocalizations l10n, String id) {
  return switch (id) {
    'general' => l10n.catGeneral,
    'labor' => l10n.catLabor,
    'materials' => l10n.catMaterials,
    'installation' => l10n.catInstallation,
    'repair' => l10n.catRepair,
    'maintenance' => l10n.catMaintenance,
    'transport' => l10n.catTransport,
    'tools' => l10n.catTools,
    'professional' => l10n.catProfessional,
    'other' => l10n.catOther,
    _ => id,
  };
}

List<String> orderedCatalogCategories(Iterable<String> stored) {
  final present = stored
      .map((value) => value.trim())
      .where((value) => value.isNotEmpty)
      .toSet();
  return [
    for (final id in catalogCategoryIds)
      if (present.contains(id)) id,
    ...present.where((id) => !catalogCategoryIds.contains(id)).toList()..sort(),
  ];
}

class CategoryTag extends StatelessWidget {
  const CategoryTag({super.key, required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: context.palette.tealSoft,
        borderRadius: BorderRadius.circular(AppRadius.pill),
      ),
      child: Text(
        label,
        style: context.text.bodySmall?.copyWith(color: context.palette.teal),
      ),
    );
  }
}
