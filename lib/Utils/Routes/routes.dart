import 'package:deals_dray_test/Utils/Routes/routes_name.dart';
import 'package:deals_dray_test/Views/Auth/login_screen.dart';
import 'package:deals_dray_test/Views/Auth/otp_screen.dart';
import 'package:deals_dray_test/Views/Auth/register_screen.dart';
import 'package:deals_dray_test/Views/Home/home_screen.dart';
import 'package:deals_dray_test/Views/OnBoarding/splash_screen.dart';
import 'package:get/get.dart';

List<GetPage<dynamic>> routes = [
  GetPage(name: RoutesName.splashScreen, page: () => const SplashScreen()),
  GetPage(name: RoutesName.loginScreen, page: () => const LoginScreen()),
  GetPage(name: RoutesName.otpScreen, page: () => const OtpScreen()),
  GetPage(name: RoutesName.registerScreen, page: () => RegisterScreen()),
  GetPage(name: RoutesName.homeScreen, page: () => const HomeScreen()),
];
