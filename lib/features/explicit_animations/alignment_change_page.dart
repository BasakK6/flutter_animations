import 'package:flutter/material.dart';
import 'package:flutter_animations/app_drawer.dart';
import 'package:flutter_animations/core/duration_items.dart';

class AlignmentChangePage extends StatefulWidget {
  const AlignmentChangePage({Key? key}) : super(key: key);

  @override
  State<AlignmentChangePage> createState() => _AlignmentChangePageState();
}

class _AlignmentChangePageState extends State<AlignmentChangePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late final Tween<AlignmentGeometry> _alignmentTween;

  @override
  void initState() {
    super.initState();
    _alignmentTween = Tween<AlignmentGeometry>(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    );
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
        title: const Text("AlignTransition and Controller"),
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
              child: const Text("Change Alignment"),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              color: Colors.black,
              width: 200,
              height: 200,
              child: AlignTransition(
                alignment: _alignmentTween.animate(_controller),
                child: Container(
                  color: const Color(0xFFD4606A),
                  width: 50,
                  height: 50,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
