import 'package:flutter/material.dart';
import 'package:flutter_practice_03/theme/widgets.dart';

import 'colors.dart';
import 'typography.dart';

class CustomTheme {
  static ThemeData get myTheme {
    return ThemeData(
      primaryColor: CustomColors.blue_black,
      accentColor: CustomColors.taxi_yellow,
      scaffoldBackgroundColor: Colors.transparent,
      textTheme: CustomTypography.textTheme,
      buttonTheme: CustomWidgets.buttonThemeDark,
      cardTheme: CustomWidgets.cardTheme,
      colorScheme: ColorScheme.dark(),
      visualDensity: VisualDensity.adaptivePlatformDensity,
    );
  }
}
