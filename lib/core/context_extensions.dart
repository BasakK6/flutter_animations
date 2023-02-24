import 'package:flutter/material.dart';
import 'package:flutter_animations/core/duration_items.dart';

extension ContextExtension on BuildContext {
  NavigatorState get navigation => Navigator.of(this);

  MediaQueryData get mediaQuery => MediaQuery.of(this);

  ScaffoldMessengerState get scaffoldMessenger => ScaffoldMessenger.of(this);
}

extension SizeExtension on BuildContext {
  double get width => mediaQuery.size.width;

  double get height => mediaQuery.size.height;

  double dynamicWidth(double percentage) => width * percentage;

  double dynamicHeight(double percentage) => height * percentage;
}

extension SnackBarExtension on BuildContext {
  void showSnackBar(String message) => scaffoldMessenger.showSnackBar(
        SnackBar(
          content: Text(message),
          duration: const DurationItems.durationHigh(),
        ),
      );
}
