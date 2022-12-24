import 'package:flutter/material.dart';
import 'package:productbox_flutter_exercise/Views/Utils/Constants/theme_data.dart';

class BottomLeftDesign extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint0 = Paint()
      ..color = AppColors.primaryColorLight
      ..style = PaintingStyle.fill
      ..strokeWidth = 1.0;

    Path path0 = Path();
    path0.moveTo(0, size.height * 0.6195000);
    path0.quadraticBezierTo(size.width * 0.0090875, size.height * 0.6735200,
        size.width * 0.0275000, size.height * 0.6740000);
    path0.cubicTo(
        size.width * 0.0409375,
        size.height * 0.6760000,
        size.width * 0.0722500,
        size.height * 0.6572200,
        size.width * 0.0812500,
        size.height * 0.6820000);
    path0.cubicTo(
        size.width * 0.0951500,
        size.height * 0.7129000,
        size.width * 0.0785875,
        size.height * 0.7532800,
        size.width * 0.0703000,
        size.height * 0.7713600);
    path0.cubicTo(
        size.width * 0.0318875,
        size.height * 0.8351000,
        size.width * 0.0678375,
        size.height * 0.8701600,
        size.width * 0.0978000,
        size.height * 0.8670800);
    path0.cubicTo(
        size.width * 0.2552125,
        size.height * 0.8523200,
        size.width * 0.2558625,
        size.height * 0.8383000,
        size.width * 0.2887500,
        size.height * 0.8420000);
    path0.quadraticBezierTo(size.width * 0.3186500, size.height * 0.8419600,
        size.width * 0.3125000, size.height * 0.8760000);
    path0.lineTo(size.width * 0.2405250, size.height);
    path0.lineTo(0, size.height);
    path0.lineTo(0, size.height * 0.6195000);
    path0.close();

    canvas.drawPath(path0, paint0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
