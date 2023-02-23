import 'package:flutter/material.dart';
import 'package:flutter_animations/app_drawer.dart';
import 'package:flutter_animations/core/context_extensions.dart';

class AnimatedPositionedPage extends StatefulWidget {
  const AnimatedPositionedPage({Key? key}) : super(key: key);

  @override
  State<AnimatedPositionedPage> createState() => _AnimatedPositionedPageState();
}

class _AnimatedPositionedPageState extends State<AnimatedPositionedPage> {
  double topDistance = 0;
  double leftDistance = 0;
  double sizePercentage = 0.1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("AnimatedPositioned (Implicit)"),
      ),
      drawer: const AppDrawer(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                setState(() {
                  topDistance = topDistance == 0 ? 60: 0;
                  leftDistance = leftDistance == 0 ? 60 : 0;
                  sizePercentage = sizePercentage == 0.1 ? 0.2 : 0.1;
                });
              },
              child: const Text("Start Animation"),
            ),
            const SizedBox(
              height: 20,
            ),
            Stack(
              children: [
                Container(
                  color: Colors.pink[50],
                  width: context.dynamicWidth(0.5),
                  height: context.dynamicHeight(0.4),
                ),
                AnimatedPositioned(
                  duration: const Duration(seconds: 1),
                  top:topDistance,
                  left: leftDistance,
                  width: context.dynamicWidth(sizePercentage),
                  height: context.dynamicHeight(sizePercentage),
                  child: Container(
                    color: const Color(0xFFD4606A),
                  ),
                  onEnd: (){
                    context.showSnackBar("End of the animation");
                  },
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
