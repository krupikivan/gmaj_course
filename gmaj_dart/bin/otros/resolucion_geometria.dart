void main() {
  double lado = 30;
  double altura = 20.5;
  double baseMenor = 13.5;
  double base = 17;
  double baseMayor = 23.2;

  double areaTriangulo = calcularAreaTraingulo(base, altura);
  double areaCuadrado = calcularAreaCuadrado(lado);
  double areaRectangulo = calcularAreaRectangulo(base, altura);
  double areaTrapecio = calcularAreaTrapecio(baseMenor, baseMayor, altura);

  double areaTotal =
      areaTriangulo + areaCuadrado + areaRectangulo + areaTrapecio;

  print("El area total de la superficie es: $areaTotal");
}

calcularAreaTrapecio(double baseMenor, double baseMayor, double altura) {
  double area = ((baseMenor + baseMayor) / 2) * altura;
  return area;
}

calcularAreaRectangulo(double base, double altura) {
  double area = base * altura;
  return area;
}

calcularAreaTraingulo(double base, double altura) {
  double area = (base * altura) / 2;
  return area;
}

calcularAreaCuadrado(double lado) {
  double area = lado * lado;
  return area;
}
