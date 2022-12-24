import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:productbox_flutter_exercise/Views/Utils/Constants/theme_data.dart';

class TopProgressBar extends StatelessWidget {
  final int topBarState;

  const TopProgressBar({Key? key, required this.topBarState}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20.sp,
      width: 1.sw,
      color: AppColors.backgroundColor,
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Container(
              height: 20.sp,
              decoration: BoxDecoration(
                color: topBarState >= 1
                    ? AppColors.primaryColor
                    : AppColors.greyOne,
                borderRadius: BorderRadius.circular(20.sp),
              ),
            ),
          ),
          Spacer(flex: 1),
          Expanded(
            flex: 3,
            child: Container(
              height: 20.sp,
              decoration: BoxDecoration(
                color: topBarState >= 2
                    ? AppColors.primaryColor
                    : AppColors.greyOne,
                borderRadius: BorderRadius.circular(20.sp),
              ),
            ),
          ),
          Spacer(flex: 1),
          Expanded(
            flex: 3,
            child: Container(
              height: 20.sp,
              decoration: BoxDecoration(
                color: topBarState >= 3
                    ? AppColors.primaryColor
                    : AppColors.greyOne,
                borderRadius: BorderRadius.circular(20.sp),
              ),
            ),
          ),
          Spacer(flex: 1),
          Expanded(
            flex: 3,
            child: Container(
              height: 20.sp,
              decoration: BoxDecoration(
                color: topBarState >= 4
                    ? AppColors.primaryColor
                    : AppColors.greyOne,
                borderRadius: BorderRadius.circular(20.sp),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
