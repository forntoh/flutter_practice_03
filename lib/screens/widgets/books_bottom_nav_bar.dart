import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'custom_bottom_bar.dart';

class BooksBottomNavBar extends StatelessWidget {
  const BooksBottomNavBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomBottomAppBar(
      onTabSelected: (int) {},
      items: [
        CustomAppBarItem(icon: CupertinoIcons.book_fill),
        CustomAppBarItem(icon: CupertinoIcons.search),
        CustomAppBarItem(icon: CupertinoIcons.bookmark_fill),
        CustomAppBarItem(icon: CupertinoIcons.person_circle_fill),
      ],
    );
  }
}