import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_practice_03/data/data.dart';
import 'package:flutter_practice_03/model/book.dart';
import 'package:flutter_practice_03/theme/colors.dart';

import 'home/widgets/book_item.dart';

class HomeScreen extends StatelessWidget {

  Expanded buildTabContent(context, List<Book> books) {
    return Expanded(
      child: TabBarView(
        children: books.map((b) => BookItemWidget(book: b)).toList(),
      ),
    );
  }

  Widget buildTabHeading(List<Book> items) {
    return Container(
      height: 24,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: TabBar(
            isScrollable: true,
            indicatorSize: TabBarIndicatorSize.label,
            indicator: UnderlineTabIndicator(
              borderSide: const BorderSide(width: 2, color: CustomColors.taxi_yellow),
            ),
            labelPadding: EdgeInsets.symmetric(horizontal: 12),
            tabs: items.map((b) => Tab(text: b.month)).toList()),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: books.length,
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: Icon(CupertinoIcons.bars),
          toolbarHeight: 80,
        ),
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.centerRight,
            end: Alignment.centerLeft,
            colors: [CustomColors.violet_darker, CustomColors.violet],
          )),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    "Your books",
                    style: Theme.of(context).textTheme.headline4,
                  ),
                ),
                SizedBox(height: 16),
                buildTabHeading(books),
                buildTabContent(context, books),
              ],
            ),
          ),
        ),
      ),
    );
  }
}