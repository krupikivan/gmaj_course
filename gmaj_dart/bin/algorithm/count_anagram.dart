void main() {
  String input = "a c b c run urn urn";

  List<String> list = input.split(" ");
  List<String> list1 = [];
  list.removeWhere((e) => e.length == 1);
  list.forEach((e) => list1.add((e.split('')..sort()).join('')));

  int count = list1.toSet().toList().length;

  print(count);
}
