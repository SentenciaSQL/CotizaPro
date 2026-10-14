import 'package:cotizapro/l10n/generated/app_localizations.dart';

String? billingMessage(AppLocalizations l10n, String? code) {
  return switch (code) {
    'pending' => l10n.purchasePending,
    'cancelled' => l10n.purchaseCancelled,
    'failed' => l10n.purchaseFailed,
    'unavailable' => l10n.storeUnavailable,
    'missing' => l10n.productUnavailable,
    'restoreEmpty' => l10n.restoreEmpty,
    'restored' => l10n.restoreDone,
    'unlocked' => l10n.proActiveTitle,
    _ => null,
  };
}
