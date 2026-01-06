// import 'dart:developer';
// import 'package:easy_audience_network/easy_audience_network.dart';
// import 'package:flutter/material.dart';
//
// import '../Providers/mydialog.dart';
//
// class AdHelper {
//   static void init() {
//     EasyAudienceNetwork.init(
//       testMode: true, // for testing purpose but comment it before making the app live
//     );
//   }
//
//   static void showInterstitialAd(BuildContext context, VoidCallback onComplete) {
//     // Show loading
//     MyDialog.showLoadingDialog(context);
//
//     final interstitialAd = InterstitialAd(InterstitialAd.testPlacementId);
//
//     interstitialAd.listener = InterstitialAdListener(onLoaded: () {
//       // Hide loading
//       Navigator.pop(context);
//       onComplete();
//
//       interstitialAd.show();
//     }, onDismissed: () {
//       interstitialAd.destroy();
//     }, onError: (i, e) {
//       // Hide loading
//       Navigator.pop(context);
//       onComplete();
//
//       log('Interstitial error: $e');
//     });
//
//     interstitialAd.load();
//   }
//
//   static Widget nativeAd() {
//     return SafeArea(
//       child: NativeAd(
//         placementId: NativeAd.testPlacementId,
//         adType: NativeAdType.NATIVE_AD,
//         keepExpandedWhileLoading: false,
//         expandAnimationDuraion: 1000,
//         listener: NativeAdListener(
//           onError: (code, message) => log('Error: $message'),
//           onLoaded: () => log('Native ad loaded'),
//           onClicked: () => log('Native ad clicked'),
//           onLoggingImpression: () => log('Native ad impression logged'),
//           onMediaDownloaded: () => log('Media downloaded for native ad'),
//         ),
//       ),
//     );
//   }
//
//   static Widget nativeBannerAd() {
//     return SafeArea(
//       child: NativeAd(
//         placementId: NativeAd.testPlacementId,
//         adType: NativeAdType.NATIVE_BANNER_AD,
//         bannerAdSize: NativeBannerAdSize.HEIGHT_100,
//         keepExpandedWhileLoading: false,
//         height: 100,
//         expandAnimationDuraion: 1000,
//         listener: NativeAdListener(
//           onError: (code, message) => log('Error: $message'),
//           onLoaded: () => log('Native banner ad loaded'),
//           onClicked: () => log('Native banner ad clicked'),
//           onLoggingImpression: () => log('Native banner ad impression logged'),
//           onMediaDownloaded: () => log('Media downloaded for native banner ad'),
//         ),
//       ),
//     );
//   }
// }
