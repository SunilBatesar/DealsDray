class SplashModel {
  String deviceType;
  String deviceId;
  String deviceName;
  String deviceOSVersion;
  String deviceIPAddress;
  String lat;
  String long;
  String buyerGcmId;
  String buyerPemId;
  AppInfoModel app;

  SplashModel({
    required this.deviceType,
    required this.deviceId,
    required this.deviceName,
    required this.deviceOSVersion,
    required this.deviceIPAddress,
    required this.lat,
    required this.long,
    required this.buyerGcmId,
    required this.buyerPemId,
    required this.app,
  });

  Map<String, dynamic> toJson() {
    return {
      'deviceType': deviceType,
      'deviceId': deviceId,
      'deviceName': deviceName,
      'deviceOSVersion': deviceOSVersion,
      'deviceIPAddress': deviceIPAddress,
      'lat': lat,
      'long': long,
      'buyer_gcmid': buyerGcmId,
      'buyer_pemid': buyerPemId,
      'app': app.toJson(),
    };
  }
}

// DeviceInfoModel
class DeviceInfoModel {
  String deviceType;
  String deviceId;
  String deviceName;
  String deviceOSVersion;

  DeviceInfoModel({
    required this.deviceType,
    required this.deviceId,
    required this.deviceName,
    required this.deviceOSVersion,
  });
}

// LocationModel
class LocationModel {
  String lat;
  String long;
  LocationModel({required this.lat, required this.long});
}

// AppInfoModel
class AppInfoModel {
  String version;
  String installTimeStamp;
  String uninstallTimeStamp;
  String downloadTimeStamp;

  AppInfoModel({
    required this.version,
    this.installTimeStamp = "",
    this.uninstallTimeStamp = "",
    this.downloadTimeStamp = "",
  });

  Map<String, dynamic> toJson() {
    return {
      'version': version,
      'installTimeStamp':
          installTimeStamp.isEmpty
              ? DateTime.now().toUtc().toIso8601String()
              : installTimeStamp,
      'uninstallTimeStamp':
          uninstallTimeStamp.isEmpty
              ? DateTime.now().toUtc().toIso8601String()
              : installTimeStamp,
      'downloadTimeStamp':
          downloadTimeStamp.isEmpty
              ? DateTime.now().toUtc().toIso8601String()
              : installTimeStamp,
    };
  }
}
