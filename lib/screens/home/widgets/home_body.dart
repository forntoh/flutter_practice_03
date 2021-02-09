import 'package:flutter/material.dart';
import 'package:flutter_practice_03/data/data.dart';
import 'package:flutter_practice_03/model/book.dart';
import 'package:flutter_practice_03/theme/colors.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../../../constants.dart';
import 'book_item.dart';

class HomeBody extends StatefulWidget {
  @override
  _HomeBodyState createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  final ItemScrollController itemScrollController = ItemScrollController();
  final double miniScale = 0.5;
  final GlobalKey selectedTab = GlobalKey();
  final double viewPortFraction = 0.75;

  int _currentPage = 0;
  double _page = 0;
  PageController _pageController;

  @override
  void initState() {
    _pageController = PageController(
        initialPage: _currentPage, viewportFraction: viewPortFraction);
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
                _page = _pageController.page;
                itemScrollController.scrollTo(
                  index: _page.round(),
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
                _currentPage = pos;
              });
            },
            itemCount: books.length,
            controller: _pageController,
            itemBuilder: (context, index) {
              var scale = miniScale;
              var diff = index - _page;

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
    var selectedWidth = 70.0;
    if (selectedTab.currentContext != null) {
      final RenderBox renderBoxRed = selectedTab.currentContext.findRenderObject();
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
                        opacity: _currentPage == index ? 1 : miniScale,
                        child: Text(
                          items[index].month,
                          key: _currentPage == index ? selectedTab : null,
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
    var oldProgres = _page % 1;
    var newProgress = 1.0;

    const double LOWER_MAX = 0.3;
    const double HIGHER_MIN = 0.7;

    if (oldProgres >= 0 && oldProgres <= LOWER_MAX)
      newProgress = oldProgres / LOWER_MAX;
    else if (oldProgres >= HIGHER_MIN && oldProgres <= 1)
      newProgress = 1 - ((oldProgres - HIGHER_MIN) / LOWER_MAX);

    return Positioned(
      bottom: bottomAppBarHeight + (defaultPadding * 2),
      right: defaultPadding * (1 - newProgress),
      child: Opacity(
        opacity: 1 - newProgress,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: List.generate(5, (index) {
            return Icon(
              index < books[_currentPage].rating
                  ? Icons.star
                  : Icons.star_border,
              color: CustomColors.taxi_yellow,
              size: 18,
            );
          }),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
          gradient: LinearGradient(
        begin: Alignment.centerRight,
        end: Alignment.centerLeft,
        colors: [CustomColors.violet_darker, CustomColors.violet],
      )),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: appBarHeight),
          Container(
            margin: EdgeInsets.symmetric(horizontal: defaultPadding),
            child: Text(
              "Your books",
              style: Theme.of(context).textTheme.headline3,
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
    );
  }
}
