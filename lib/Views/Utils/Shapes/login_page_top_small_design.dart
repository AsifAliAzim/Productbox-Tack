import 'package:flutter/material.dart';
import 'package:productbox_flutter_exercise/Views/Utils/Constants/theme_data.dart';

class LoginPageTopSmallDesign extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint0 = Paint()
      ..color = AppColors.primaryColor
      ..style = PaintingStyle.fill
      ..strokeWidth = 1.0;

    Path path0 = Path();
    path0.moveTo(size.width * 0.2512500, 0);
    path0.cubicTo(
        size.width * 0.1993750,
        size.height * 0.1310400,
        size.width * 0.3145375,
        size.height * 0.1482600,
        size.width * 0.2865625,
        size.height * 0.2445000);
    path0.quadraticBezierTo(size.width * 0.2721875, size.height * 0.3225000,
        size.width * 0.1439125, size.height * 0.3290000);
    path0.quadraticBezierTo(size.width * 0.0400125, size.height * 0.3165000, 0,
        size.height * 0.2840000);
    path0.quadraticBezierTo(
        size.width * -0.0029625, size.height * 0.2140000, 0, 0);
    path0.quadraticBezierTo(size.width * 0.0656250, size.height * -0.0025000,
        size.width * 0.2512500, 0);
    path0.close();

    canvas.drawPath(path0, paint0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
