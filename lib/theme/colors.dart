import 'package:flutter/material.dart';

class CustomColors {
  static const Color violet = Color(0xFF841ee9);

  static const Color violet_darker = Color(0xFF6f19e2);

  static const Color light_blue = Color(0xFF69728E);

  static const Color taxi_yellow = Color(0xFFFFEE47);

  static const gradientDecoration = BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.centerRight,
      end: Alignment.centerLeft,
      colors: [CustomColors.violet_darker, CustomColors.violet],
  ));
}
