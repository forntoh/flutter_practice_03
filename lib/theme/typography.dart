import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTypography {
  static TextTheme textTheme = TextTheme(
      headline1: GoogleFonts.alata(fontSize: 96, fontWeight: FontWeight.bold),
      headline2: GoogleFonts.alata(fontSize: 60, fontWeight: FontWeight.bold),
      headline3: GoogleFonts.alata(fontSize: 48, fontWeight: FontWeight.bold),
      headline4: GoogleFonts.alata(fontSize: 34, fontWeight: FontWeight.bold, color: Colors.white),
      headline5: GoogleFonts.alata(fontSize: 24, fontWeight: FontWeight.bold),
      headline6: GoogleFonts.alata(fontSize: 20, fontWeight: FontWeight.bold),
      subtitle1: GoogleFonts.alata(fontSize: 16, fontWeight: FontWeight.bold),
      subtitle2: GoogleFonts.alata(fontSize: 14, fontWeight: FontWeight.bold),
      bodyText1: GoogleFonts.alata(fontSize: 15),
      bodyText2: GoogleFonts.alata(fontSize: 15),
      button: GoogleFonts.alata(fontSize: 20),
      caption: GoogleFonts.alata(fontSize: 13),
      overline: GoogleFonts.alata(fontSize: 10));
}
