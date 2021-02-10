import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_practice_03/model/book.dart';
import 'package:flutter_practice_03/screens/widgets/book_cover.dart';
import 'package:flutter_practice_03/screens/widgets/custom_bottom_bar.dart';
import 'package:flutter_practice_03/theme/colors.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../../constants.dart';
import 'widgets/book_info_box.dart';
import 'widgets/editor_review_box.dart';

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
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: appBarHeight),
              BookInfoBox(book: book),
              EditorReviewBox(book: book),
              Padding(
                padding: const EdgeInsets.fromLTRB(
                    defaultPadding, 0, defaultPadding, defaultPadding),
                child: Text(
                  'More from ${book.author}',
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
              RelatedBooksList(book: book),
            ],
          ),
        ),
      ),
    );
  }
}

class RelatedBooksList extends StatelessWidget {
  const RelatedBooksList({
    Key key,
    @required this.book,
  }) : super(key: key);

  final Book book;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      clipBehavior: Clip.none,
      padding: const EdgeInsets.fromLTRB(defaultPadding, 0,
          defaultPadding, bottomAppBarHeight + defaultPadding),
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: book.books.asMap().entries.map((e) => Row(
          children: [
            BookCover(
              book: e.value,
              width: 120,
              onTap: (b) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DetailScreen(book: e.value)),
                );
              },
            ),
            if (e.key != book.books.length - 1)
              SizedBox(width: defaultPadding / 2)
          ],
        )).toList(),
      ),
    );
  }
}
