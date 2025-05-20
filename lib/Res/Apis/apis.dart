class Apis {
  // IpAddress API
  static const String ipAddressUrl = "https://api.ipify.org?format=json";

  // Base URL
  static const String baseUrl = "http://devapiv4.dealsdray.com/api/v2/user/";
  // Splash API
  static const String splashUrl = "${baseUrl}device/add";
  // Send OTP API
  static const String sendOtpUrl = "${baseUrl}otp";
  // Verify OTP API
  static const String verifyOtpUrl = "${baseUrl}otp/verification";
  // Register API
  static const String registerUrl = "${baseUrl}email/referral";
  // Home API
  static const String homeUrl = "${baseUrl}home/withoutPrice";
}
