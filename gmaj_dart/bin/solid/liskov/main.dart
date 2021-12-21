import 'cuadrado.dart';
import 'rectangulo.dart';

void main() {
  final Rectangulo cuadrado1 = Cuadrado(largo: 5);

  // Ahora tenemos un cuadrado con diferentes lados?????
  cuadrado1.base = 4;
  cuadrado1.altura = 8;
}


// Solucion? Separar el cuadrado y rectangulo en diferentes 
// clases y hacer dependiente de Figura
