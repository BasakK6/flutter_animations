import 'package:flutter/material.dart';
import 'package:flutter_animations/app_drawer.dart';
import 'package:flutter_animations/core/duration_items.dart';

class AnimatedOpacityPage extends StatefulWidget {
  const AnimatedOpacityPage({Key? key}) : super(key: key);

  @override
  State<AnimatedOpacityPage> createState() => _AnimatedOpacityPageState();
}

class _AnimatedOpacityPageState extends State<AnimatedOpacityPage> {
  double opacity = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("AnimatedOpacity (Implicit)"),
      ),
      drawer: const AppDrawer(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                setState(() {
                  opacity = opacity == 1 ? 0.2 : 1;
                });
              },
              child: const Text("Start Animation"),
            ),
            const SizedBox(
              height: 20,
            ),
            AnimatedOpacity(
              opacity: opacity,
              duration: const DurationItems.durationLow(),
              curve: Curves.bounceOut,
              child: const Text("My opacity changes", style: TextStyle(fontWeight: FontWeight.bold),),
            ),
          ],
        ),
      ),
    );
  }
}
