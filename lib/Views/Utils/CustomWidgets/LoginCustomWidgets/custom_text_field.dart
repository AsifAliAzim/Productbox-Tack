import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:productbox_flutter_exercise/Views/Utils/Constants/app_strings.dart';
import 'package:productbox_flutter_exercise/Views/Utils/Constants/app_text_styles.dart';
import 'package:productbox_flutter_exercise/Views/Utils/Constants/theme_data.dart';

class CustomTextField extends StatelessWidget {
  final String? hintText;
  final TextEditingController controller;

  const CustomTextField({
    Key? key,
    required this.hintText,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150.sp,
      padding: EdgeInsets.only(left: 40.sp),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(100.sp),
      ),
      child: TextFormField(
        controller: controller,
        style: textFieldTextStyle,
        cursorColor: AppColors.backgroundColor,
        textInputAction: hintText == AppStrings.loginSecondTextFieldText
            ? TextInputAction.done
            : TextInputAction.next,
        keyboardType: hintText == AppStrings.loginSecondTextFieldText
            ? TextInputType.emailAddress
            : TextInputType.text,
        decoration: InputDecoration(
          filled: true,
          fillColor: AppColors.white,
          hintText: hintText ?? '',
          hintStyle: textFieldHintTextStyle,
          border: textFieldBorders,
          focusedBorder: textFieldBorders,
          enabledBorder: textFieldBorders,
          disabledBorder: textFieldBorders,
          errorBorder: textFieldBorders,
        ),
      ),
    );
  }
}
