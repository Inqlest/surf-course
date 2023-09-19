import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: const MyHomePage(title: 'Gesture Master'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Color _color = Colors.lightGreenAccent;
  double _xPosition = 0;
  double _yPosition = 0;
  double _rotationAngle = 0.0;

  void changeColor() {
    setState(() {
      _color = Color((Random().nextDouble() * 0xFFFFFF).toInt() << 0).withOpacity(1.0);
    });
  }

  void rotation() {}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.deepPurple,
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
            child: Stack(children: [
          Positioned.fill(
              child: GestureDetector(
                  onTap: () {
                    changeColor();
                  },
                  child: GestureDetector(
                      onPanUpdate: (details) {
                        _xPosition += details.delta.dx;
                        _yPosition += details.delta.dy;
                        setState(() {});
                      },
                      child: Transform.translate(
                          offset: Offset(_xPosition, _yPosition),
                          child: GestureDetector(
                              onLongPress: () {
                                setState(() {
                                  _rotationAngle += 15;
                                });
                              },
                              child: Transform.rotate(
                                angle: _rotationAngle * (3.14159265359 / 180),
                                child: Icon(
                                  size: 250,
                                  Icons.apple,
                                  color: _color,
                                ),
                              ))))))
        ])));
  }
}
