import 'package:flutter/material.dart';
import 'package:flutter_animations/app_drawer.dart';

class AnimatedCrossFadePage extends StatefulWidget {
  const AnimatedCrossFadePage({Key? key}) : super(key: key);

  @override
  State<AnimatedCrossFadePage> createState() => _AnimatedCrossFadePageState();
}

class _AnimatedCrossFadePageState extends State<AnimatedCrossFadePage> {
  bool like = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("AnimatedCrossFade (Implicit)"),
      ),
      drawer: const AppDrawer(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                setState(() {
                  like = !like;
                });
              },
              child: const Text("Start Animation"),
            ),
            const SizedBox(
              height: 20,
            ),
            AnimatedCrossFade(
              firstChild: const Icon(
                Icons.favorite,
                size: 100,
              ),
              secondChild: const Icon(
                Icons.favorite_border,
                size: 100,
              ),
              duration: const Duration(seconds: 1),
              crossFadeState:
                  like ? CrossFadeState.showFirst : CrossFadeState.showSecond,
            ),
          ],
        ),
      ),
    );
  }
}
