import 'package:applovin_max/applovin_max.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:math' as m;

import '../app_colors.dart';
import '../strings.dart';

class AppLovinScreen extends StatefulWidget {
  const AppLovinScreen({Key? key}) : super(key: key);

  @override
  State<AppLovinScreen> createState() => _AppLovinScreenState();
}

class _AppLovinScreenState extends State<AppLovinScreen> {
  var _interstitialRetryAttempt = 0;

  void initializeInterstitialAds() {
    AppLovinMAX.setInterstitialListener(InterstitialListener(
      onAdLoadedCallback: (ad) {
        // Interstitial ad is ready to be shown. AppLovinMAX.isInterstitialReady(_interstitial_ad_unit_id) will now return 'true'
        print('Interstitial ad loaded from ' + ad.networkName);

        // Reset retry attempt
        _interstitialRetryAttempt = 0;
      },
      onAdLoadFailedCallback: (adUnitId, error) {
        // Interstitial ad failed to load
        // We recommend retrying with exponentially higher delays up to a maximum delay (in this case 64 seconds)
        _interstitialRetryAttempt = _interstitialRetryAttempt + 1;

        int retryDelay = m.pow(2, m.min(6, _interstitialRetryAttempt)).toInt();

        print('Interstitial ad failed to load with code ' +
            error.code.toString() +
            ' - retrying in ' +
            retryDelay.toString() +
            's');

        Future.delayed(Duration(milliseconds: retryDelay * 1000), () {
          AppLovinMAX.loadInterstitial(applovinInterstitialAdUnitId);
        });
      },
      onAdDisplayedCallback: (ad) {},
      onAdDisplayFailedCallback: (ad, error) {},
      onAdClickedCallback: (ad) {},
      onAdHiddenCallback: (ad) {},
    ));

    // Load the first interstitial
    AppLovinMAX.loadInterstitial(applovinInterstitialAdUnitId);
  }

  Future<void> showInterstitialAd() async {
    bool isReady =
        (await AppLovinMAX.isInterstitialReady(applovinInterstitialAdUnitId))!;
    if (isReady) {
      AppLovinMAX.showInterstitial(applovinInterstitialAdUnitId);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.colorWhite,
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle.light,
        flexibleSpace: Container(
          color: AppColors.colorPrimary, // Set a fixed color here
        ),
        titleSpacing: -1,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back,
            color: AppColors.colorWhite,
          ),
        ),
        title: Text(
          appLovin,
          style: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.w600,
            color: AppColors.colorWhite,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
          child: Padding(
        padding: REdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    Fluttertoast.showToast(
                        msg: "Coming soon",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 1,
                        backgroundColor: AppColors.colorPrimary,
                        textColor: Colors.white,
                        fontSize: 16.0);
                  },
                  child: Container(
                    height: 150.h,
                    width: 155.w,
                    decoration: BoxDecoration(
                        color: AppColors.colorContainer,
                        borderRadius: BorderRadius.circular(12)),
                    child: Center(
                      child: Text(
                        bannerAdTitle,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w600,
                          color: AppColors.colorPrimary,
                        ),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    initializeInterstitialAds();
                    showInterstitialAd();
                  },
                  child: Container(
                    height: 150.h,
                    width: 155.w,
                    decoration: BoxDecoration(
                        color: AppColors.colorContainer,
                        borderRadius: BorderRadius.circular(12)),
                    child: Center(
                      child: Text(
                        interstitialAdTitle,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w600,
                          color: AppColors.colorPrimary,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.h),
            InkWell(
              onTap: () {
                Fluttertoast.showToast(
                    msg: "Coming soon",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 1,
                    backgroundColor: AppColors.colorPrimary,
                    textColor: Colors.white,
                    fontSize: 16.0);
              },
              child: Container(
                height: 150.h,
                width: 155.w,
                decoration: BoxDecoration(
                    color: AppColors.colorContainer,
                    borderRadius: BorderRadius.circular(12)),
                child: Center(
                  child: Text(
                    rewardedAdTitle,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.colorPrimary,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
