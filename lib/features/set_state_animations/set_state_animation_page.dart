import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animations/app_drawer.dart';

class SetStateAnimationPage extends StatefulWidget {
  const SetStateAnimationPage(
      {required this.left,
      required this.top,
      required this.right,
      required this.message,
      Key? key})
      : super(key: key);

  final bool left;
  final bool top;
  final bool right;
  final String message;

  @override
  State<SetStateAnimationPage> createState() => _SetStateAnimationPageState();
}

class _SetStateAnimationPageState extends State<SetStateAnimationPage>
    with SingleTickerProviderStateMixin {
  late Ticker _ticker;
  double position = 0;

  @override
  void initState() {
    super.initState();

    _ticker = createTicker((Duration elapsed) {
      final angle = pi *
          elapsed.inMicroseconds /
          const Duration(seconds: 1).inMicroseconds;
      var value = sin(angle); //sin will give a value between -1 and 1
      value = value * 30 + 60; // now we have a value between 0 and 90
      // update the state
      setState(() {
        position = value;
      });
    });

    _ticker.start();
  }

  @override
  void dispose() {
    _ticker.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("SetState Animation")),
      drawer: const AppDrawer(),
      body: Center(
        child: Padding(
          padding: EdgeInsets.only(
            left: widget.left ? position : 0,
            top: widget.top ? position : 0,
            right: widget.right ? position : 0,
          ),
          child: Text(widget.message),
        ),
      ),
    );
  }
}
