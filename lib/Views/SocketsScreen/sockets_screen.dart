import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:productbox_flutter_exercise/Views/Utils/Constants/status_bar_configuration.dart';
import 'package:productbox_flutter_exercise/Views/Utils/Constants/theme_data.dart';

class SocketsScreen extends StatelessWidget {
  const SocketsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StatusBarConfiguration.statusBarConfiguration(
        child: Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Center(
        child: Text(
          "Haven't work with sockets yet",
          style: GoogleFonts.poppins(
            color: AppColors.white,
            fontSize: 50.sp,
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
    ));
  }
}
