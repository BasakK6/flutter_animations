import 'package:flutter/material.dart';
import 'package:flutter_animations/app_drawer.dart';
import 'package:flutter_animations/core/context_extensions.dart';
import 'package:flutter_animations/project/constants.dart';
import 'package:lottie/lottie.dart';

class LottieAnimationPage extends StatefulWidget {
  const LottieAnimationPage({Key? key}) : super(key: key);

  @override
  State<LottieAnimationPage> createState() => _LottieAnimationPageState();
}

class _LottieAnimationPageState extends State<LottieAnimationPage>
    with TickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
    _controller.value = 0.1;

    _controller.addListener(() {
      setState(() {
        // Rebuild the widget at each frame to update the "progress" label.
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lottie Animation"),
      ),
      drawer: const AppDrawer(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text(Constants.lottieSectionOneTitle),
            Lottie.network(
              Constants.lottieNetworkPath,
              width: context.dynamicWidth(0.5),
              height: context.dynamicWidth(0.5),
            ),
            const Text(Constants.lottieSectionTwoTitle),
            Lottie.asset(
              Constants.lottieAssetPath,
              width: context.dynamicWidth(0.5),
              height: context.dynamicWidth(0.5),
            ),
            const Text(Constants.lottieSectionThreeTitle),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    onPressed: _controller.reverse,
                    child: const Text(Constants.lottieActionReverse)),
                ElevatedButton(
                    onPressed: _controller.stop, child: const Text(Constants.lottieActionStop)),
                ElevatedButton(
                    onPressed: _controller.forward,
                    child: const Text(Constants.lottieActionForward)),
              ],
            ),
            Lottie.asset(
              Constants.lottieAssetPath,
              controller: _controller,
              width: context.dynamicWidth(0.5),
              height: context.dynamicWidth(0.5),
              onLoaded: (composition) {
                setState(() {
                  _controller.duration = composition.duration;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
