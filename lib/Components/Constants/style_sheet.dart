import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  Color primary = const Color(0xfff61c2a);
  Color secondary = const Color(0xffd7d7d9);
  Color periwinkleBlue = const Color(0xff5459ce);
  Color grey = const Color(0xff727272);
  Color tealBlue = const Color(0xff44aab8);
  Color green = const Color(0xff539f07);
  Color black = Colors.black;
  Color white = Colors.white;
  Color red = Colors.red;
  Color blue = Colors.blue;
}

class AppTextTheme {
  AppTextTheme();
  //NORMAL
  TextStyle fs12Normal = GoogleFonts.poppins(
    fontSize: 12.sp,
    fontWeight: FontWeight.w400,
  );
  TextStyle fs14Normal = GoogleFonts.poppins(
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
  );
  TextStyle fs15Normal = GoogleFonts.poppins(
    fontSize: 15.sp,
    fontWeight: FontWeight.w400,
  );

  // MEDIUM
  TextStyle fs16Medium = GoogleFonts.poppins(
    fontSize: 16.sp,
    fontWeight: FontWeight.w500,
  );
  TextStyle fs18Medium = GoogleFonts.poppins(
    fontSize: 18.sp,
    fontWeight: FontWeight.w500,
  );
  TextStyle fs20Medium = GoogleFonts.poppins(
    fontSize: 20.sp,
    fontWeight: FontWeight.w500,
  );
  TextStyle fs24Medium = GoogleFonts.poppins(
    fontSize: 24.sp,
    fontWeight: FontWeight.w500,
  );
  TextStyle fs29Medium = GoogleFonts.poppins(
    fontSize: 29.sp,
    fontWeight: FontWeight.w500,
  );

  // BOLD
  TextStyle fs14Bold = GoogleFonts.outfit(
    fontSize: 14.sp,
    fontWeight: FontWeight.w700,
  );
  TextStyle fs16Bold = GoogleFonts.outfit(
    fontSize: 16.sp,
    fontWeight: FontWeight.w700,
  );
  TextStyle fs18Bold = GoogleFonts.poppins(
    fontSize: 18.sp,
    fontWeight: FontWeight.w700,
  );
  TextStyle fs24Bold = GoogleFonts.poppins(
    fontSize: 24.sp,
    fontWeight: FontWeight.w700,
  );
  TextStyle fs29Bold = GoogleFonts.poppins(
    fontSize: 29.sp,
    fontWeight: FontWeight.w700,
  );
}
