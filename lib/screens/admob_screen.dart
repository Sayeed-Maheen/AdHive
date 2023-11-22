import 'package:ad_hive/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../admob_ad_manager.dart';
import '../app_colors.dart';

class AdmobScreen extends StatefulWidget {
  const AdmobScreen({Key? key}) : super(key: key);

  @override
  State<AdmobScreen> createState() => _AdmobScreenState();
}

class _AdmobScreenState extends State<AdmobScreen> {
  final InterstitialAdManager interstitialAdManager = InterstitialAdManager();
  final RewardedAdManager rewardedAdManager = RewardedAdManager();

  @override
  void initState() {
    super.initState();
    interstitialAdManager.createInterstitial();
    rewardedAdManager.createRewardedAd();
  }

  @override
  void dispose() {
    super.dispose();
    interstitialAdManager.dispose();
    rewardedAdManager.dispose();
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
          admob,
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
                        msg: "You are already seeing Banner Ad",
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
                    interstitialAdManager.showInterstitialAd();
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
                rewardedAdManager.showRewardedAd();
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
      bottomNavigationBar: const BannerAdWidget(),
    );
  }
}
