import 'package:flutter/material.dart';

class BottomRightGradientPainter extends CustomPainter {
  final Gradient gradient;

  BottomRightGradientPainter(this.gradient);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..shader = gradient.createShader(Offset.zero & size);
    final path = Path()
      ..moveTo(size.width, size.height)
      ..lineTo(size.width, size.height * 0.6)
      ..lineTo(size.width * 0.9, size.height)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
