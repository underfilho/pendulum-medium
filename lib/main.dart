import 'package:flutter/material.dart';
import 'package:pendulum_medium/painter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
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
  Offset position = Offset.zero;
  final velocity = 10;

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
          painter: Painter(center, position),
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
        position = Offset(position.dx + velocity, position.dy);
      });

      timer();
    });
  }
}
