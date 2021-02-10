import 'package:flutter/material.dart';
import 'package:flutter_practice_03/model/book.dart';
import 'package:flutter_practice_03/screens/widgets/book_cover.dart';
import 'package:flutter_practice_03/screens/widgets/rating_bar.dart';

import '../../../constants.dart';
import 'custom_chip.dart';

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