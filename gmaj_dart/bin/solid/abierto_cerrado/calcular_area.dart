import 'triangulo.dart';
import 'figura.dart';
import 'rectangulo.dart';

// Si queremos agregar mas figuras tenemos que modificar este codigo
class CalcularArea {
  double calcularArea(Figura shape) {
    if (shape is Rectangulo) {
      return shape.base * shape.altura;
    } else if (shape is Triangulo) {
      return shape.base * shape.altura / 2;
    } else {
      return 0;
    }
  }
}
