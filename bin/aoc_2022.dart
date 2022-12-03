import 'package:format/format.dart';
import 'dart:io';

import 'package:aoc_2022/day01.dart' as day01;

void main(List<String> args) async {
  var days = [ day01.solve ];
  var pos = args.length > 0 ? int.parse(args[0]) : days.length - 1;
  var file = "problems/day{:02d}.txt".format(pos + 1);
  var p = await File(file).readAsString();

  days[pos](p.trim());
}
