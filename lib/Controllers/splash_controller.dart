import 'package:deals_dray_test/Data/Networks/baseapiservice.dart';
import 'package:deals_dray_test/Data/Networks/network_api_service.dart';
import 'package:deals_dray_test/Functions/app_functions.dart';
import 'package:deals_dray_test/Models/splash_model.dart';
import 'package:deals_dray_test/Res/Apis/apis.dart';
import 'package:deals_dray_test/Utils/Routes/routes_name.dart';
import 'package:deals_dray_test/Utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  final AppFunctions _appFunctions = AppFunctions();
  final BaseapiService _service = NetworkApiService();

  // Send Splash Data Function
  Future<void> sentSplashData() async {
    final deviceInfo = await _appFunctions.getDeviceInfo(); //Get Device Info
    final ipAddress = await _appFunctions.getIPAddress(); //Get IP Address
    final locationInfo =
        await _appFunctions.getLocationInfo(); //Get Location Info
    final appInfo = await _appFunctions.getAppInfo(); //Get App Info

    // Data
    final data = SplashModel(
      deviceType: deviceInfo.deviceType,
      deviceId: deviceInfo.deviceId,
      deviceName: deviceInfo.deviceName,
      deviceOSVersion: deviceInfo.deviceOSVersion,
      deviceIPAddress: ipAddress,
      lat: locationInfo.lat,
      long: locationInfo.long,
      buyerGcmId: '',
      buyerPemId: '',
      app: appInfo,
    );
    try {
      // Send the data to the server
      final response = await _service.post(Apis.splashUrl, data.toJson());
      if (response["status"] == 1) {
        AppUtils.showSnackBar(
          title: "Success",
          message: "Splash data sent successfully",
        ); // Show success message
        final String deviceId =
            response["data"]["deviceId"].toString(); // Return device ID
        // Next Screen (Login)
        Get.offAllNamed(RoutesName.loginScreen, arguments: deviceId);
      } else {
        AppUtils.showSnackBar(
          title: "Error",
          message: "Failed to send splash data",
          isError: true,
        ); // Show error message
      }
    } catch (e) {
      AppUtils.showSnackBar(
        title: "Error",
        message: "Error sending splash data",
        isError: true,
      ); // Show error message
      debugPrint("Error sending splash data: $e");
    }
  }
}
