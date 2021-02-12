import 'package:flutter/material.dart';
import 'package:flutter_practice_03/model/book.dart';
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
                  .map((e) => AnimatedBookItem(e.key, book: e.value))
                  .toList(),
            ),
    );
  }
}

class AnimatedBookItem extends StatefulWidget {
  const AnimatedBookItem(
    this.index, {
    Key key,
    this.book,
  }) : super(key: key);

  final int index;
  final Book book;

  @override
  _AnimatedBookItemState createState() => _AnimatedBookItemState();
}

class _AnimatedBookItemState extends State<AnimatedBookItem> {
  bool _animate = false;

  bool _isStart = true;

  @override
  void initState() {
    super.initState();
    _isStart
        ? Future.delayed(Duration(milliseconds: (widget.index + 1) * 100), () {
            setState(() {
              _animate = true;
              _isStart = false;
            });
          })
        : _animate = true;
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedPadding(
      curve: Curves.decelerate,
      duration: Duration(milliseconds: 300),
      padding: EdgeInsets.only(left: _animate ? 0 : 60),
      child: Row(
        children: [
          BookCover(
            book: widget.book,
            width: 120,
            onTap: (b) {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => DetailScreen(book: widget.book)),
              );
            },
          ),
          if (widget.index != widget.book.books.length - 1)
            SizedBox(width: defaultPadding / 2)
        ],
      ),
    );
  }
}
