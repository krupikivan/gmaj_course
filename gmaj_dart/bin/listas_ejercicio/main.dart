void main() {
  List numeros = [23, 30, 50];

// Primera parte: Indice arranca en 0
// Segunda parte: Hasta donde recorro la lista (Hasta que indice sea menor a 3)
// Tercera parte: Cuanto le sumo al indice (Le sumo 1)

  for (int num in numeros) {
    print(num);
  }

  for (int indice = 0; indice < 3; indice++) {
    print("El indice vale: $indice");
    print("El valor del casillero vale: ${numeros[indice]}");
  }
}
