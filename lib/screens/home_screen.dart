import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_practice_03/data/data.dart';
import 'package:flutter_practice_03/screens/components/custom_bottom_bar.dart';

import '../constants.dart';
import 'home/widgets/home_body.dart';

class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: books.length,
      child: Scaffold(
        extendBodyBehindAppBar: true,
        extendBody: true,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: Padding(
            padding: const EdgeInsets.only(left: defaultPadding),
            child: Icon(CupertinoIcons.bars),
          ),
          toolbarHeight: 80,
        ),
        bottomNavigationBar: CustomBottomAppBar(
          onTabSelected: (int) {},
          items: [
            CustomAppBarItem(icon: CupertinoIcons.book_fill),
            CustomAppBarItem(icon: CupertinoIcons.search),
            CustomAppBarItem(icon: CupertinoIcons.bookmark_fill),
            CustomAppBarItem(icon: CupertinoIcons.person_circle_fill),
          ],
        ),
        body: HomeBody(),
      ),
    );
  }
}