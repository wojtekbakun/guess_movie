import 'package:flutter/widgets.dart';

class ScreenSizeHelper {
  static late double screenWidth;

  static void initialize(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
  }
}
