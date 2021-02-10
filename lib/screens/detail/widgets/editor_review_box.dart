import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_practice_03/model/book.dart';

import '../../../constants.dart';

class EditorReviewBox extends StatelessWidget {
  const EditorReviewBox({
    Key key,
    @required this.book,
  }) : super(key: key);

  final Book book;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(defaultPadding),
      margin: EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(defaultPadding / 2),
        color: Colors.black12
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('A word from our editor',
            style: Theme.of(context).textTheme.headline6,
          ),
          SizedBox(height: defaultPadding / 3),
          Text.rich(
            TextSpan(
              text: 'So, ${book.title}: 200 pages in the company of the overprivileged, morally vacuous sons and daughters of neglectful Hollywood royalty in the cocaine-addicted 1984...',
              style: Theme.of(context).textTheme.bodyText1,
              children: [
                TextSpan(
                  text: ' read more',
                  style: TextStyle(color: Theme.of(context).accentColor)
                )
              ] 
            )
          ),
          SizedBox(height: defaultPadding / 2),
          Row(
            children: [
              CircleAvatar(
                minRadius: defaultPadding + 5,
                backgroundColor: Theme.of(context).primaryColor.withOpacity(0.5),
                backgroundImage: NetworkImage('https://randomuser.me/api/portraits/women/${Random().nextInt(90) + 10}.jpg'),
              ),
              SizedBox(width: defaultPadding / 2),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Alex Williams'),
                  Text('Member since April 2017', style: Theme.of(context).textTheme.caption,)
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}