void solve(String raw) {
  List<String> rounds = raw.split("\n");
  print(part1(rounds));
  print(part2(rounds));
}

int part1(List<String> rounds) {
  var scores = {
    'A X' : 1 + 3,
    'B X' : 1 + 0,
    'C X' : 1 + 6,
    'A Y' : 2 + 6,
    'B Y' : 2 + 3,
    'C Y' : 2 + 0,
    'A Z' : 3 + 0,
    'B Z' : 3 + 6,
    'C Z' : 3 + 3,
  };
  var score = 0;
  for (var r in rounds) {
    score += scores[r]!;
  }
  return score;
}

int part2(List<String> rounds) {
  var scores = {
    'A X' : 3 + 0,
    'B X' : 1 + 0,
    'C X' : 2 + 0,
    'A Y' : 1 + 3,
    'B Y' : 2 + 3,
    'C Y' : 3 + 3,
    'A Z' : 2 + 6,
    'B Z' : 3 + 6,
    'C Z' : 1 + 6,
  };
  var score = 0;
  for (var r in rounds) {
    score += scores[r]!;
  }
  return score;
}

