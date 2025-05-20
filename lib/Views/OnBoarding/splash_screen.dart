import 'package:deals_dray_test/Controllers/splash_controller.dart';
import 'package:deals_dray_test/Res/Services/app_config.dart';
import 'package:deals_dray_test/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    nextScreen();
  }

  nextScreen() {
    Future.delayed(const Duration(milliseconds: 300), () async {
      final splashController = Get.find<SplashController>();
      await splashController.sentSplashData(); // Send Splash Data
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.asset(
              cnstSheet.images.splashScreenBG,
              fit: BoxFit.cover,
            ),
          ),
          // Loading Indicator
          Center(
            child: SpinKitCircle(
              color: cnstSheet.colors.primary,
              size: 60.0.sp,
            ),
          ),
          // Logo
          Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(AppConfig.appLogo, height: 150.sp, width: 150.sp),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
