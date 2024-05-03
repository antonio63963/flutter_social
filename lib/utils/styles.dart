import 'package:flutter/material.dart';
import 'package:social/utils/colors.dart';

class Styles {
  static TextStyle cardTitle = TextStyle(
    fontSize: 18,
    color: myColors.onSurface,
    fontWeight: FontWeight.bold,
  );
  static TextStyle cardSubtitle = const TextStyle(
    fontSize: 14,
    color: Color.fromARGB(255, 155, 155, 155),
  );
  static TextStyle cardText = const TextStyle(
    fontSize: 16,
    color: Color.fromARGB(255, 39, 39, 39),
  );
  static TextStyle avatarText = TextStyle(
    fontSize: 18,
    color: myColors.background,
    fontWeight: FontWeight.bold,
  );
}
