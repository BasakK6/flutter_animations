import 'package:flutter/cupertino.dart';

extension ContextExtension on BuildContext {
  NavigatorState get navigation => Navigator.of(this);
}
