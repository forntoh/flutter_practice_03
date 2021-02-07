import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_practice_03/screens/home_screen.dart';
import 'package:flutter_practice_03/theme/custom_theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));
    SystemChrome.setEnabledSystemUIOverlays([]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Books App',
      theme: CustomTheme.myTheme,
      home: HomeScreen(),
    );
  }
}