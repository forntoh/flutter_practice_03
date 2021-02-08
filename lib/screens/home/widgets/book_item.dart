import 'package:flutter/material.dart';
import 'package:flutter_practice_03/model/book.dart';

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
      padding: const EdgeInsets.fromLTRB(20, 20, 0, 20),
      child: Opacity(
        opacity: scale,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: scale * width,
              child: AspectRatio(
                aspectRatio: 9 / 14,
              ),
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 12,
                        offset: Offset(5, 2),
                        color: Colors.black.withAlpha(60))
                  ],
                  borderRadius: BorderRadius.circular(5),
                  image: DecorationImage(
                      fit: BoxFit.cover, image: NetworkImage(book.coverArt))),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
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
