import 'package:flutter/material.dart';
import 'package:pendulum_medium/painter.dart';
import 'dart:math' as math;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple Animation',
      home: HomeApp(),
    );
  }
}

class HomeApp extends StatefulWidget {
  const HomeApp({Key? key}) : super(key: key);

  @override
  _HomeAppState createState() => _HomeAppState();
}

class _HomeAppState extends State<HomeApp> {
  Offset center = Offset.zero;
  double angle = math.pi / 3;
  double angularVelocity = 0;
  double angularAcceleration = 0;
  double length = 100;
  double g = 0.75;

  @override
  void initState() {
    super.initState();
    timer();
  }

  @override
  Widget build(BuildContext context) {
    final sizeScreen = MediaQuery.of(context).size;
    center = Offset(sizeScreen.width / 2, sizeScreen.height / 2);

    return Scaffold(
      body: SafeArea(
        child: CustomPaint(
          painter: Painter(center, angle, length),
          child: Container(
            width: double.infinity,
            height: double.infinity,
          ),
        ),
      ),
    );
  }

  void timer() {
    Future.delayed(Duration(milliseconds: 20)).then((_) {
      setState(() {
        angularAcceleration = -g/length * math.sin(angle);
        angularVelocity += angularAcceleration;
        angle += angularVelocity;
      });

      timer();
    });
  }
}
