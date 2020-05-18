import 'dart:io';
import 'package:firebase_admob/firebase_admob.dart';

class AdMobService {

  String getAdMobAppId() {
    if (Platform.isIOS) {
      return 'YOUR_ADMOB_iOS_ID';
    } else if (Platform.isAndroid) {
      return 'YOUR_ADMOB_ANDROID_ID';
    }
    return null;
  }

  String getBannerAdId() {
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
  }

  InterstitialAd getNewTripInterstitial() {
    return InterstitialAd(
      adUnitId: getInterstitialAdId(),
      listener: (MobileAdEvent event) {
        print("InterstitialAd event is $event");
      },
    );
  }
}