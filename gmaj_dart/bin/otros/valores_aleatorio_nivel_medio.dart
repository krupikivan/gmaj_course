import 'dart:math';

void main() {
  int random = Random().nextInt(500);
  for (int i = 1; i < random; i++) {
    if ((random % 5 == 0 || random % 4 == 0) && random > 20 && random < 100) {
      print(random);
    }
  }
}
