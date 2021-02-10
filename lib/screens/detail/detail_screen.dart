import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_practice_03/model/book.dart';
import 'package:flutter_practice_03/screens/widgets/books_app_bar.dart';
import 'package:flutter_practice_03/screens/widgets/books_bottom_nav_bar.dart';

import 'widgets/detail_body.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({Key key, this.book}) : super(key: key);

  final Book book;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      appBar: BooksAppBar(),
      bottomNavigationBar: BooksBottomNavBar(),
      body: DetailsScreenBody(book: book),
    );
  }
}