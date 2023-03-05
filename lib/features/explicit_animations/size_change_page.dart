import 'package:flutter/material.dart';
import 'package:flutter_animations/app_drawer.dart';
import 'package:flutter_animations/core/duration_items.dart';

class SizeChangePage extends StatefulWidget {
  const SizeChangePage({Key? key}) : super(key: key);

  @override
  State<SizeChangePage> createState() => _SizeChangePageState();
}

class _SizeChangePageState extends State<SizeChangePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const DurationItems.durationLow(),
    );

    _controller.forward();
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
        title: const Text("ScaleTransition and Controller"),
      ),
      drawer: const AppDrawer(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _controller.value == 0
                      ? _controller.animateTo(1)
                      : _controller.animateTo(0);
                });
              },
              child: const Text("Change the Size"),
            ),
            const SizedBox(
              height: 20,
            ),
            ScaleTransition(scale:_controller, child: const Icon(Icons.favorite, size: 200)),
          ],
        ),
      ),
    );
  }
}
