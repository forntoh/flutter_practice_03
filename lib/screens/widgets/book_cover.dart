import 'package:flutter/material.dart';
import 'package:flutter_practice_03/model/book.dart';

class BookCover extends StatelessWidget {
  const BookCover({
    Key key,
    this.scale = 1,
    @required this.width,
    @required this.book,
    this.onTap,
  }) : super(key: key);

  final double scale;
  final double width;
  final Book book;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: book.coverArt,
      child: GestureDetector(
        onTap: () {
          if (onTap != null) onTap(book);
        },
        child: Container(
          width: scale * width,
          child: AspectRatio(
            aspectRatio: 9 / 14,
          ),
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    blurRadius: 12,
                    offset: Offset(5, 2),
                    color: Colors.black.withOpacity(0.4))
              ],
              borderRadius: BorderRadius.circular(5),
              image: DecorationImage(
                  fit: BoxFit.cover, image: NetworkImage(book.coverArt))),
        ),
      ),
    );
  }
}
