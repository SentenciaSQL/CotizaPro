import 'package:cotizapro/core/l10n/l10n_ext.dart';
import 'package:cotizapro/core/widgets/app_widgets.dart';
import 'package:cotizapro/data/providers.dart';
import 'package:cotizapro/features/pro/billing_messages.dart';
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
    final product = state?.product;
    final checking = state?.checkingEntitlement == true;
    final purchasePending = state?.pending == true;
    final loadingProduct = state?.loadingProduct == true;
    final message = billingMessage(l10n, state?.messageCode);
    return Scaffold(
      appBar: AppBar(title: Text(l10n.proTitle)),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(20, 8, 20, 32),
        children: [
          Text(
            isPro ? l10n.proActiveTitle : l10n.proSubtitle,
            style: context.text.headlineMedium,
          ),
          const SizedBox(height: 8),
          Text(
            isPro ? l10n.proActiveBody : l10n.proPriceNote,
            style: context.text.bodyMedium?.copyWith(
              color: context.palette.muted,
            ),
          ),
          const SizedBox(height: 20),
          SurfacePanel(
            child: Column(
              children: [
                _feature(
                  context,
                  Icons.all_inclusive_rounded,
                  l10n.featureUnlimited,
                ),
                _feature(context, Icons.block_rounded, l10n.featureNoAds),
                _feature(
                  context,
                  Icons.auto_awesome_outlined,
                  l10n.featureNoBrand,
                ),
                _feature(context, Icons.draw_outlined, l10n.featureCustomize),
                _feature(context, Icons.image_outlined, l10n.featureLogo),
                _feature(
                  context,
                  Icons.table_chart_outlined,
                  l10n.featureHistory,
                ),
              ],
            ),
          ),
          if (product != null) ...[
            const SizedBox(height: 16),
            Text(l10n.priceFromStore, style: context.text.bodyMedium),
            const SizedBox(height: 4),
            Text(product.price, style: context.text.headlineSmall),
          ],
          if (message != null) ...[
            const SizedBox(height: 12),
            Text(message, style: context.text.bodyMedium),
          ],
          const SizedBox(height: 20),
          if (!isPro) ...[
            PrimaryButton(
              label: product == null
                  ? l10n.retry
                  : l10n.buyProPrice(product.price),
              loading: loadingProduct || purchasePending || checking,
              onPressed: loadingProduct || purchasePending || checking
                  ? null
                  : () {
                      final billing = ref.read(billingControllerProvider);
                      if (product == null) {
                        billing.loadProduct();
                      } else {
                        billing.buy();
                      }
                    },
            ),
            const SizedBox(height: 8),
          ],
          SecondaryButton(
            label: l10n.restorePurchases,
            onPressed: checking
                ? null
                : () => ref.read(billingControllerProvider).restore(),
          ),
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
}
