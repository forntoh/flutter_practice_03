import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_practice_03/data/data.dart';
import 'package:flutter_practice_03/model/book.dart';
import 'package:flutter_practice_03/theme/colors.dart';

import 'home/widgets/book_item.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentPage = 0;
  double miniScale = 0.5;
  double page = 0;
  PageController pageController;
  double viewPortFraction = 0.8;

  @override
  void initState() {
    pageController = PageController(
        initialPage: currentPage, viewportFraction: viewPortFraction);
    super.initState();
  }

  Expanded buildTabContent(context, List<Book> books) {
    var itemWidth = MediaQuery.of(context).size.width * viewPortFraction;
    var xOffset =
        (MediaQuery.of(context).size.width * (viewPortFraction - 1)) / 2;
    return Expanded(
      child: Transform.translate(
        offset: Offset(xOffset, 0),
        child: NotificationListener<ScrollNotification>(
          onNotification: (ScrollNotification notification) {
            if (notification is ScrollUpdateNotification) {
              setState(() {
                page = pageController.page;
              });
            }
            return true;
          },
          child: PageView.builder(
            clipBehavior: Clip.none,
            allowImplicitScrolling: true,
            onPageChanged: (pos) {
              setState(() {
                currentPage = pos;
              });
            },
            itemCount: books.length,
            controller: pageController,
            itemBuilder: (context, index) {
              var scale = miniScale;
              var diff = index - page;

              if (diff < 0)
                scale = 1;
              else if (diff >= 0 && diff <= 1)
                scale = ((1 - diff.abs()) * miniScale) + miniScale;

              return BookItemWidget(
                  book: books[index], scale: scale, width: itemWidth);
            },
          ),
        ),
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
              borderSide:
                  const BorderSide(width: 2, color: CustomColors.taxi_yellow),
            ),
            labelPadding: EdgeInsets.symmetric(horizontal: 12),
            tabs: items.map((b) => Tab(text: b.month)).toList()),
      ),
    );
  }

  Widget buildRatingInfo() {
    var oldProgres = page % 1;
    var newProgress = 1.0;

    const double LOWER_MAX = 0.3;
    const double HIGHER_MIN = 0.7;

    if (oldProgres >= 0 && oldProgres <= LOWER_MAX)
      newProgress = oldProgres / LOWER_MAX;
    else if (oldProgres >= HIGHER_MIN && oldProgres <= 1)
      newProgress = 1 - ((oldProgres - HIGHER_MIN) / LOWER_MAX);

    return Positioned(
      bottom: 90,
      right: 20 * (1 - newProgress),
      child: Opacity(
        opacity: 1 - newProgress,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: List.generate(5, (index) {
            return Icon(
              index < books[currentPage].rating
                  ? Icons.star
                  : Icons.star_border,
              color: CustomColors.taxi_yellow,
            );
          }),
        ),
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
                Expanded(
                  child: Stack(children: [
                    buildTabContent(context, books),
                    buildRatingInfo(),
                  ]),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
