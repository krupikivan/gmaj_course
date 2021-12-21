import 'calcular_area.dart';
import 'triangulo.dart';

void main() {
  Triangulo traingulo = Triangulo(altura: 30.0, base: 20.0);

  CalcularArea area = CalcularArea();

  double areaTraingulo = area.calcularArea(traingulo);

  print(areaTraingulo);
}
