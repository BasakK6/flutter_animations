import 'package:flutter/material.dart';
import 'package:flutter_animations/app_drawer.dart';
import 'package:flutter_animations/core/duration_items.dart';

class AnimatedRotationPage extends StatefulWidget {
  const AnimatedRotationPage({Key? key}) : super(key: key);

  @override
  State<AnimatedRotationPage> createState() => _AnimatedRotationPageState();
}

class _AnimatedRotationPageState extends State<AnimatedRotationPage> {
  double turns = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("AnimatedRotation (Implicit)"),
      ),
      drawer: const AppDrawer(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                setState(() {
                  turns = (turns + 1/4) % 4;
                });
              },
              child: const Text("Start Animation"),
            ),
            const SizedBox(
              height: 100,
            ),
            AnimatedRotation(
              turns: turns,
              duration: const DurationItems.durationLow(),
              child: const Text("I turn 90 degrees"),
            )
          ],
        ),
      ),
    );
  }
}
