import 'package:flutter/material.dart';
import 'dart:math' as math;

class Painter extends CustomPainter {
  final Offset center;
  final double angle;
  final double length;

  Painter(this.center, this.angle, this.length);

  @override
  void paint(Canvas canvas, Size size) {
    canvas.translate(center.dx, center.dy);
    Paint pencil = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.fill;

    var finalPosition = positionByAngle(angle, length);

    canvas.drawLine(Offset.zero, finalPosition, pencil);
    canvas.drawCircle(finalPosition, 5, pencil);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;

  Offset positionByAngle(double angle, double length) {
    var x = length * math.sin(angle);
    var y = length * math.cos(angle);

    return Offset(x, y);
  }
}
