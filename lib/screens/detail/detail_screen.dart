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
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: appBarHeight),
              BookInfoBox(book: book),
              EditorReviewBox(book: book),
              Padding(
                padding: const EdgeInsets.fromLTRB(defaultPadding, 0, defaultPadding, defaultPadding),
                child: Text('More from ${book.author}',
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
              SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(defaultPadding, 0, defaultPadding, bottomAppBarHeight + defaultPadding),
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    BookCover(book: book, width: 120,),
                    SizedBox(width: defaultPadding / 2),
                    BookCover(book: book, width: 120,),
                    SizedBox(width: defaultPadding / 2,),
                    BookCover(book: book, width: 120,),
                    SizedBox(width: defaultPadding / 2,),
                    BookCover(book: book, width: 120,),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class BookInfoBox extends StatelessWidget {
  const BookInfoBox({
    Key key,
    @required this.book,
  }) : super(key: key);

  final Book book;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
      child: Row(
        children: [
          BookCover(
            book: book,
            scale: 1,
            width: 100,
          ),
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
              Opacity(
                opacity: 0.8,
                child: Text(
                  book.author,
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ),
              SizedBox(
                height: 6,
              ),
              RatingBar(rating: book.rating),
              SingleChildScrollView(
                padding: EdgeInsets.only(top: 12),
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: book.category.map((c) => CustomChip(label: c)).toList(),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class EditorReviewBox extends StatelessWidget {
  const EditorReviewBox({
    Key key,
    @required this.book,
  }) : super(key: key);

  final Book book;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(defaultPadding),
      margin: EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(defaultPadding / 2),
        color: Colors.black12
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('A word from our editor',
            style: Theme.of(context).textTheme.headline6,
          ),
          SizedBox(height: defaultPadding / 3),
          Text.rich(
            TextSpan(
              text: 'So, ${book.title}: 200 pages in the company of the overprivileged, morally vacuous sons and daughters of neglectful Hollywood royalty in the cocaine-addicted 1984...',
              style: Theme.of(context).textTheme.bodyText1,
              children: [
                TextSpan(
                  text: ' read more',
                  style: TextStyle(color: Theme.of(context).accentColor)
                )
              ] 
            )
          ),
          SizedBox(height: defaultPadding / 2),
          Row(
            children: [
              CircleAvatar(
                minRadius: defaultPadding + 5,
                backgroundImage: NetworkImage('https://randomuser.me/api/portraits/women/17.jpg'),
              ),
              SizedBox(width: defaultPadding / 2),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Alex Williams'),
                  Text('Member since April 2017', style: Theme.of(context).textTheme.caption,)
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}

class CustomChip extends StatelessWidget {
  const CustomChip({
    Key key, @required this.label,
  }) : super(key: key);

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 6),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
          border: Border.all(
              color: Theme.of(context).textTheme.caption.color, width: 0.8),
          borderRadius: BorderRadius.circular(8)),
      child: Text(
        label,
        style: Theme.of(context).textTheme.caption,
      ),
    );
  }
}
