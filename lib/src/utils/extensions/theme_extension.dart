// create an extension of buildcontext for the theme
// this will allow us to access the theme data from anywhere in the app

import 'package:flutter/material.dart';
import 'dart:developer' as dev;
import 'package:flutter_screenutil/flutter_screenutil.dart';

extension ThemeExtension on BuildContext {
  ThemeData get theme => Theme.of(this);
  // use textTheme from the text_theme_extension.dart file
  // TextTheme get textTheme => theme.textTheme;
  ColorScheme get colorScheme => theme.colorScheme;
  // Size
  double get width => MediaQuery.of(this).size.width;
  double get height => MediaQuery.of(this).size.height;
  Size get size => MediaQuery.of(this).size;
}

extension Log on String {
  void log() {
    dev.log(toString());
  }
}

extension Spacing on num {
  // vertical spacing
  SizedBox get vGap => SizedBox(height: toDouble().h);
  SizedBox get hGap => SizedBox(width: toDouble().w);
  SizedBox get gap => const SizedBox.shrink();
}
