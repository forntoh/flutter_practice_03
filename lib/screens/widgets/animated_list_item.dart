import 'package:flutter/material.dart';

class AnimatedListItem extends StatefulWidget {
  const AnimatedListItem(
    this.index, {
    Key key,
    @required this.child,
    @required this.itemCount,
    this.delay = 100, this.duration = 300,
  }) : super(key: key);

  final Widget child;
  final int delay;
  final int duration;
  final int index;
  final int itemCount;

  @override
  _AnimatedListItemState createState() => _AnimatedListItemState(delay, duration, child, itemCount);
}

class _AnimatedListItemState extends State<AnimatedListItem> {
  _AnimatedListItemState(this.delay, this.duration, this.child, this.itemCount);

  final Widget child;
  final int delay;
  final int duration;
  final int itemCount;

  bool _animate = false;
  bool _isStart = true;

  @override
  void initState() {
    super.initState();
    _isStart
        ? Future.delayed(Duration(milliseconds: (widget.index + 1) * delay),
            () {
            setState(() {
              _animate = true;
              _isStart = false;
            });
          })
        : _animate = true;
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedPadding(
      curve: Curves.decelerate,
      duration: Duration(milliseconds: duration),
      padding: EdgeInsets.only(left: _animate ? 0 : 60),
      child: child,
    );
  }
}
