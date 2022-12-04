class Range {
  int min = 0;
  int max = 0;

  Range.parse(String s) {
    var v = s.split("-");
    this.min = int.parse(v[0]);
    this.max = int.parse(v[1]);
  }

  bool contains(Range r) {
    return this.min <= r.min && r.max <= this.max;
  }
  bool overlaps(Range r) {
    return 
      this.min <= r.min && r.min <= this.max ||
      this.min <= r.max && r.max <= this.max ||
      r.contains(this);
  }
}

List<Range> parsePairing(String s) {
  var v = s.split(",");
  return [Range.parse(v[0]), Range.parse(v[1])];
}

void solve(String raw) {
  List<List<Range>> pairs = raw.split("\n").map(parsePairing).toList();
  print(part1(pairs));
  print(part2(pairs));
}

int part1(List<List<Range>> pairings) {
  int score = 0;
  for (var p in pairings) {
     if (p[0].contains(p[1]) || p[1].contains(p[0])) {
       ++score;
     }
  }
  return score;
}

int part2(List<List<Range>> pairings) {
  int score = 0;
  for (var p in pairings) {
     if (p[0].overlaps(p[1])) {
       ++score;
     }
  }
  return score;
}

