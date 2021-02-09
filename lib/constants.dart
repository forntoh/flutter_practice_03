import 'dart:ffi';

const double defaultPadding = 24;

double mapToRange(double value, double start, double end, double oldStart, double oldEnd) {
  var oldRange = (oldEnd - oldStart);
  var newRange = (end - start);
  return (((value - oldStart) * newRange) / oldRange) + start;
}
