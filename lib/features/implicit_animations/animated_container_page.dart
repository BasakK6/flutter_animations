import 'package:flutter/material.dart';
import 'package:flutter_animations/app_drawer.dart';
import 'package:flutter_animations/core/context_extensions.dart';
import 'package:flutter_animations/core/duration_items.dart';

class AnimatedContainerPage extends StatefulWidget {
  const AnimatedContainerPage({Key? key}) : super(key: key);

  @override
  State<AnimatedContainerPage> createState() => _AnimatedContainerPageState();
}

class _AnimatedContainerPageState extends State<AnimatedContainerPage> {
  double widthPercentage = 0.6;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("AnimatedContainer (Implicit)"),
      ),
      drawer: const AppDrawer(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                setState(() {
                  widthPercentage = widthPercentage == 0.6 ? 0.8 : 0.6;
                });
              },
              child: const Text("Start Animation"),
            ),
            const SizedBox(
              height: 20,
            ),
            AnimatedContainer(
              color: Colors.pink[50],
              duration: const DurationItems.durationLow(),
              width: context.dynamicWidth(widthPercentage),
              height: context.dynamicHeight(0.2),
              curve: Curves.bounceOut,
              onEnd: (){
                context.showSnackBar("End of the animation");
              },
              child: const Center(child: Text("My container changes size")),

            ),
          ],
        ),
      ),
    );
  }
}