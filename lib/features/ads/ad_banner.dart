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

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _maybeLoad());
  }

  void _maybeLoad() {
    final settings = ref.read(settingsProvider).asData?.value;
    if (settings == null || settings.isPro || !_supported) return;
    final unitId = bannerAdUnitId(android: Platform.isAndroid);
    if (unitId.contains('X')) return;
    final ad = BannerAd(
      adUnitId: unitId,
      size: AdSize.banner,
      request: const AdRequest(nonPersonalizedAds: true),
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          if (mounted) setState(() => _loaded = true);
        },
        onAdFailedToLoad: (ad, error) {
          debugPrint('Banner failed: ${error.message}');
          ad.dispose();
          if (mounted) {
            setState(() {
              _ad = null;
              _loaded = false;
            });
          }
        },
      ),
    );
    _ad = ad;
    ad.load();
  }

  bool get _supported => !kIsWeb && (Platform.isAndroid || Platform.isIOS);

  @override
  void dispose() {
    _ad?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final settings = ref.watch(settingsProvider).asData?.value;
    if (settings == null || settings.isPro || !_loaded || _ad == null) {
      return const SizedBox.shrink();
    }
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: Center(
        child: SizedBox(
          width: _ad!.size.width.toDouble(),
          height: _ad!.size.height.toDouble(),
          child: AdWidget(ad: _ad!),
        ),
      ),
    );
  }
}

bool isProUser(AppSetting? settings) => settings?.isPro ?? false;
