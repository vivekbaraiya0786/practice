import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:techinal_practice/helper/google_ads_helper/ads_helper.dart';

class Ad_Page extends StatefulWidget {
  const Ad_Page({super.key});

  @override
  State<Ad_Page> createState() => _Ad_PageState();
}

class _Ad_PageState extends State<Ad_Page> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Ad_Helper.ad_helper.loadBannerAd();
    Ad_Helper.ad_helper.loadInterstitialAd();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TEST ADS"),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Container(
            //   height: 100,
            //   width: Ad_Helper.ad_helper.bannerAd!.size.width.toDouble(),
            //   color: Colors.red,
            //   child: AdWidget(ad: Ad_Helper.ad_helper.bannerAd!),
            // ),
            ElevatedButton(onPressed: () {
              Ad_Helper.ad_helper.interstitialAd!.show();
            }, child: Text("interstitialAd"))
          ],
        ),
      ),
    );
  }

  // @override
  // void dispose() {
  //   // TODO: implement dispose
  //   super.dispose();
  //   Ad_Helper.ad_helper.bannerAd!.dispose();
  // }
}
