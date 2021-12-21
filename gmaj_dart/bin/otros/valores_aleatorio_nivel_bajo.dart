import 'dart:math';

void main() {
  int random = Random().nextInt(500);

  for (int i = 1; i < random; i++) {
    if (random / 2 == i && random % 2 == 0) {
      print("Se encontro la mitad y es $i");
    }
  }
}
