import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:productbox_flutter_exercise/Views/Utils/Constants/app_strings.dart';

class AppStaticProperties {
  //properties
  static final ImagePicker picker = ImagePicker();

  //static final FilePicker filePicker = FilePicker();
  static File? profileCameraImageFile;
  static File? licenseCameraImageFile;
  static File? certificateCameraImageFile;
  static File? passportCameraImageFile;
  static int previousImageCount = 0;
  static int profileButtonTab = 0;
  static int licenseButtonTab = 0;
  static int certificateButtonTab = 0;
  static int passportButtonTab = 0;

  //methods
  static Future<int> takePhoto({
    required BuildContext context,
    required String title,
  }) async {
    try {
      //file picked form the camera
      final pickedFile = await picker.pickImage(
        source: ImageSource.camera,
      );

      debugPrint('previous file path: ${pickedFile!.path}');

      if (title == AppStrings.profilePicture) {
        profileButtonTab = profileButtonTab + 1;
        profileCameraImageFile = File(pickedFile!.path);
        if (profileCameraImageFile!.path.isEmpty || profileButtonTab > 1) {
          return 0;
        } else {
          return 1;
        }
      } else if (title == AppStrings.drivingLicense) {
        licenseButtonTab = licenseButtonTab + 1;
        licenseCameraImageFile = File(pickedFile!.path);
        if (licenseCameraImageFile!.path.isEmpty || licenseButtonTab > 1) {
          return 0;
        } else {
          return 1;
        }
      } else if (title == AppStrings.certificate) {
        certificateButtonTab = certificateButtonTab + 1;
        certificateCameraImageFile = File(pickedFile!.path);
        if (certificateCameraImageFile!.path.isEmpty ||
            certificateButtonTab > 1) {
          return 0;
        } else {
          return 1;
        }
      } else if (title == AppStrings.passport) {
        passportButtonTab = passportButtonTab + 1;
        passportCameraImageFile = File(pickedFile!.path);
        if (passportCameraImageFile!.path.isEmpty || passportButtonTab > 1) {
          return 0;
        } else {
          return 1;
        }
      }
    } catch (imagePickerError) {
      debugPrint('image picker error $imagePickerError');
      return 0;
    }
    return 0;
  }

  static Future<int> pickFile({
    required BuildContext context,
    required String title,
  }) async {
    try {
      //pick file form file manager
      final pickedFile = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        // allowedExtensions: ['pdf', 'png', 'jpg'],
        allowedExtensions: ['png', 'jpg'],
      );
      PlatformFile file = pickedFile!.files.first;
      debugPrint('file path: ${file.path}');
      debugPrint('file extension: ${file.extension}');

      // final pdf = PdfImageRendererPdf(path: file.path!);
      // debugPrint('picked pdf $pdf');

      //pdf.open();

      if (title == AppStrings.profilePicture) {
        profileButtonTab = profileButtonTab + 1;
        profileCameraImageFile = File(file.path!);
        if (profileCameraImageFile!.path.isEmpty || profileButtonTab > 1) {
          return 0;
        } else {
          return 1;
        }
      } else if (title == AppStrings.drivingLicense) {
        licenseButtonTab = licenseButtonTab + 1;
        licenseCameraImageFile = File(file.path!);
        if (licenseCameraImageFile!.path.isEmpty || licenseButtonTab > 1) {
          return 0;
        } else {
          return 1;
        }
      } else if (title == AppStrings.certificate) {
        certificateButtonTab = certificateButtonTab + 1;
        certificateCameraImageFile = File(file.path!);
        if (certificateCameraImageFile!.path.isEmpty ||
            certificateButtonTab > 1) {
          return 0;
        } else {
          return 1;
        }
      } else if (title == AppStrings.passport) {
        passportButtonTab = passportButtonTab + 1;
        passportCameraImageFile = File(file.path!);
        if (passportCameraImageFile!.path.isEmpty || passportButtonTab > 1) {
          return 0;
        } else {
          return 1;
        }
      }
    } catch (filePickerError) {
      debugPrint('file picker error');
      return 0;
    }
    return 0;
  }

  //image preview logic
  static Widget imagePreviewMethod({required String title}) {
    return Builder(
      builder: (context) {
        final profile = AppStaticProperties.profileCameraImageFile;
        final license = AppStaticProperties.licenseCameraImageFile;
        final certificate = AppStaticProperties.certificateCameraImageFile;
        final passport = AppStaticProperties.passportCameraImageFile;

        if (title == AppStrings.profilePicture) {
          if (profile != null) {
            return Image.file(
              AppStaticProperties.profileCameraImageFile!,
              fit: BoxFit.fill,
            );
          } else {
            return SizedBox();
          }
        } else if (title == AppStrings.drivingLicense) {
          if (license != null) {
            return Image.file(
              AppStaticProperties.licenseCameraImageFile!,
              fit: BoxFit.fill,
            );
          } else {
            return SizedBox();
          }
        } else if (title == AppStrings.certificate) {
          if (certificate != null) {
            return Image.file(
              AppStaticProperties.certificateCameraImageFile!,
              fit: BoxFit.fill,
            );
          } else {
            return SizedBox();
          }
        } else if (title == AppStrings.passport) {
          if (passport != null) {
            return Image.file(
              AppStaticProperties.passportCameraImageFile!,
              fit: BoxFit.fill,
            );
          } else {
            return SizedBox();
          }
        } else {
          return SizedBox();
        }
      },
    );
  }
}
