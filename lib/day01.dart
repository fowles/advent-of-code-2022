int sum(int a, int b) {
  return a + b;
}

void solve(String raw) {
  List<List<int>> elves = raw
      .split("\n\n")
      .map(
        (elf) => elf.split("\n").map(int.parse).toList()
      ).toList();
  var s = elves.map((elf) => elf.reduce(sum)).toList();
  s.sort();
  print(part1(s));
  print(part2(s));
}

int part1(List<int> elves) {
  return elves.last;
}

int part2(List<int> elves) {
  return elves.reversed.take(3).reduce(sum);
}

