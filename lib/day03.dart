void solve(String raw) {
  List<String> sacks = raw.split("\n");
  print(part1(sacks));
  print(part2(sacks));
}

int priority(int c) {
  if (c <= 90) {
    return c - 65 + 27;
  } else {
    return c - 97 + 1;
  }
}

int part1(List<String> sacks) {
  int score = 0;
  for (var s in sacks) {
    var c = Set.from(s.substring(0, s.length ~/ 2).codeUnits);
    c = c.intersection(Set.from(s.substring(s.length ~/ 2).codeUnits));
    score += priority(c.first);
  }
  return score;
}

int part2(List<String> sacks) {
  int score = 0;
  for (var i = 0; i < sacks.length; i += 3) {
    var c = Set.from(sacks[i].codeUnits);
    c = c.intersection(Set.from(sacks[i+1].codeUnits));
    c = c.intersection(Set.from(sacks[i+2].codeUnits));
    score += priority(c.first);
  }
  return score;
}

