import 'package:deals_dray_test/Components/Constants/style_sheet.dart';
import 'package:deals_dray_test/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SecondaryButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isTransparent;
  final Color? textColor;
  final double? borderRadius;

  SecondaryButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isTransparent = false,
    this.textColor,
    this.borderRadius,
  });
  final AppTextTheme textTheme = AppTextTheme();
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        backgroundColor:
            isTransparent ? Colors.transparent : cnstSheet.colors.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 8.0),
        ),
        padding: EdgeInsets.symmetric(vertical: 12.0.h, horizontal: 35.0.w),
        minimumSize: Size(50.w, 20.h),
      ),
      child: Text(
        text,
        style: textTheme.fs14Bold.copyWith(
          color:
              isTransparent ? cnstSheet.colors.black : cnstSheet.colors.white,
        ),
      ),
    );
  }
}
