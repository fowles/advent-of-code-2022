class Cmd {
  int num = 0;
  int from = 0;
  int to = 0;

  Cmd.parse(String s) {
    var v = s.split(" ");
    this.num = int.parse(v[1]);
    this.from = int.parse(v[3]) - 1;
    this.to = int.parse(v[5]) - 1;
  }
}

class Stacks {
  List<List<String>> stacks = [];

  Stacks.parse(String s) {
    var l = s.split("\n");
    for (var i = 0; i < 9; ++i) {
      stacks.add([]);
    }
    for (var i = l.length - 2; i >= 0; --i) {
      for (var j = 0; j < 9; ++j) {
        var s = l[i][1 + 4*j];
        if (s != " ") {
          stacks[j].add(s);
        }
      }
    }
  }
}

void solve(String raw) {
  List<String> parts = raw.split("\n\n");
  var c = parts[1].split("\n").map(Cmd.parse).toList();
  print(part1(Stacks.parse(parts[0]), c));
  print(part2(Stacks.parse(parts[0]), c));
}

String part1(Stacks s, List<Cmd> cmds) {
  for (var c in cmds) {
    for (var i = 0; i < c.num; ++i) {
      String t = s.stacks[c.from].last;
      s.stacks[c.from].removeLast();
      s.stacks[c.to].add(t);
    }
  }
  String res = "";
  for (var stack in s.stacks) {
    res += stack.last;
  }
  return res;
}

String part2(Stacks s, List<Cmd> cmds) {
  for (var c in cmds) {
    int start = s.stacks[c.from].length - c.num;
    int end = s.stacks[c.from].length;
    s.stacks[c.to].addAll(s.stacks[c.from].sublist(start, end));
    s.stacks[c.from].removeRange(start, end);
  }
  String res = "";
  for (var stack in s.stacks) {
    res += stack.last;
  }
  return res;
}

