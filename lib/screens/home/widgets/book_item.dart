import 'package:flutter/material.dart';
import 'package:flutter_practice_03/model/book.dart';
import 'package:flutter_practice_03/theme/colors.dart';

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
          Container(
            width: MediaQuery.of(context).size.width * .70,
            child: AspectRatio(aspectRatio: 9/16,),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  blurRadius: 12,
                  offset: Offset(5, 2),
                  color: Colors.black.withAlpha(60)
                )
              ],
              borderRadius: BorderRadius.circular(5),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(book.coverArt)
              )
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
                          color: CustomColors.taxi_yellow,
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