import 'package:flutter/material.dart';

import 'package:flutter_animations/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch().copyWith(
            primary: const Color(0xFFD4606A),
            secondary: const Color(0xFFD49A9B),
          ),
        ),
        home: const HomePage(),
      );
  }
}


