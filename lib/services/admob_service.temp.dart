import 'dart:io';

class AdMobService {

  /*String getAdMobAppId() {
    if (Platform.isIOS) {
      return 'YOUR_ADMOB_iOS_ID';
    } else if (Platform.isAndroid) {
      return 'YOUR_ADMOB_ANDROID_ID';
    }
    return null;
  }

  static String _getBannerAdId() {
    if (Platform.isIOS) {
      return 'YOUR_ADMOB_iOS_ID';
    } else if (Platform.isAndroid) {
      return "YOUR_ADMOB_ANDROID_ID";
    }
    return null;
  }

  String getInterstitialAdId() {
      if (Platform.isIOS) {
        return 'YOUR_ADMOB_iOS_ID';
      } else if (Platform.isAndroid) {
        return "YOUR_ADMOB_ANDROID_ID";
      }
      return null;
  }*/

  /*InterstitialAd getNewTripInterstitial() {
    return InterstitialAd(
      adUnitId: getInterstitialAdId(),
      listener: (MobileAdEvent event) {
        print("InterstitialAd event is $event");
      },
    );
  }

  static BannerAd _homeBannerAd;

  static BannerAd _getHomePageBannerAd() {
    return BannerAd(
      adUnitId: _getBannerAdId(),
      size: AdSize.smartBanner
    );
  }

  static void showHomeBannerAd() {
    if ( _homeBannerAd == null ) _homeBannerAd = _getHomePageBannerAd();
    _homeBannerAd
      ..load()
      ..show(anchorType: AnchorType.bottom, anchorOffset: kBottomNavigationBarHeight);
  }

  static void hideHomeBannerAd() async {
    await _homeBannerAd.dispose();
    _homeBannerAd = null;
  }*/
}