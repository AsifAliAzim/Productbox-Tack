import 'package:flutter/material.dart';
import 'package:productbox_flutter_exercise/Views/Utils/Constants/theme_data.dart';

class BottomRightDesign extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint0 = Paint()
      ..color = AppColors.primaryColor
      ..style = PaintingStyle.fill
      ..strokeWidth = 1.0;

    Path path0 = Path();
    path0.moveTo(size.width, size.height * 0.5073400);
    path0.cubicTo(
        size.width * 0.9411625,
        size.height * 0.4747200,
        size.width * 0.8473625,
        size.height * 0.4549400,
        size.width * 0.7715750,
        size.height * 0.5443000);
    path0.cubicTo(
        size.width * 0.6523125,
        size.height * 0.6897200,
        size.width * 0.7870875,
        size.height * 0.9177400,
        size.width * 0.6602250,
        size.height);
    path0.quadraticBezierTo(size.width * 0.7360750, size.height * 1.0033200,
        size.width, size.height);
    path0.quadraticBezierTo(size.width, size.height * 0.8768350, size.width,
        size.height * 0.5073400);
    path0.close();

    canvas.drawPath(path0, paint0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
