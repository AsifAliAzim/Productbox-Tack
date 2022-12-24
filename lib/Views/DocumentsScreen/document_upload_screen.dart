import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:productbox_flutter_exercise/Controllers/Cubits/UploadDocumentsCubits/top_bars_cubit.dart';
import 'package:productbox_flutter_exercise/Views/Utils/Constants/app_strings.dart';
import 'package:productbox_flutter_exercise/Views/Utils/Constants/app_text_styles.dart';
import 'package:productbox_flutter_exercise/Views/Utils/Constants/status_bar_configuration.dart';
import 'package:productbox_flutter_exercise/Views/Utils/Constants/theme_data.dart';
import 'package:productbox_flutter_exercise/Views/Utils/CustomWidgets/UploadDocumentsCustomWidgets/top_progress_bar.dart';
import 'package:productbox_flutter_exercise/Views/Utils/CustomWidgets/UploadDocumentsCustomWidgets/upload_documents_custom_button.dart';

class DocumentUploadScreen extends StatelessWidget {
  const DocumentUploadScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StatusBarConfiguration.statusBarConfiguration(
      child: Scaffold(
        body: Container(
          height: 1.sh,
          width: 1.sw,
          color: AppColors.backgroundColor,
          child: BlocBuilder<TopBarsCubit, int>(
            builder: (context, topBarState) {
              return ListView(
                shrinkWrap: true,
                padding: EdgeInsets.only(
                  top: 155.sp,
                  bottom: 100.sp,
                  left: 120.sp,
                  right: 120.sp,
                ),
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  //title text
                  Container(
                    height: 200.sp,
                    width: 1.sw,
                    color: AppColors.backgroundColor,
                    alignment: Alignment.center,
                    child: FittedBox(
                      child: Text(
                        AppStrings.uploadDocTitle,
                        style: uploadDocTitle,
                      ),
                    ),
                  ),
                  SizedBox(height: 60.sp),

                  //Top progress indicators design
                  TopProgressBar(topBarState: topBarState),
                  SizedBox(height: 250.sp),

                  //profile picture button
                  UploadDocumentCustomButton(
                    title: AppStrings.profilePicture,
                    isDone: false,
                  ),
                  SizedBox(height: 90.sp),

                  //driving license button
                  UploadDocumentCustomButton(
                    title: AppStrings.drivingLicense,
                    isDone: false,
                  ),
                  SizedBox(height: 90.sp),

                  //certificate button
                  UploadDocumentCustomButton(
                    title: AppStrings.certificate,
                    isDone: false,
                  ),
                  SizedBox(height: 90.sp),

                  //passport button
                  UploadDocumentCustomButton(
                    title: AppStrings.passport,
                    isDone: false,
                  ),
                  SizedBox(height: 430.sp),

                  //a little modification is required in this button so we can use same button
                  UploadDocumentCustomButton(
                    title: AppStrings.done,
                    isDone: true,
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
