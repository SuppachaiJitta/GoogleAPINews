import 'package:flutter/material.dart';

class Sizer {
  final BuildContext context;
  Sizer(this.context);

  double get h => MediaQuery.of(context).size.height;

  double get w => MediaQuery.of(context).size.width;

  double getScreenWidth(double? percent) {
    final double size = (percent ?? 100) / 100;
    return w * size;
  }

  double getScreenHeight(double? percent) {
    final double size = (percent ?? 100) / 100;
    return h * size;
  }
}
