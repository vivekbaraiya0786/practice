import 'package:google_mobile_ads/google_mobile_ads.dart';

class Ad_Helper {
  Ad_Helper._();

  static final Ad_Helper ad_helper = Ad_Helper._();

  BannerAd? bannerAd;

  loadBannerAd() {
    String AdUnitId = "ca-app-pub-3940256099942544/6300978111";
    bannerAd = BannerAd(
      size: AdSize.largeBanner,
      adUnitId: AdUnitId,
      request: const AdRequest(
          // contentUrl:
          // extras:
          // httpTimeoutMillis:
          // keywords:
          // mediationExtrasIdentifier:
          // neighboringContentUrls:
          // nonPersonalizedAds:
          ),
      listener: BannerAdListener(
        // onAdLoaded: (ad) {},
        // onAdClosed: (ad) {},
        // onAdClicked: (ad) {},
        // onAdFailedToLoad: (ad, error) {},
        // onAdImpression: (ad) {},
        // onAdOpened: (ad) {},
        // onAdWillDismissScreen: (ad) {},
        // onPaidEvent: (ad, valueMicros, precision, currencyCode) {},
      ),
    )..load();
  }

  InterstitialAd? interstitialAd;

  loadInterstitialAd() {
    String AdUnitId = "ca-app-pub-3940256099942544/1033173712";
    InterstitialAd.load(
        adUnitId: AdUnitId,
        request: const AdRequest(),
        adLoadCallback: InterstitialAdLoadCallback(
          onAdLoaded: (ad) {
            interstitialAd = ad;
          },
          onAdFailedToLoad: (error) {},
        ));
  }

  RewardedAd? rewardedAd;

  loadRewardedAd() {
    // String AdUnitId = "ca-app-pub-3940256099942544/5224354917";
    RewardedAd.load(
        adUnitId: "ca-app-pub-3940256099942544/5224354917",
        request: const AdRequest(),
        rewardedAdLoadCallback: RewardedAdLoadCallback(
          onAdLoaded: (ad) {},
          onAdFailedToLoad: (error) {},
        ));
  }

  AppOpenAd? appOpenAd;

  loadAppOpenAd() {
    String AdUnitId = "ca-app-pub-3940256099942544/3419835294";
    AppOpenAd.load(
        adUnitId: AdUnitId,
        request: const AdRequest(),
        adLoadCallback: AppOpenAdLoadCallback(
          onAdLoaded: (ad) {},
          onAdFailedToLoad: (error) {},
        ),
        orientation: AppOpenAd.orientationPortrait);
  }
}
