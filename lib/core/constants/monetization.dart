/// Non-consumable product id. Create it in Google Play Console and App Store
/// Connect. The charged price is the one returned by the store, never a
/// constant in this file.
const String proProductId = 'cotizapro_pro';

/// Google sample ids. Replace both the native app ids and these unit ids
/// before publishing. See README for the production checklist.
const bool useGoogleTestAds = true;

const String testAndroidBannerId = 'ca-app-pub-3940256099942544/6300978111';
const String testIosBannerId = 'ca-app-pub-3940256099942544/2934735716';

/// Replace these when [useGoogleTestAds] is set to false.
const String productionAndroidBannerId =
    'ca-app-pub-XXXXXXXXXXXXXXXX/XXXXXXXXXX';
const String productionIosBannerId = 'ca-app-pub-XXXXXXXXXXXXXXXX/XXXXXXXXXX';

String bannerAdUnitId({required bool android}) {
  if (useGoogleTestAds) {
    return android ? testAndroidBannerId : testIosBannerId;
  }
  return android ? productionAndroidBannerId : productionIosBannerId;
}
