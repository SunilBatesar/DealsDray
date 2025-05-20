import 'package:deals_dray_test/Data/Networks/baseapiservice.dart';
import 'package:deals_dray_test/Data/Networks/network_api_service.dart';
import 'package:deals_dray_test/Data/app_exceptions.dart';
import 'package:deals_dray_test/Res/Apis/apis.dart';
import 'package:deals_dray_test/Utils/Routes/routes_name.dart';
import 'package:deals_dray_test/Utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final BaseapiService _service = NetworkApiService();
  // Loading variable
  final RxBool _isloading = false.obs;
  RxBool get isloading => _isloading;

  // Send OTP Function
  Future<void> sendOtp({
    required String number,
    required String deviceId,
  }) async {
    try {
      _isloading.value = true;
      final response = await _service.post(Apis.sendOtpUrl, {
        "mobileNumber": number,
        "deviceId": deviceId,
      });
      if (response != null && response['status'] == 1) {
        _isloading.value = false;
        AppUtils.showSnackBar(
          title: "Success",
          message: "OTP sent successfully",
        ); // Show success message
        // Navigate to OTP screen
        Get.offNamed(
          RoutesName.otpScreen,
          arguments: {
            "userId": response["data"]['userId'].toString(),
            "deviceId": response["data"]['deviceId'].toString(),
            "mobileNumber": number,
          },
        );
      }
    } catch (e) {
      if (e is AppExceptions) {
        AppUtils.showSnackBar(
          title: "Error",
          message: e.message ?? "Something went wrong",
          isError: true,
        );
      } else {
        AppUtils.showSnackBar(
          title: "Error",
          message: "Error sending OTP",
          isError: true,
        );
      }
      _isloading.value = false;
      debugPrint("Error sending OTP: $e");
    }
  }

  // Verify OTP Function
  Future<void> verifyOtp({
    required String userId,
    required String deviceId,
    required String otp,
  }) async {
    try {
      _isloading.value = true;
      final response = await _service.post(Apis.verifyOtpUrl, {
        "otp": otp,
        "deviceId": deviceId,
        "userId": userId,
      });
      if (response != null && response['status'] == 1) {
        _isloading.value = false;
        // Navigate to Register screen
        Get.toNamed(
          RoutesName.registerScreen,
          arguments: {"userId": userId, "deviceId": deviceId},
        );
      }
      // Invalid OTP
      if (response["status"] == 3) {
        _isloading.value = false;
        AppUtils.showSnackBar(
          title: "Error",
          message: "Invalid OTP",
          isError: true,
        ); // Show error message
      }
    } catch (e) {
      _isloading.value = false;
      debugPrint("Error verifying OTP: $e");
      if (e is AppExceptions) {
        AppUtils.showSnackBar(
          title: "Error",
          message: e.message ?? "Something went wrong",
          isError: true,
        );
      } else {
        AppUtils.showSnackBar(
          title: "Error",
          message: "Error verifying OTP",
          isError: true,
        );
      }
    }
  }

  // Register Function
  Future<void> register({
    required String email,
    required String password,
    required String referralCode,
    required String userId,
  }) async {
    try {
      _isloading.value = true;
      final response = await _service.post(Apis.registerUrl, {
        "email": email,
        "password": password,
        "referralCode": "",
        "userId": userId,
      });
      if (response != null && response['status'] == 1) {
        AppUtils.showSnackBar(
          title: "Success",
          message: "Registration successful",
        ); // Show success message
        // Navigate to Home screen
        Get.offNamed(RoutesName.homeScreen);
      } else {
        AppUtils.showSnackBar(
          title: "Error",
          message: "Registration failed",
          isError: true,
        ); // Show error message
      }
      _isloading.value = false;
    } catch (e) {
      _isloading.value = false;
      if (e is AppExceptions) {
        AppUtils.showSnackBar(
          title: "Error",
          message: e.message ?? "Something went wrong",
          isError: true,
        );
      } else {
        AppUtils.showSnackBar(
          title: "Error",
          message: "Error Registration",
          isError: true,
        );
      }
      debugPrint("Error registering: $e");
    }
  }
}
