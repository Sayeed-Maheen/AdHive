import 'package:ad_hive/screens/admob_screen.dart';
import 'package:ad_hive/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../app_colors.dart';
import 'applovin_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.colorWhite,
        appBar: AppBar(
          systemOverlayStyle: SystemUiOverlayStyle.light,
          flexibleSpace: Container(
            color: AppColors.colorPrimary, // Set a fixed color here
          ),
          title: Text(
            "AdHive",
            style: TextStyle(
              fontSize: 22.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.colorWhite,
            ),
          ),
          centerTitle: true,
        ),
        body: SafeArea(
            child: Padding(
          padding: REdgeInsets.all(16),
          child: Column(
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AdmobScreen()));
                },
                child: Container(
                  height: 70.h,
                  width: double.infinity,
                  padding: REdgeInsets.all(16),
                  margin: REdgeInsets.only(bottom: 16),
                  decoration: BoxDecoration(
                      color: AppColors.colorContainer,
                      borderRadius: BorderRadius.circular(12)),
                  child: Row(
                    children: [
                      Image.asset(
                        "assets/images/admob.png",
                        height: 30.h,
                        width: 30.w,
                      ),
                      SizedBox(width: 16.w),
                      Text(
                        admob,
                        style: TextStyle(
                          fontSize: 28.sp,
                          fontWeight: FontWeight.w600,
                          color: AppColors.colorPrimary,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AppLovinScreen()));
                },
                child: Container(
                  height: 70.h,
                  width: double.infinity,
                  padding: REdgeInsets.all(16),
                  margin: REdgeInsets.only(bottom: 16),
                  decoration: BoxDecoration(
                      color: AppColors.colorContainer,
                      borderRadius: BorderRadius.circular(12)),
                  child: Row(
                    children: [
                      Image.asset(
                        "assets/images/appLovin.png",
                        height: 30.h,
                        width: 30.w,
                      ),
                      SizedBox(width: 16.w),
                      Text(
                        appLovin,
                        style: TextStyle(
                          fontSize: 28.sp,
                          fontWeight: FontWeight.w600,
                          color: AppColors.colorPrimary,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  height: 70.h,
                  width: double.infinity,
                  padding: REdgeInsets.all(16),
                  margin: REdgeInsets.only(bottom: 16),
                  decoration: BoxDecoration(
                      color: AppColors.colorContainer,
                      borderRadius: BorderRadius.circular(12)),
                  child: Row(
                    children: [
                      Image.asset(
                        "assets/images/unity.png",
                        height: 30.h,
                        width: 30.w,
                      ),
                      SizedBox(width: 16.w),
                      Text(
                        unity,
                        style: TextStyle(
                          fontSize: 28.sp,
                          fontWeight: FontWeight.w600,
                          color: AppColors.colorPrimary,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        )));
  }
}
