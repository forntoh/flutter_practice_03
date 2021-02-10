import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_practice_03/screens/widgets/books_bottom_nav_bar.dart';

import '../../constants.dart';
import 'widgets/home_body.dart';

class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: Padding(
          padding: const EdgeInsets.only(left: defaultPadding),
          child: Icon(CupertinoIcons.bars),
        ),
        toolbarHeight: appBarHeight,
      ),
      bottomNavigationBar: BooksBottomNavBar(),
      body: HomeBody(),
    );
  }
}