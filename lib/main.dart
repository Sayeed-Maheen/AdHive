import 'package:ad_hive/app_colors.dart';
import 'package:ad_hive/screens/splash_screen.dart';
import 'package:ad_hive/strings.dart';
import 'package:applovin_max/applovin_max.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

void main() async {
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
  Map? sdkConfiguration = await AppLovinMAX.initialize(
      "fm3JuPfG8PEp2lL9vnixg0Ler02ck8LX62PPKTWz8TJp0FALb9pPFOgGZD7fDV0Zvepqv0ObTDJZRGOSQ6LzLJ");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: appName,
            theme: ThemeData(
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              splashFactory: NoSplash.splashFactory,
              colorScheme:
                  ColorScheme.fromSeed(seedColor: AppColors.colorPrimary),
              useMaterial3: true,
            ),
            home: const SplashScreen(),
          );
        });
  }
}
