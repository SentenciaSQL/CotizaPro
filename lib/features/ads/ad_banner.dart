import 'dart:io';

import 'package:cotizapro/core/constants/monetization.dart';
import 'package:cotizapro/data/database/app_database.dart';
import 'package:cotizapro/data/providers.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdsBootstrap {
  static var _started = false;

  static Future<void> start() async {
    if (_started || kIsWeb) return;
    if (!Platform.isAndroid && !Platform.isIOS) return;
    _started = true;
    try {
      ConsentInformation.instance.requestConsentInfoUpdate(
        ConsentRequestParameters(),
        () async {
          try {
            await ConsentForm.loadAndShowConsentFormIfRequired((_) {});
          } catch (error) {
            debugPrint('Consent form skipped: $error');
          }
          await _initializeAds();
        },
        (error) async {
          debugPrint('Consent update failed: ${error.message}');
          await _initializeAds();
        },
      );
    } catch (error) {
      debugPrint('Ads bootstrap failed: $error');
    }
  }

  static Future<void> _initializeAds() async {
    try {
      await MobileAds.instance.initialize();
    } catch (error) {
      debugPrint('MobileAds initialize failed: $error');
    }
  }
}

class AdBannerSlot extends ConsumerStatefulWidget {
  const AdBannerSlot({super.key});

  @override
  ConsumerState<AdBannerSlot> createState() => _AdBannerSlotState();
}

class _AdBannerSlotState extends ConsumerState<AdBannerSlot> {
  BannerAd? _ad;
  var _loaded = false;
  var _loading = false;

  bool get _supported => !kIsWeb && (Platform.isAndroid || Platform.isIOS);

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _sync();
  }

  bool get _entitlementOpen {
    final billing = ref.read(billingStateProvider);
    if (billing.isLoading) return true;
    final state = billing.asData?.value;
    return state == null || state.checkingEntitlement;
  }

  void _sync() {
    final settings = ref.read(settingsProvider).asData?.value;
    final visible = TickerMode.valuesOf(context).enabled;
    final blocked =
        settings == null ||
        settings.isPro ||
        _entitlementOpen ||
        !visible ||
        !_supported;
    if (blocked) {
      _release();
      return;
    }
    if (_ad != null || _loading) return;
    final unitId = bannerAdUnitId(android: Platform.isAndroid);
    if (unitId.contains('X')) return;
    final ad = BannerAd(
      adUnitId: unitId,
      size: AdSize.banner,
      request: const AdRequest(nonPersonalizedAds: true),
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          if (!mounted || _ad != ad) {
            ad.dispose();
            return;
          }
          setState(() => _loaded = true);
        },
        onAdFailedToLoad: (ad, error) {
          debugPrint('Banner failed: ${error.message}');
          ad.dispose();
          if (_ad == ad) _ad = null;
          _loading = false;
          if (mounted && _loaded) {
            setState(() => _loaded = false);
          }
        },
      ),
    );
    _ad = ad;
    _loading = true;
    ad.load();
  }

  void _release() {
    final ad = _ad;
    if (ad == null && !_loading && !_loaded) return;
    _ad = null;
    _loading = false;
    final wasLoaded = _loaded;
    _loaded = false;
    if (wasLoaded && mounted) setState(() {});
    if (ad != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) => ad.dispose());
    }
  }

  @override
  void dispose() {
    _ad?.dispose();
    _ad = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(settingsProvider, (previous, next) => _sync());
    ref.listen(billingStateProvider, (previous, next) => _sync());
    final settings = ref.watch(settingsProvider).asData?.value;
    final billing = ref.watch(billingStateProvider);
    final checking =
        billing.isLoading ||
        (billing.asData?.value.checkingEntitlement ?? false);
    if (settings == null ||
        settings.isPro ||
        checking ||
        !_loaded ||
        _ad == null) {
      return const SizedBox.shrink();
    }
    final ad = _ad!;
    return Padding(
      padding: const EdgeInsets.only(top: 16, bottom: 8),
      child: Center(
        child: SizedBox(
          width: ad.size.width.toDouble(),
          height: ad.size.height.toDouble(),
          child: AdWidget(ad: ad),
        ),
      ),
    );
  }
}

bool isProUser(AppSetting? settings) => settings?.isPro ?? false;
