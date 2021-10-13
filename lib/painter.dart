import 'package:flutter/material.dart';

class Painter extends CustomPainter {
  final Offset center;
  final Offset position;

  Painter(this.center, this.position);

  @override
  void paint(Canvas canvas, Size size) {
    canvas.translate(center.dx, center.dy);
    Paint pencil = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.fill;

    canvas.drawCircle(position, 5, pencil);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
