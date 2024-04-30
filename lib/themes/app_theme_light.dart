import 'package:flutter/material.dart';
import 'package:social/utils/colors.dart';

final appThemeLight = ThemeData(
  colorScheme: myColors,
  textTheme: TextTheme(
    // bodyLarge: TextStyle(
    //   color: myColors.onPrimary,
    //   fontWeight: FontWeight.w600,
    //   fontSize: 28,
    // ),
    bodyMedium: TextStyle(
      color: myColors.onPrimary,
      fontWeight: FontWeight.w500,
      fontSize: 16,
    ),
    bodySmall: TextStyle(
      color: myColors.onPrimary,
      fontSize: 12,
    ),
  ),
);
