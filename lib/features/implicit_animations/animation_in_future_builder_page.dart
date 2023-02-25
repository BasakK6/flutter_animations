import 'package:flutter/material.dart';
import 'package:flutter_animations/app_drawer.dart';
import 'package:flutter_animations/core/duration_items.dart';

class AnimationInFutureBuilderPage extends StatefulWidget {
  const AnimationInFutureBuilderPage({Key? key}) : super(key: key);

  @override
  State<AnimationInFutureBuilderPage> createState() =>
      _AnimationInFutureBuilderPageState();
}

class _AnimationInFutureBuilderPageState
    extends State<AnimationInFutureBuilderPage> {
  bool isLoading = false;
  late Future _future;

  void changeLoadingStatus() {
    setState(() {
      isLoading = !isLoading;
    });
  }

  Future<void> doSomething() async {
    changeLoadingStatus();
    await Future.delayed(const DurationItems.durationHigh());
    changeLoadingStatus();
  }

  @override
  void initState() {
    super.initState();
    _future = doSomething();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: const AppDrawer(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (isLoading)
              const CircularProgressIndicator()
            else
              const SizedBox.shrink(),
            const SizedBox(height: 16),
            FutureBuilder(
              future: _future,
              builder: (context, snapshot) {
                double opacity = 0;

                if (snapshot.connectionState == ConnectionState.done) {
                  opacity = 1;
                }

                return AnimatedOpacity(
                  opacity: opacity,
                  duration: const DurationItems.durationLow(),
                  child: const Text("The async work is done"),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
