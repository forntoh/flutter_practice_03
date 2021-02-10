import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_practice_03/theme/colors.dart';

class RatingBar extends StatelessWidget {
  const RatingBar({
    Key key,
    @required this.rating,
  }) : super(key: key);

  final int rating;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 2),
          child: Icon(
            index < rating
                ? CupertinoIcons.star_fill
                : CupertinoIcons.star ,
            color: CustomColors.taxi_yellow,
            size: 18,
          ),
        );
      }),
    );
  }
}