import 'package:cotizapro/core/widgets/app_widgets.dart';
import 'package:cotizapro/features/quotations/quote_models.dart';
import 'package:cotizapro/l10n/generated/app_localizations.dart';

String statusLabel(AppLocalizations l10n, QuoteDisplayStatus status) {
  return switch (status) {
    QuoteDisplayStatus.draft => l10n.statusDraft,
    QuoteDisplayStatus.sent => l10n.statusSent,
    QuoteDisplayStatus.accepted => l10n.statusAccepted,
    QuoteDisplayStatus.rejected => l10n.statusRejected,
    QuoteDisplayStatus.expired => l10n.statusExpired,
  };
}

StatusTone statusTone(QuoteDisplayStatus status) {
  return switch (status) {
    QuoteDisplayStatus.draft => StatusTone.neutral,
    QuoteDisplayStatus.sent => StatusTone.info,
    QuoteDisplayStatus.accepted => StatusTone.success,
    QuoteDisplayStatus.rejected => StatusTone.danger,
    QuoteDisplayStatus.expired => StatusTone.warning,
  };
}

String kindLabel(AppLocalizations l10n, String kind) {
  return switch (kind) {
    'labor' => l10n.kindLabor,
    'material' => l10n.kindMaterial,
    'service' => l10n.kindService,
    'product' => l10n.kindProduct,
    _ => l10n.kindService,
  };
}

String unitLabel(AppLocalizations l10n, String unit) {
  return switch (unit) {
    'hour' => l10n.unitHour,
    'day' => l10n.unitDay,
    'meter' => l10n.unitMeter,
    'squareMeter' => l10n.unitSquare,
    'kg' => l10n.unitKg,
    _ => l10n.unitUnit,
  };
}

String greetingFor(AppLocalizations l10n, DateTime now, String name) {
  final base = switch (now.hour) {
    < 12 => l10n.greetingMorning,
    < 19 => l10n.greetingAfternoon,
    _ => l10n.greetingEvening,
  };
  final trimmed = name.trim();
  if (trimmed.isEmpty) return base;
  return l10n.greetingNamed(base, trimmed);
}
