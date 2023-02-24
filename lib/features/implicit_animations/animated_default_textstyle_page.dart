import 'package:flutter/material.dart';

import 'package:flutter_animations/app_drawer.dart';
import 'package:flutter_animations/core/context_extensions.dart';
import 'package:flutter_animations/core/duration_items.dart';

class AnimatedDefaultTextStylePage extends StatefulWidget {
  const AnimatedDefaultTextStylePage({Key? key}) : super(key: key);

  @override
  State<AnimatedDefaultTextStylePage> createState() =>
      _AnimatedDefaultTextStylePageState();
}

class _AnimatedDefaultTextStylePageState
    extends State<AnimatedDefaultTextStylePage> {

  bool isLargeText =true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("AnimatedDefaultTextStyle (Implicit)"),
      ),
      drawer: const AppDrawer(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                setState(() {
                  isLargeText = !isLargeText;
                });
              },
              child: const Text("Start Animation"),
            ),
            const SizedBox(
              height: 20,
            ),
            AnimatedDefaultTextStyle(
                style: (isLargeText ? context.textTheme.titleLarge :context.textTheme.titleSmall) ?? const TextStyle(),
                duration: const DurationItems.durationLow(),
                curve: Curves.bounceOut,
                onEnd: (){
                  context.showSnackBar("End of the animation");
                },
                child: const Text("My style changes"),),
          ],
        ),
      ),
    );
  }
}
