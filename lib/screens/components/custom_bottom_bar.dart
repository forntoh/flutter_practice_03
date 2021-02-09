import 'package:flutter/material.dart';
import 'package:flutter_practice_03/theme/colors.dart';

import '../../constants.dart';

class CustomAppBarItem {
  IconData icon;

  CustomAppBarItem({this.icon});
}

class CustomBottomAppBar extends StatefulWidget {
  final ValueChanged<int> onTabSelected;
  final List<CustomAppBarItem> items;
  static const double height = 62;

  CustomBottomAppBar({Key key, this.onTabSelected, this.items}) {
    assert(this.items.length % 2 == 0);
  }

  @override
  _CustomBottomAppBarState createState() => _CustomBottomAppBarState();
}

class _CustomBottomAppBarState extends State<CustomBottomAppBar> {
  int _selectedIndex = 0;

  void _updateIndex(int index) {
    widget.onTabSelected(index);
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget _buildTabIcon(
      {int index, CustomAppBarItem item, ValueChanged<int> onPressed}) {
    return Expanded(
        child: SizedBox(
            height: 60,
            child: Material(
              type: MaterialType.transparency,
              child: InkWell(
                onTap: () => onPressed(index),
                child: Icon(
                  item.icon,
                  color: _selectedIndex == index ? Theme.of(context).accentColor : Colors.white54,
                  size: 24,
                ),
              ),
            )));
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> items = List.generate(
        widget.items.length,
        (index) => _buildTabIcon(
              index: index,
              item: widget.items[index],
              onPressed: _updateIndex,
            ));
    return Container(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: defaultPadding / 2),
        height: CustomBottomAppBar.height,
        decoration: BoxDecoration(
          color: Colors.white12,
          boxShadow: [BoxShadow(
            color: Colors.black12,
            offset: Offset(0, 2),
            blurRadius: 8,
            spreadRadius: 5
          )]
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: items,
        ),
      ),
    );
  }
}
