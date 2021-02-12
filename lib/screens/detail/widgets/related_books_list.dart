import 'package:flutter/material.dart';
import 'package:flutter_practice_03/model/book.dart';
import 'package:flutter_practice_03/screens/widgets/animated_list_item.dart';
import 'package:flutter_practice_03/screens/widgets/book_cover.dart';

import '../../../constants.dart';
import '../detail_screen.dart';

class RelatedBooksList extends StatefulWidget {
  const RelatedBooksList({
    Key key,
    @required this.book,
  }) : super(key: key);

  final Book book;

  @override
  _RelatedBooksListState createState() => _RelatedBooksListState();
}

class _RelatedBooksListState extends State<RelatedBooksList> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      clipBehavior: Clip.none,
      padding: const EdgeInsets.fromLTRB(defaultPadding, 0, defaultPadding,
          bottomAppBarHeight + defaultPadding),
      scrollDirection: Axis.horizontal,
      child: widget.book.books.isEmpty
          ? SizedBox(height: 100)
          : Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: widget.book.books
                  .asMap()
                  .entries
                  .map((e) => AnimatedListItem(e.key,
                    itemCount: widget.book.books.length,
                    child: Row(
                      children: [
                        BookCover(
                          book: e.value,
                          width: 120,
                          onTap: (b) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DetailScreen(book: e.value)),
                            );
                          },
                        ),
                        if (e.key != widget.book.books.length - 1)
                          SizedBox(width: defaultPadding / 2)
                      ],
                    ),
                  ))
                  .toList(),
            ),
    );
  }
}