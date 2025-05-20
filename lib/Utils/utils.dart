import 'package:deals_dray_test/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppUtils {
  static void showSnackBar({
    required String title,
    required String message,
    bool isError = false,
    Duration duration = const Duration(seconds: 3),
  }) {
    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.TOP,
      backgroundColor:
          isError ? cnstSheet.colors.red : cnstSheet.colors.tealBlue,
      colorText: cnstSheet.colors.white,
      borderRadius: 10,
      margin: const EdgeInsets.all(10),
      duration: duration,
      icon: Icon(
        isError ? Icons.error : Icons.check_circle,
        color: cnstSheet.colors.white,
      ),
    );
  }
}
