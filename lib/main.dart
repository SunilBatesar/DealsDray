import 'package:deals_dray_test/Classes/constant_sheet.dart';
import 'package:deals_dray_test/Data/app_initialbinding.dart';
import 'package:deals_dray_test/Res/Services/app_config.dart';
import 'package:deals_dray_test/Utils/Routes/routes.dart';
import 'package:deals_dray_test/Utils/Routes/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

late ConstantSheet cnstSheet;
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) {
        cnstSheet = ConstantSheet.instance;
        return GetMaterialApp(
          // home: LoginScreen(),
          initialRoute: RoutesName.splashScreen,
          getPages: routes,
          debugShowCheckedModeBanner: false,
          initialBinding: AppInitialbinding(),
        );
      },
      designSize: Size(AppConfig.appScreenWidth, AppConfig.appScreenHeight),
    );
  }
}
