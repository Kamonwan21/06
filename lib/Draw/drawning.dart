import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class Drawning extends StatefulWidget {
  const Drawning({super.key, required this.title_name});
  final String title_name;

  @override
  State<Drawning> createState() => _DrawningState();
}

class _DrawningState extends State<Drawning> {
  final FlutterTts flutterTts = FlutterTts();

  speak(String text) async {
    await flutterTts.setSharedInstance(true);
    await flutterTts.setLanguage("th-TH");
    await flutterTts.setPitch(1);
    await flutterTts.speak(text);
  }

  List<Offset> point = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('${widget.title_name}',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          centerTitle: true,
          backgroundColor: Colors.green,
        ),
        body: Center(
            child: Container(
          child: Container(
            width: 350,
            height: 650,
            color: Colors.white,
            child: GestureDetector(
              onPanStart: (details) {
                setState(() {
                  point.add(details.localPosition);
                });
              },
              onPanUpdate: (details) {
                setState(() {
                  point.add(details.localPosition);
                });
              },
              onPanEnd: ((details) {
                point.add(Offset.infinite);
              }),
              child: CustomPaint(
                painter: HandWritten(point),
              ),
            ),
          ),
        )));
  }
}

class HandWritten extends CustomPainter {
  final offsets;
  HandWritten(this.offsets);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 5;
    for (var i = 0; i < offsets.length - 1; i++) {
      if (offsets[i] != Offset.infinite && offsets[i + 1] != Offset.infinite) {
        canvas.drawLine(offsets[i], offsets[i + 1], paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }
}
