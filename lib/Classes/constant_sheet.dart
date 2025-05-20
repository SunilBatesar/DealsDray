import 'package:deals_dray_test/Components/Constants/app_assets.dart';
import 'package:deals_dray_test/Components/Constants/style_sheet.dart';
import 'package:deals_dray_test/Res/Services/app_services.dart';

class ConstantSheet {
  ConstantSheet._constantSheet();
  static final ConstantSheet instance =
      ConstantSheet._constantSheet(); // Singleton instance
  // Factory constructor to return the singleton instance
  factory ConstantSheet() {
    return instance;
  }
  // App Colors
  final AppColors _colors = AppColors();
  AppColors get colors => _colors;
  // App Icons
  final AppIcons _icons = AppIcons();
  AppIcons get icons => _icons;
  // App Images
  final AppImages _images = AppImages();
  AppImages get images => _images;
  // App Services
  final AppServices _services = AppServices();
  AppServices get services => _services;
}
