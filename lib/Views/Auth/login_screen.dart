import 'package:deals_dray_test/Components/Buttons/primary_button.dart';
import 'package:deals_dray_test/Components/Buttons/secondary_button.dart';
import 'package:deals_dray_test/Components/Constants/style_sheet.dart';
import 'package:deals_dray_test/Components/TextFields/common_text_field.dart';
import 'package:deals_dray_test/Controllers/auth_controller.dart';
import 'package:deals_dray_test/Res/Services/app_config.dart';
import 'package:deals_dray_test/Utils/app_validator.dart';
import 'package:deals_dray_test/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart'; // Import the Gap package

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isPhone = true;
  TextEditingController phoneController = TextEditingController();
  // Device Id
  final deviceId = Get.arguments.toString();
  final authController = Get.find<AuthController>();

  // Global Key for Form
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final AppTextTheme textTheme = AppTextTheme();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(20.0.sp),
            child: Column(
              children: [
                // Logo
                Center(
                  child: Image.asset(
                    AppConfig.appLogo,
                    width: 200.sp,
                    height: 200.sp,
                  ),
                ),
                Gap(16.h),
                // Phone and Email buttons
                Center(
                  child: Container(
                    decoration: BoxDecoration(
                      color: cnstSheet.colors.secondary,
                      borderRadius: BorderRadius.circular(50.r),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SecondaryButton(
                          text: "Phone",
                          onPressed: () {
                            setState(() {
                              isPhone = true;
                            });
                          },
                          isTransparent: isPhone ? false : true,
                          borderRadius: 50.r,
                        ),
                        Gap(5.w),
                        SecondaryButton(
                          text: "Email",
                          onPressed: () {
                            setState(() {
                              isPhone = false;
                            });
                          },
                          isTransparent: isPhone ? true : false,
                          borderRadius: 50.r,
                        ),
                      ],
                    ),
                  ),
                ),
                Gap(16.h),
                // Title
                Text('Glad to see you!', style: textTheme.fs29Medium),
                Gap(8.h),

                // Subtitle
                Text(
                  'Please provide phone number',
                  style: textTheme.fs14Normal.copyWith(
                    color: cnstSheet.colors.grey,
                  ),
                ),
                Gap(30.h),

                Form(
                  key: _formKey,
                  child: // Phone number input
                      CommonTextField(
                    labelText: 'Phone',
                    keyboardType: TextInputType.phone,
                    controller: phoneController,
                    validator: MobileValidator(),
                  ),
                ),
                Gap(40.h),
                // Send Code button
                Obx(
                  () => PrimaryButton(
                    title: "SEND CODE",
                    onPressed: () async {
                      await _isValidFields();
                    },
                    isExpanded: true,
                    isLoding: authController.isloading.value,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Validate Fields
  Future<void> _isValidFields() async {
    if (_formKey.currentState!.validate()) {
      await authController.sendOtp(
        number: phoneController.text.trim(),
        deviceId: deviceId,
      );
    }
  }
}
