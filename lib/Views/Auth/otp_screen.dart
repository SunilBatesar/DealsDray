import 'dart:async';

import 'package:deals_dray_test/Components/Constants/style_sheet.dart';
import 'package:deals_dray_test/Controllers/auth_controller.dart';
import 'package:deals_dray_test/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final _pinController = TextEditingController();
  final _pinFocusNode = FocusNode();
  bool _isResendEnabled = false;
  int _remainingTime = 120;
  Timer? _timer;

  // Device Id and User Id
  final deviceId = Get.arguments['deviceId'].toString();
  final userId = Get.arguments['userId'].toString();
  final mobileNumber = Get.arguments['mobileNumber'].toString();

  // Auth Controller
  final authController = Get.find<AuthController>();

  @override
  void initState() {
    super.initState();
    _startResendTimer();
  }

  void _startResendTimer() {
    setState(() {
      _isResendEnabled = false;
      _remainingTime = 120;
    });

    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remainingTime > 0) {
        setState(() {
          _remainingTime--;
        });
      } else {
        setState(() {
          _isResendEnabled = true;
        });
        _timer?.cancel();
      }
    });
  }

  Future<void> _resendCode() async {
    if (_isResendEnabled) {
      _startResendTimer();
      await authController.sendOtp(number: mobileNumber, deviceId: deviceId);
    }
  }

  String _formatTime(int seconds) {
    final minutes = (seconds ~/ 60).toString().padLeft(2, '0');
    final secs = (seconds % 60).toString().padLeft(2, '0');
    return '$minutes:$secs';
  }

  final AppTextTheme textTheme = AppTextTheme();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20.0.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Icon
              Image.asset(
                cnstSheet.icons.otpIcon,
                width: 100.sp,
                height: 100.sp,
              ),
              Gap(30.h),
              // Title and subtitle
              Text(
                'OTP Verification',
                style: textTheme.fs24Bold.copyWith(
                  color: cnstSheet.colors.black,
                ),
              ),
              Gap(8.h),
              Text(
                'We have sent a unique OTP number to your mobile +91-$mobileNumber',
                style: textTheme.fs14Normal.copyWith(
                  color: cnstSheet.colors.grey,
                ),
              ),
              Gap(45.h),
              Center(
                child: Pinput(
                  length: 4,
                  controller: _pinController,
                  focusNode: _pinFocusNode,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  defaultPinTheme: PinTheme(
                    width: 56.sp,
                    height: 56.sp,
                    textStyle: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(color: cnstSheet.colors.grey),
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                  ),
                  onCompleted: (pin) async {
                    // Handle OTP submission
                    // Get.toNamed(RoutesName.registerScreen);
                    authController.verifyOtp(
                      userId: userId,
                      deviceId: deviceId,
                      otp: pin,
                    );
                  },
                ),
              ),
              Gap(16.h),
              // Resend code timer
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    _isResendEnabled
                        ? 'You can now resend the code.'
                        : _formatTime(_remainingTime),
                    style: textTheme.fs14Normal.copyWith(
                      color: cnstSheet.colors.grey,
                    ),
                  ),
                  // Resend code button
                  TextButton(
                    onPressed: () async {
                      await _resendCode();
                    },
                    child: Text(
                      'SEND AGAIN',
                      style: textTheme.fs16Bold.copyWith(
                        color:
                            _isResendEnabled
                                ? cnstSheet.colors.primary
                                : cnstSheet.colors.grey,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _pinController.dispose();
    _pinFocusNode.dispose();
    _timer?.cancel();
    super.dispose();
  }
}
