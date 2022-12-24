import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:productbox_flutter_exercise/Controllers/Cubits/UploadDocumentsCubits/document_file_cubit.dart';
import 'package:productbox_flutter_exercise/Controllers/Cubits/UploadDocumentsCubits/top_bars_cubit.dart';
import 'package:productbox_flutter_exercise/Controllers/app_static_properties.dart';
import 'package:productbox_flutter_exercise/Views/DashboardScreen/dashboard_screen.dart';
import 'package:productbox_flutter_exercise/Views/DocumentsScreen/full_image_screen.dart';
import 'package:productbox_flutter_exercise/Views/Utils/Constants/app_strings.dart';
import 'package:productbox_flutter_exercise/Views/Utils/Constants/app_text_styles.dart';
import 'package:productbox_flutter_exercise/Views/Utils/Constants/theme_data.dart';
import 'package:productbox_flutter_exercise/Views/Utils/CustomWidgets/UploadDocumentsCustomWidgets/custom_bottom_sheet.dart';
import 'package:productbox_flutter_exercise/Views/Utils/PageTransitions/scale_page_transition.dart';
import 'package:productbox_flutter_exercise/Views/Utils/PageTransitions/slide_page_transition.dart';

class UploadDocumentCustomButton extends StatelessWidget {
  final String? title;
  final bool? isDone;

  const UploadDocumentCustomButton({
    Key? key,
    required this.title,
    required this.isDone,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DocumentFileCubit, dynamic>(
      builder: (context, documentState) {
        return InkWell(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: isDone!
              ? () {
                  //first check if all files are attached then navigate
                  if (AppStaticProperties.profileCameraImageFile != null &&
                      AppStaticProperties.licenseCameraImageFile != null &&
                      AppStaticProperties.certificateCameraImageFile != null &&
                      AppStaticProperties.passportCameraImageFile != null) {
                    //remove all the selected images and reset all the values
                    AppStaticProperties.profileCameraImageFile = null;
                    AppStaticProperties.licenseCameraImageFile = null;
                    AppStaticProperties.certificateCameraImageFile = null;
                    AppStaticProperties.passportCameraImageFile = null;
                    AppStaticProperties.previousImageCount = 0;
                    AppStaticProperties.profileButtonTab = 0;
                    AppStaticProperties.licenseButtonTab = 0;
                    AppStaticProperties.certificateButtonTab = 0;
                    AppStaticProperties.passportButtonTab = 0;
                    context.read<TopBarsCubit>().barCount(barCount: 0);

                    //navigate to next screen
                    Navigator.push(
                      context,
                      CustomSlidePageRoute(
                        direction: AxisDirection.up,
                        child: DashboardScreen(),
                      ),
                    );
                  }
                }
              : () {},
          child: Container(
            height: 150.sp,
            padding: EdgeInsets.only(
              left: 70.sp,
              right: 60.sp,
            ),
            decoration: BoxDecoration(
              color: !isDone!
                  ? AppColors.white
                  : AppStaticProperties.profileCameraImageFile != null &&
                          AppStaticProperties.licenseCameraImageFile != null &&
                          AppStaticProperties.certificateCameraImageFile !=
                              null &&
                          AppStaticProperties.passportCameraImageFile != null
                      ? AppColors.primaryColor
                      : AppColors.greyOne,
              borderRadius: BorderRadius.circular(100.sp),
            ),
            child: isDone!
                ? Align(
                    alignment: Alignment.center,
                    child: FittedBox(
                      child: Text(
                        AppStrings.done,
                        style: styleFour,
                      ),
                    ),
                  )
                : Row(
                    children: [
                      Expanded(
                        flex: 12,
                        child: InkWell(
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () {
                            //camera and files options will be shown to the user
                            showModalBottomSheet(
                              context: context,
                              backgroundColor: AppColors.backgroundColor,
                              barrierColor: Colors.transparent,
                              builder: (context) =>
                                  CustomModelBottomSheet(title: title ?? ''),
                            );
                          },
                          child: Container(
                            height: 150.sp,
                            width: 1.sw,
                            alignment: Alignment.centerLeft,
                            child: FittedBox(
                              child: Text(
                                title!,
                                style: uploadDocButtonTitleStyle,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: InkWell(
                          highlightColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          onTap: () {
                            //show the full image on new screen
                            if (title == AppStrings.profilePicture &&
                                AppStaticProperties.profileCameraImageFile !=
                                    null) {
                              Navigator.push(
                                context,
                                ScalePageTransition.scalePageTransition(
                                  alignment: Alignment.center,
                                  page: FullImageScreen(
                                    forwardImage: AppStaticProperties
                                        .profileCameraImageFile,
                                  ),
                                ),
                              );
                            } else if (title == AppStrings.drivingLicense &&
                                AppStaticProperties.licenseCameraImageFile !=
                                    null) {
                              Navigator.push(
                                context,
                                ScalePageTransition.scalePageTransition(
                                  alignment: Alignment.center,
                                  page: FullImageScreen(
                                    forwardImage: AppStaticProperties
                                        .licenseCameraImageFile,
                                  ),
                                ),
                              );
                            } else if (title == AppStrings.certificate &&
                                AppStaticProperties
                                        .certificateCameraImageFile !=
                                    null) {
                              Navigator.push(
                                context,
                                ScalePageTransition.scalePageTransition(
                                  alignment: Alignment.center,
                                  page: FullImageScreen(
                                    forwardImage: AppStaticProperties
                                        .certificateCameraImageFile,
                                  ),
                                ),
                              );
                            } else if (title == AppStrings.passport &&
                                AppStaticProperties.passportCameraImageFile !=
                                    null) {
                              Navigator.push(
                                context,
                                ScalePageTransition.scalePageTransition(
                                  alignment: Alignment.center,
                                  page: FullImageScreen(
                                    forwardImage: AppStaticProperties
                                        .passportCameraImageFile,
                                  ),
                                ),
                              );
                            }
                          },
                          child: Container(
                            height: 125.sp,
                            color: AppColors.white,
                            child: AppStaticProperties.imagePreviewMethod(
                                title: title ?? ''),
                          ),
                        ),
                      ),
                    ],
                  ),
          ),
        );
      },
    );
  }
}
