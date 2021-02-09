import 'dart:ffi';

const double defaultPadding = 24;
const double appBarHeight = 80;
const double bottomAppBarHeight = 60;

double mapToRange(
    double value, double start, double end, double oldStart, double oldEnd) {
  var oldRange = (oldEnd - oldStart);
  var newRange = (end - start);
  return (((value - oldStart) * newRange) / oldRange) + start;
}
