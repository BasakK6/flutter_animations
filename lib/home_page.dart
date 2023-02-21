import 'package:flutter/material.dart';
import 'package:flutter_animations/app_drawer.dart';
import 'package:flutter_animations/project/constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(Constants.homePageTitle),
      ),
      body: const Center(
        child: Padding(
          padding: EdgeInsets.all(32),
          child: Text(
            Constants.homePageText,
          ),
        ),
      ),
      drawer: const AppDrawer(),
    );
  }
}
