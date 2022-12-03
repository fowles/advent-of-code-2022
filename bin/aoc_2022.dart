import 'package:format/format.dart';
import 'dart:io';

import 'package:aoc_2022/day01.dart' as day01;
import 'package:aoc_2022/day02.dart' as day02;

void main(List<String> args) async {
  var days = [ 
    day01.solve,
    day02.solve,
  ];
  var pos = args.length > 0 ? int.parse(args[0]) : days.length;
  var file = "problems/day{:02d}.txt".format(pos);
  var p = await File(file).readAsString();

  days[pos - 1](p.trim());
}
