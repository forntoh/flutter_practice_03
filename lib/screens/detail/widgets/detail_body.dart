import 'package:flutter/material.dart';
import 'package:flutter_practice_03/model/book.dart';
import 'package:flutter_practice_03/theme/colors.dart';

import '../../../constants.dart';
import 'book_info_box.dart';
import 'editor_review_box.dart';
import 'related_books_list.dart';

class DetailsScreenBody extends StatelessWidget {
  const DetailsScreenBody({
    Key key,
    @required this.book,
  }) : super(key: key);

  final Book book;

  @override
  Widget build(BuildContext context) {
    return Container(
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
              child: Text(
                'More from ${book.author}',
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            RelatedBooksList(book: book),
          ],
        ),
      ),
    );
  }
}