import 'package:flutter/material.dart';
import 'package:flutter_practice_03/model/book.dart';

class BookItemWidget extends StatelessWidget {
  const BookItemWidget({
    Key key, @required this.book,
  }) : super(key: key);

  final Book book;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              width: MediaQuery.of(context).size.width * .75,
              child: Placeholder(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Row(
              children: [
                Column(
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
                Spacer(),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: List.generate(5, (index) {
                    return Icon(
                      index < book.rating
                          ? Icons.star
                          : Icons.star_border,
                    );
                  }),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}