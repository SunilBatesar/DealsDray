import 'package:deals_dray_test/Data/Networks/baseapiservice.dart';
import 'package:deals_dray_test/Data/Networks/network_api_service.dart';
import 'package:deals_dray_test/Models/splash_model.dart';
import 'package:deals_dray_test/Res/Apis/apis.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/widgets.dart';
import 'package:location/location.dart';
import 'package:package_info_plus/package_info_plus.dart';

class AppFunctions {
  final BaseapiService _service = NetworkApiService();
  // Device Info Function
  Future<DeviceInfoModel> getDeviceInfo() async {
    final deviceInfo = DeviceInfoPlugin();
    final androidInfo = await deviceInfo.androidInfo;
    return DeviceInfoModel(
      deviceType: 'android',
      deviceId: androidInfo.id,
      deviceName: androidInfo.model,
      deviceOSVersion: androidInfo.version.release,
    );
  }

  // Get IP Address Function
  Future<String> getIPAddress() async {
    try {
      final response = await _service.get(Apis.ipAddressUrl);
      if (response != null && response['ip'] != null) {
        return response['ip'].toString();
      }
    } catch (e) {
      debugPrint("Error getting IP address: $e");
    }
    return "";
  }

  // Location Info Function
  Future<LocationModel> getLocationInfo() async {
    Location location = Location();
    bool serviceEnabled = false;
    PermissionStatus permissionStatus;
    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) serviceEnabled = await location.requestService();
    permissionStatus = await location.hasPermission();
    if (permissionStatus == PermissionStatus.denied ||
        permissionStatus == PermissionStatus.deniedForever) {
      permissionStatus = await location.requestPermission();
    }
    final LocationData locationData = await location.getLocation();

    return LocationModel(
      lat: locationData.latitude.toString(),
      long: locationData.longitude.toString(),
    );
  }

  // App Info Function
  Future<AppInfoModel> getAppInfo() async {
    final appInfo = await PackageInfo.fromPlatform();
    return AppInfoModel(version: appInfo.version);
  }
}
