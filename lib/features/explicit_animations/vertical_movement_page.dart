import 'package:flutter/material.dart';
import 'package:flutter_animations/app_drawer.dart';

import 'package:flutter_animations/core/duration_items.dart';

class VerticalMovementPage extends StatefulWidget {
  const VerticalMovementPage({Key? key}) : super(key: key);

  @override
  State<VerticalMovementPage> createState() => _VerticalMovementPageState();
}

class _VerticalMovementPageState extends State<VerticalMovementPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this, // the SingleTickerProviderStateMixin
      duration: const DurationItems.durationLow(),
      lowerBound: 0,
      upperBound: 100,
    );

    _controller.addListener(() {
      setState(() {});
    });

    _controller.repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Explicit Animation"),),
      drawer: const AppDrawer(),
      body: Center(
        child: Padding(
          padding: EdgeInsets.only(
            top: _controller.value,
          ),
          child: const Text("I go Down and then Up"),
        ),
      ),
    );
  }
}
