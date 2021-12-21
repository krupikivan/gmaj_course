void main() {
  String input = "Today, is the greatest day ever";

  List<String> list = input.replaceAll(',', '').split(' ');
  Map<int, int> map = {};

  int max = 0;

  for (int i = 0; i < list.length; i++) {
    map[i] = getGreaterLetterCount(list[i]);
    max = max < map[i] ? map[i] : max;
  }

  map.removeWhere((k, v) => v < max);

  var letter = map.isEmpty ? -1 : list[map.keys.first];
  print(letter);
}

int getGreaterLetterCount(String e) {
  int max = 0;
  Map<String, int> map = {};

  for (int i = 0; i < e.length; i++) {
    map[e[i]] = (map[e[i]] ?? 0) + 1;
    max = max < map[e[i]] ? map[e[i]] : max;
  }
  return max == 1 ? -1 : max;
}
