import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_practice_03/theme/colors.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 8,
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
            )
          ),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: Text("Your books", style: Theme.of(context).textTheme.headline4,),
                ),
                SizedBox(height: 16,),
                Container(
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
                      tabs: [
                        Tab(text: 'This month'),
                        Tab(text: 'October',),
                        Tab(text: 'September',),
                        Tab(text: 'August',),
                        Tab(text: 'July',),
                        Tab(text: 'June',),
                        Tab(text: 'May',),
                        Tab(text: 'April',),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: TabBarView(
                    children: [
                      Icon(Icons.directions_car),
                      Icon(Icons.directions_transit),
                      Icon(Icons.directions_bike),
                      Icon(Icons.directions_bike),
                      Icon(Icons.directions_bike),
                      Icon(Icons.directions_bike),
                      Icon(Icons.directions_bike),
                      Icon(Icons.directions_bike),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}