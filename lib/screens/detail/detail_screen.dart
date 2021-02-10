import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_practice_03/model/book.dart';
import 'package:flutter_practice_03/screens/widgets/book_cover.dart';
import 'package:flutter_practice_03/screens/widgets/custom_bottom_bar.dart';
import 'package:flutter_practice_03/screens/widgets/rating_bar.dart';
import 'package:flutter_practice_03/theme/colors.dart';

import '../../constants.dart';

class DetailScreen extends StatelessWidget {
  final Book book;

  const DetailScreen({Key key, this.book}) : super(key: key);
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: Padding(
          padding: const EdgeInsets.only(left: defaultPadding / 2),
          child: BackButton(),
        ),
        toolbarHeight: appBarHeight,
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
      body: Container(
        decoration: CustomColors.gradientDecoration,
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
                  child: Row(
                    children: [
                      BookCover(book: book, scale: 1, width: 100,),
                      SizedBox(width: defaultPadding / 2),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            book.title,
                            style: Theme.of(context).textTheme.headline6,
                          ),
                          SizedBox(
                            height: 2,
                          ),
                          Text(
                            book.author,
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          RatingBar(rating: book.rating)
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}