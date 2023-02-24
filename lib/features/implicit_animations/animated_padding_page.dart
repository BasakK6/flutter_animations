import 'package:flutter/material.dart';
import 'package:flutter_animations/app_drawer.dart';
import 'package:flutter_animations/core/context_extensions.dart';

import 'package:flutter_animations/core/duration_items.dart';

class AnimatedPaddingPage extends StatefulWidget {
  const AnimatedPaddingPage({Key? key}) : super(key: key);

  @override
  State<AnimatedPaddingPage> createState() => _AnimatedPaddingPageState();
}

class _AnimatedPaddingPageState extends State<AnimatedPaddingPage> {
  double leftPadding = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("AnimatedPadding (Implicit)"),
      ),
      drawer: const AppDrawer(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                setState(() {
                  leftPadding = leftPadding == 0 ? 64 : 0;
                });
              },
              child: const Text("Start Animation"),
            ),
            const SizedBox(
              height: 20,
            ),
            AnimatedPadding(
              padding: EdgeInsets.only(left: leftPadding),
              duration: const DurationItems.durationLow(),
              curve: Curves.bounceOut,
              child: const Text("I bounce out"),
              onEnd: (){
                context.showSnackBar("End of the animation");
              },
            ),
          ],
        ),
      ),
    );
  }
}
