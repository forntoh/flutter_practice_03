import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_practice_03/screens/widgets/books_app_bar.dart';
import 'package:flutter_practice_03/screens/widgets/books_bottom_nav_bar.dart';

import 'widgets/home_body.dart';

class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      appBar: BooksAppBar(isHome: true),
      bottomNavigationBar: BooksBottomNavBar(),
      body: HomeBody(),
    );
  }
}