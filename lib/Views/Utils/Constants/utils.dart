import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:productbox_flutter_exercise/Views/Utils/Constants/app_text_styles.dart';
import 'package:productbox_flutter_exercise/Views/Utils/Constants/theme_data.dart';

class Utils {
  static void showSnackBar({
    required BuildContext context,
    required String message,
  }) {
    final snackBar = SnackBar(
      duration: const Duration(seconds: 2),
      behavior: SnackBarBehavior.floating,
      backgroundColor: AppColors.primaryColorDark,
      content: Container(
        height: 80.sp,
        width: 1.sw,
        alignment: Alignment.centerLeft,
        child: FittedBox(
          child: Text(
            message,
            style: loginSnackBarTexStyle,
          ),
        ),
      ),
    );

    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(snackBar);
  }
}
