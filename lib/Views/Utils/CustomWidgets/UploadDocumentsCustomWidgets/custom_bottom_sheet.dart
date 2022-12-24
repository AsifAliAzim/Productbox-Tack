import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:productbox_flutter_exercise/Controllers/Cubits/UploadDocumentsCubits/top_bars_cubit.dart';
import 'package:productbox_flutter_exercise/Controllers/app_static_properties.dart';
import 'package:productbox_flutter_exercise/Views/Utils/Constants/app_strings.dart';
import 'package:productbox_flutter_exercise/Views/Utils/Constants/app_text_styles.dart';
import 'package:productbox_flutter_exercise/Views/Utils/Constants/theme_data.dart';

class CustomModelBottomSheet extends StatelessWidget {
  final String? title;

  const CustomModelBottomSheet({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500.sp,
      width: 1.sw,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(100.sp),
          topRight: Radius.circular(100.sp),
        ),
      ),
      child: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.symmetric(
          horizontal: 60.sp,
          vertical: 25.sp,
        ),
        physics: const NeverScrollableScrollPhysics(),
        children: [
          //title
          Container(
            height: 80.sp,
            color: AppColors.white,
            //we could also use builder here instead of ternary operator
            //builder is better option but that rebuild the whole widget
            //here we just want to check forwarded title so will only toggle that
            //instead ot the whole Text() widget its alignment and style
            child: FittedBox(
              child: Text(
                title == AppStrings.profilePicture
                    ? 'Choose ${AppStrings.profilePicture}'
                    : title == AppStrings.drivingLicense
                        ? 'Choose ${AppStrings.drivingLicense}'
                        : title == AppStrings.certificate
                            ? 'Choose ${AppStrings.certificate}'
                            : 'Choose ${AppStrings.passport}',
                textAlign: TextAlign.center,
                style: uploadDocButtonTitleStyle,
              ),
            ),
          ),
          SizedBox(height: 10.sp),

          //selection options
          Container(
            height: 200.sp,
            width: 1.sw,
            color: AppColors.white,
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: InkWell(
                    highlightColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    onTap: () async {
                      //Steps 04
                      //01.calling the method to take image
                      final result = await AppStaticProperties.takePhoto(
                        context: context,
                        title: title ?? '',
                      );

                      //02.incrementing the documents length
                      AppStaticProperties.previousImageCount =
                          AppStaticProperties.previousImageCount + result;

                      //03.calling the method to update the state
                      context.read<TopBarsCubit>().barCount(
                          barCount: AppStaticProperties.previousImageCount);

                      //04.removing the bottom sheet
                      Navigator.of(context).pop();
                    },
                    child: Icon(
                      Icons.camera,
                      color: AppColors.primaryColor,
                      size: 150.sp,
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: InkWell(
                    highlightColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    onTap: () async {
                      //Steps 04
                      //01.calling the method to take image
                      final result = await AppStaticProperties.pickFile(
                        context: context,
                        title: title ?? '',
                      );

                      //02.incrementing the documents length
                      AppStaticProperties.previousImageCount =
                          AppStaticProperties.previousImageCount + result;

                      //03.calling the method to update the state
                      context.read<TopBarsCubit>().barCount(
                          barCount: AppStaticProperties.previousImageCount);

                      //04.removing the bottom sheet
                      Navigator.of(context).pop();
                    },
                    child: Icon(
                      Icons.drive_folder_upload_rounded,
                      color: AppColors.primaryColor,
                      size: 150.sp,
                    ),
                  ),
                ),
              ],
            ),
          ),

          //selection options title
          Container(
            height: 50.sp,
            width: 1.sw,
            color: AppColors.white,
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: FittedBox(
                    child: Text(
                      AppStrings.camera,
                      textAlign: TextAlign.center,
                      style: textFieldHintTextStyle,
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: FittedBox(
                    child: Text(
                      AppStrings.files,
                      textAlign: TextAlign.center,
                      style: textFieldHintTextStyle,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
