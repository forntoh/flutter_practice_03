import 'package:flutter/material.dart';
import 'package:flutter_practice_03/model/book.dart';
import 'package:flutter_practice_03/screens/detail/detail_screen.dart';

class BookCover extends StatelessWidget {
  const BookCover({
    Key key,
    @required this.scale,
    @required this.width,
    @required this.book,
  }) : super(key: key);

  final double scale;
  final double width;
  final Book book;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DetailScreen(book: book)),
        );
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
    );
  }
}
