import 'package:flutter/material.dart';
import 'package:social/constants/colors.dart';

final appThemeLight = ThemeData(
  colorScheme: myColors,
  textTheme: TextTheme(
    bodyLarge: TextStyle(
      color: myColors.onPrimary,
      fontWeight: FontWeight.w600,
      fontSize: 28,
    ),
  ),
);
