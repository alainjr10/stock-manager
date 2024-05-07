import 'package:flutter/material.dart';
import 'package:stock_manager/src/utils/constants/constants.dart';

extension TextThemeX on BuildContext {
  ThemeData get _theme => Theme.of(this);
  TextTheme get textTheme => _theme.textTheme;

  TextStyle get bodySmall => textTheme.bodySmall!;

  TextStyle get bodyMedium => textTheme.bodyMedium!;

  TextStyle get bodyLarge => textTheme.bodyLarge!;

  TextStyle get labelSmall => textTheme.labelSmall!;

  TextStyle get labelMedium => textTheme.labelMedium!;

  TextStyle get labelLarge => textTheme.labelLarge!;
  TextStyle get titleSmall => textTheme.titleSmall!;
  TextStyle get titleMedium => textTheme.titleMedium!;
  TextStyle get titleLarge => textTheme.titleLarge!;
  TextStyle get headlineSmall => textTheme.headlineSmall!;
  TextStyle get headlineMedium => textTheme.headlineMedium!;
  TextStyle get headlineLarge => textTheme.headlineLarge!;
  TextStyle get displaySmall => textTheme.displaySmall!;
  TextStyle get displayMedium => textTheme.displayMedium!;
  TextStyle get displayLarge => textTheme.displayLarge!;
}

extension TextStyleX on TextStyle {
  TextStyle get bold => copyWith(fontWeight: FontWeight.bold);
  TextStyle get bold100 => copyWith(fontWeight: FontWeight.w100);
  TextStyle get bold200 => copyWith(fontWeight: FontWeight.w200);
  TextStyle get bold300 => copyWith(fontWeight: FontWeight.w300);
  TextStyle get bold400 => copyWith(fontWeight: FontWeight.w400);
  TextStyle get bold500 => copyWith(fontWeight: FontWeight.w500);
  TextStyle get bold600 => copyWith(fontWeight: FontWeight.w600);
  TextStyle get bold700 => copyWith(fontWeight: FontWeight.w700);
  TextStyle get bold800 => copyWith(fontWeight: FontWeight.w800);
  TextStyle get bold900 => copyWith(fontWeight: FontWeight.w900);
  TextStyle get primaryColor => copyWith(color: kPrimaryColor);
  TextStyle get errorTextColor => copyWith(color: kErrorColor);
  TextStyle get size12 => copyWith(fontSize: 12.0);
  TextStyle get size14 => copyWith(fontSize: 14.0);
  TextStyle get size16 => copyWith(fontSize: 16.0);
  TextStyle get size18 => copyWith(fontSize: 18.0);
  TextStyle get size20 => copyWith(fontSize: 20.0);
  TextStyle get size22 => copyWith(fontSize: 22.0);
  TextStyle get size24 => copyWith(fontSize: 24.0);
}
