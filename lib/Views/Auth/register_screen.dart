import 'package:deals_dray_test/Components/Constants/style_sheet.dart';
import 'package:deals_dray_test/Components/TextFields/common_text_field.dart';
import 'package:deals_dray_test/Controllers/auth_controller.dart';
import 'package:deals_dray_test/Res/Services/app_config.dart';
import 'package:deals_dray_test/Utils/app_validator.dart';
import 'package:deals_dray_test/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController referralCodeController = TextEditingController();

  // Auth Controller
  final authController = Get.find<AuthController>();
  // Device Id and User Id
  final deviceId = Get.arguments['deviceId'].toString();
  final userId = Get.arguments['userId'].toString();

  // Global Key for Form
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final AppTextTheme textTheme = AppTextTheme();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20.0.sp),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
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

              // Title
              Text("Let's Begin!", style: textTheme.fs29Medium),
              Gap(8.h),

              // Subtitle
              Text(
                'Please enter your credentials to proceed',
                style: textTheme.fs14Normal.copyWith(
                  color: cnstSheet.colors.grey,
                ),
              ),
              Gap(30.h),

              Form(
                key: _formKey,
                child: Column(
                  children: [
                    // Email input
                    CommonTextField(
                      labelText: 'Your Email',
                      keyboardType: TextInputType.emailAddress,
                      controller: emailController,
                      validator: EmailValidator(),
                    ),
                    Gap(20.h),
                    // Password input
                    CommonTextField(
                      labelText: 'Password',
                      keyboardType: TextInputType.visiblePassword,
                      controller: passwordController,
                      isPassword: true,
                      validator: PasswordValidator(),
                    ),
                    Gap(20.h),
                    // Referral Code input
                    CommonTextField(
                      labelText: 'Referral Code (Optional)',
                      keyboardType: TextInputType.text,
                      controller: referralCodeController,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Obx(() {
        final loading = authController.isloading.value;
        return FloatingActionButton(
          backgroundColor: cnstSheet.colors.primary,
          onPressed: () {
            loading ? null : _isValidFields();
          },
          child:
              loading
                  ? SizedBox(
                    width: 20.sp,
                    height: 20.sp,
                    child: CircularProgressIndicator(
                      color: cnstSheet.colors.white,
                      strokeWidth: 3.sp,
                    ),
                  )
                  : Icon(
                    Icons.arrow_forward,
                    color: cnstSheet.colors.white,
                    size: 30.sp,
                  ),
        );
      }),
    );
  }

  // Enter Valid Fields
  _isValidFields() {
    if (_formKey.currentState!.validate()) {
      // Register User
      authController.register(
        email: emailController.text,
        password: passwordController.text,
        userId: userId,
        referralCode: referralCodeController.text,
      );
    }
  }
}
