import 'package:flutter/material.dart';
import 'package:productbox_flutter_exercise/Views/Utils/Constants/theme_data.dart';

class LoginPageTopBigDesign extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint0 = Paint()
      ..color = AppColors.primaryColorLight
      ..style = PaintingStyle.fill
      ..strokeWidth = 1.0;

    Path path0 = Path();
    path0.moveTo(size.width * 0.4365625, 0);
    path0.cubicTo(
        size.width * 0.4732000,
        size.height * 0.2295000,
        size.width * 0.3248000,
        size.height * 0.0166600,
        size.width * 0.2568750,
        size.height * 0.1105000);
    path0.cubicTo(
        size.width * 0.2097625,
        size.height * 0.2081200,
        size.width * 0.3593000,
        size.height * 0.3091000,
        size.width * 0.2903125,
        size.height * 0.3742200);
    path0.cubicTo(
        size.width * 0.2467500,
        size.height * 0.4081800,
        size.width * 0.1062250,
        size.height * 0.2896000,
        size.width * 0.0740375,
        size.height * 0.2738400);
    path0.cubicTo(
        size.width * 0.0387250,
        size.height * 0.3421000,
        size.width * 0.0671000,
        size.height * 0.3836000,
        size.width * 0.0552250,
        size.height * 0.4243400);
    path0.quadraticBezierTo(size.width * 0.0380375, size.height * 0.4667200, 0,
        size.height * 0.4830000);
    path0.lineTo(0, 0);
    path0.quadraticBezierTo(
        size.width * 0.1091406, 0, size.width * 0.4365625, 0);
    path0.close();

    canvas.drawPath(path0, paint0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
