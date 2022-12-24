import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:productbox_flutter_exercise/Views/Utils/Constants/theme_data.dart';

class FullImageScreen extends StatelessWidget {
  final File? forwardImage;

  const FullImageScreen({Key? key, required this.forwardImage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1.sh,
      width: 1.sw,
      color: AppColors.backgroundColor,
      child: Image.file(
        forwardImage!,
        fit: BoxFit.fill,
      ),
    );
  }
}
