import 'package:cotizapro/core/l10n/l10n_ext.dart';
import 'package:cotizapro/core/widgets/app_widgets.dart';
import 'package:cotizapro/data/providers.dart';
import 'package:cotizapro/l10n/generated/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProScreen extends ConsumerStatefulWidget {
  const ProScreen({super.key});

  @override
  ConsumerState<ProScreen> createState() => _ProScreenState();
}

class _ProScreenState extends ConsumerState<ProScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(billingControllerProvider).loadProduct();
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final settings = ref.watch(settingsProvider);
    final billing = ref.watch(billingStateProvider);
    final isPro = settings.asData?.value.isPro ?? false;
    final state = billing.asData?.value;
    final message = _message(l10n, state?.messageCode);
    return Scaffold(
      appBar: AppBar(title: Text(l10n.proTitle)),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(20, 8, 20, 32),
        children: [
          Text(isPro ? l10n.proActiveTitle : l10n.proSubtitle, style: context.text.headlineMedium),
          const SizedBox(height: 8),
          Text(
            isPro ? l10n.proActiveBody : l10n.proPriceNote,
            style: context.text.bodyMedium?.copyWith(color: context.palette.muted),
          ),
          const SizedBox(height: 20),
          SurfacePanel(
            child: Column(
              children: [
                _feature(context, Icons.all_inclusive_rounded, l10n.featureUnlimited),
                _feature(context, Icons.block_rounded, l10n.featureNoAds),
                _feature(context, Icons.auto_awesome_outlined, l10n.featureNoBrand),
                _feature(context, Icons.draw_outlined, l10n.featureCustomize),
                _feature(context, Icons.image_outlined, l10n.featureLogo),
                _feature(context, Icons.table_chart_outlined, l10n.featureHistory),
              ],
            ),
          ),
          if (state?.product != null) ...[
            const SizedBox(height: 16),
            Text('${l10n.priceFromStore}: ${state!.product!.price}', style: context.text.titleMedium),
          ],
          if (message != null) ...[
            const SizedBox(height: 12),
            Text(message, style: context.text.bodyMedium),
          ],
          if (!isPro) ...[
            const SizedBox(height: 20),
            PrimaryButton(
              label: state?.product == null ? l10n.retry : l10n.buyPro,
              loading: state?.loadingProduct == true || state?.pending == true,
              onPressed: state?.product == null
                  ? () => ref.read(billingControllerProvider).loadProduct()
                  : () => ref.read(billingControllerProvider).buy(),
            ),
            const SizedBox(height: 8),
            SecondaryButton(
              label: l10n.restorePurchases,
              onPressed: () => ref.read(billingControllerProvider).restore(),
            ),
          ],
        ],
      ),
    );
  }

  Widget _feature(BuildContext context, IconData icon, String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Icon(icon, color: context.palette.teal),
          const SizedBox(width: 12),
          Expanded(child: Text(label, style: context.text.bodyLarge)),
        ],
      ),
    );
  }

  String? _message(AppLocalizations l10n, String? code) {
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
}
