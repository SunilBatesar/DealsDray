import 'package:deals_dray_test/Components/Constants/style_sheet.dart';
import 'package:deals_dray_test/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PrimaryButton extends StatelessWidget {
  final String title;
  final Function onPressed;
  final bool isExpanded;
  final bool isLoding;
  final TextStyle? textStyle;
  final double? borderRadius;

  PrimaryButton({
    super.key,
    required this.title,
    required this.onPressed,
    this.isExpanded = false,
    this.isLoding = false,
    this.textStyle,
    this.borderRadius,
  });
  final AppTextTheme textTheme = AppTextTheme();
  @override
  Widget build(BuildContext context) {
    final button = TextButton(
      onPressed: isLoding ? null : () => onPressed(),
      style: TextButton.styleFrom(
        minimumSize: Size(100.w, 50.h),
        backgroundColor: cnstSheet.colors.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 10.r),
        ),
      ),
      child:
          isLoding
              ? SizedBox(
                width: 24.sp,
                height: 24.sp,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    cnstSheet.colors.white,
                  ),
                  strokeWidth: 2.5,
                ),
              )
              : Text(
                title,
                style:
                    textStyle ??
                    textTheme.fs16Bold.copyWith(color: cnstSheet.colors.white),
              ),
    );
    return isExpanded ? Row(children: [Expanded(child: button)]) : button;
  }
}
