import 'package:deals_dray_test/Controllers/auth_controller.dart';
import 'package:deals_dray_test/Controllers/home_controller.dart';
import 'package:deals_dray_test/Controllers/splash_controller.dart';
import 'package:get/get.dart';

class AppInitialbinding implements Bindings {
  @override
  void dependencies() {
    Get.put(SplashController()); // SplashController
    Get.put(AuthController()); // AuthController
    Get.put(HomeController()); // HomeController
  }
}
