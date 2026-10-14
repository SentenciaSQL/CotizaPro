/// Stable category ids stored in SQLite. Labels are translated in the UI.
const catalogCategoryIds = <String>[
  'general',
  'labor',
  'materials',
  'installation',
  'repair',
  'maintenance',
  'transport',
  'tools',
  'professional',
  'other',
];

/// Display names that older free-text categories may already contain.
const catalogCategoryAliases = <String, String>{
  'general': 'general',
  'mano de obra': 'labor',
  'labor': 'labor',
  'materiales': 'materials',
  'materials': 'materials',
  'instalacion': 'installation',
  'instalación': 'installation',
  'installation': 'installation',
  'reparacion': 'repair',
  'reparación': 'repair',
  'repair': 'repair',
  'mantenimiento': 'maintenance',
  'maintenance': 'maintenance',
  'transporte': 'transport',
  'transport': 'transport',
  'equipos y herramientas': 'tools',
  'equipment and tools': 'tools',
  'tools': 'tools',
  'servicios profesionales': 'professional',
  'professional services': 'professional',
  'professional': 'professional',
  'otros': 'other',
  'other': 'other',
};

/// Maps empty or known labels to an id. Unknown text is kept so existing
/// concepts are not discarded.
String normalizeCatalogCategory(String? raw) {
  final text = raw?.trim() ?? '';
  if (text.isEmpty) return 'general';
  if (catalogCategoryIds.contains(text)) return text;
  return catalogCategoryAliases[text.toLowerCase()] ?? text;
}
