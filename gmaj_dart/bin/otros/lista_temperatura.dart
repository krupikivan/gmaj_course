// Este es el metodo principal MAIN
void main() {
  List<double> listadoTemperatura = [15, 25, 32, 14.5, 22.3, 28.4, 12];
  double laMenorTemperatura = dameLaMenorTemperatura(listadoTemperatura);
  print("La menor temperatura encontrada es: $laMenorTemperatura");
}

// Este es un metodo
dameLaMenorTemperatura(List<double> listadoTemperatura) {
  double menorTemperatura = listadoTemperatura[0];
  for (int i = 0; i < listadoTemperatura.length; i++) {
    if (listadoTemperatura[i] < menorTemperatura) {
      // Asignarle a menorTemperatura su nueva menor temperatura
      menorTemperatura = listadoTemperatura[i];
    }
  }
  return menorTemperatura;
}
