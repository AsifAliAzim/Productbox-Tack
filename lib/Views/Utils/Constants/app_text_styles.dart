import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:productbox_flutter_exercise/Views/Utils/Constants/theme_data.dart';

final styleOne = GoogleFonts.poppins(
  color: AppColors.white,
  fontWeight: FontWeight.bold,
  fontSize: 90.sp,
);

final styleTwo = GoogleFonts.poppins(
  color: AppColors.greyOne,
  fontWeight: FontWeight.normal,
  fontSize: 38.sp,
);

final styleThree = GoogleFonts.poppins(
  color: AppColors.white,
  fontWeight: FontWeight.w500,
  fontSize: 50.sp,
);

final styleFour = GoogleFonts.poppins(
  color: AppColors.white,
  fontWeight: FontWeight.w500,
  fontSize: 45.sp,
);

final textFieldTextStyle = GoogleFonts.poppins(
  fontSize: 50.sp,
  fontWeight: FontWeight.normal,
  color: AppColors.backgroundColor,
);

final textFieldHintTextStyle = GoogleFonts.poppins(
  fontSize: 40.0.sp,
  fontStyle: FontStyle.normal,
  color: AppColors.greyOne,
);

final textFieldBorders = OutlineInputBorder(
  borderRadius: BorderRadius.circular(100.sp),
  borderSide: BorderSide(
    width: 0,
    color: Colors.transparent,
    style: BorderStyle.none,
  ),
);

final loginSnackBarTexStyle = GoogleFonts.poppins(
  fontSize: 40.sp,
  color: AppColors.white,
  fontWeight: FontWeight.w400,
);

final uploadDocTitle = GoogleFonts.poppins(
  color: AppColors.white,
  fontWeight: FontWeight.w600,
  fontSize: 150.sp,
);

final uploadDocButtonTitleStyle = GoogleFonts.poppins(
  color: AppColors.backgroundColor,
  fontWeight: FontWeight.w500,
  fontSize: 50.sp,
  backgroundColor: AppColors.white,
);

final postTitleStyle = GoogleFonts.poppins(
  fontSize: 38.sp,
  color: AppColors.backgroundColor,
  fontWeight: FontWeight.w700,
);
