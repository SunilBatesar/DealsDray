import 'package:deals_dray_test/Components/Constants/style_sheet.dart';
import 'package:deals_dray_test/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class KYCBanner extends StatelessWidget {
  KYCBanner({super.key});
  final AppTextTheme textTheme = AppTextTheme();
  @override
  Widget build(BuildContext context) {
    return Container(
      width: cnstSheet.services.screenWidth(context),
      padding: EdgeInsets.all(20.sp),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        gradient: LinearGradient(
          colors: [
            cnstSheet.colors.periwinkleBlue.withAlpha(190),
            cnstSheet.colors.periwinkleBlue.withAlpha(180),
            cnstSheet.colors.periwinkleBlue,
            cnstSheet.colors.periwinkleBlue,
          ],
        ),
      ),
      child: Column(
        children: [
          Text(
            'KYC Pending',
            style: textTheme.fs18Bold.copyWith(color: cnstSheet.colors.white),
          ),

          Gap(10.h),
          Text(
            'You need to provide the required documents for your account activation.',
            style: textTheme.fs14Bold.copyWith(color: cnstSheet.colors.white),
            textAlign: TextAlign.center,
          ),
          Gap(15.h),
          TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.r),
              ),
            ),
            child: Text(
              'Click Here',
              style: textTheme.fs24Bold.copyWith(
                color: cnstSheet.colors.white,
                decoration: TextDecoration.underline,
                decorationColor: cnstSheet.colors.white,
                decorationThickness: 2,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
