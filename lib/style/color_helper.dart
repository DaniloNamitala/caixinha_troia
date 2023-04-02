import 'package:flutter/material.dart';

class ColorHelper {
  static const opacity = [.1, .2, .3, .4, .5, .6, .7, .8, .9, 1.0];
  static const indexes = [50, 100, 200, 300, 400, 500, 600, 700, 800, 900];

  static MaterialColor toMaterial(Color c) {
    return MaterialColor(c.value,
        {for (int i = 0; i < 10; i++) indexes[i]: c.withOpacity(opacity[i])});
  }
}
