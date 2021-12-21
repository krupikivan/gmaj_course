void main() {
  int multiploDeTres = 0;
  int multiploDeCinco = 0;
  int otrosMultiplos = 0;
  for (int i = 1; i < 500; i++) {
    if (i % 3 == 0 && i < 50) {
      multiploDeTres++;
    } else if (i % 5 == 0 && i < 150) {
      multiploDeCinco++;
    } else {
      otrosMultiplos++;
    }
  }

  print(
      "La cantidad de numeros multiplos de 3 y menores a 50 fueron: $multiploDeTres");
  print(
      "La cantidad de numeros multiplos de 5 y menores a 150 fueron: $multiploDeCinco");
  print("Los demas numeros fueron: $otrosMultiplos");
}
