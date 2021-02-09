import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_practice_03/data/data.dart';
import 'package:flutter_practice_03/model/book.dart';
import 'package:flutter_practice_03/theme/colors.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../constants.dart';
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
  final ItemScrollController itemScrollController = ItemScrollController();

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
                itemScrollController.scrollTo(
                  index: page.round(),
                  duration: Duration(milliseconds: 200),
                  curve: Curves.linear
                );
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

  GlobalKey _selectedTab = GlobalKey();

  Widget buildTabHeading(List<Book> items) {
    var selectedWidth = 70.0;
    if (_selectedTab.currentContext != null) {
      final RenderBox renderBoxRed = _selectedTab.currentContext.findRenderObject();
      selectedWidth = renderBoxRed.size.width;
    }
    return SizedBox(
      height: 24,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ScrollablePositionedList.builder(
              itemCount: items.length + 1,
              itemScrollController: itemScrollController,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Container(
                    margin: EdgeInsets.only(left: defaultPadding),
                    child: index == items.length ? SizedBox(width: MediaQuery.of(context).size.width) :
                      Opacity(
                        opacity: currentPage == index ? 1 : miniScale,
                        child: Text(
                          items[index].month,
                          key: currentPage == index ? _selectedTab : null,
                        ),
                    )
                );
              },
            ),
          ),
          AnimatedContainer(
            duration: Duration(milliseconds: 400),
            margin: EdgeInsets.symmetric(horizontal: defaultPadding),
            height: 2,
            width: selectedWidth,
            decoration: BoxDecoration(
              color: CustomColors.taxi_yellow,
              borderRadius: BorderRadius.circular(2),
            ),
          )
        ],
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
      right: defaultPadding * (1 - newProgress),
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
          leading: Padding(
            padding: const EdgeInsets.only(left: defaultPadding),
            child: Icon(CupertinoIcons.bars),
          ),
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
                  margin: EdgeInsets.symmetric(horizontal: defaultPadding),
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
