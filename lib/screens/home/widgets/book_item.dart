import 'package:flutter/material.dart';
import 'package:flutter_practice_03/model/book.dart';
import 'package:flutter_practice_03/screens/widgets/book_cover.dart';

import '../../../constants.dart';

class BookItemWidget extends StatelessWidget {
  const BookItemWidget({
    Key key,
    @required this.book,
    @required this.scale,
    @required this.width,
  }) : super(key: key);

  final Book book;
  final double scale;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(defaultPadding, defaultPadding, 0, defaultPadding),
      child: Opacity(
        opacity: scale,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BookCover(scale: scale, width: width, book: book),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: defaultPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    book.title,
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Text(
                    book.author,
                    style: Theme.of(context).textTheme.caption,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}