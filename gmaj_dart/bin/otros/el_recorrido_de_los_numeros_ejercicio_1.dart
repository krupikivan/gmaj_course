void main() {
  int count = 0;
  int cant = 0;
  for (int i = 1; i < 100; i++) {
    if (i % 10 == 0) {
      count += i;
      cant++;
    }
  }
  print("El contador dio $count y se sumo $cant veces");
}
