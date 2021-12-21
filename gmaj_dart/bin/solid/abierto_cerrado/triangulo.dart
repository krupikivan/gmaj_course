import 'figura.dart';

class Triangulo extends Figura {
  Triangulo({
    base,
    altura,
  }) : super(
          base: base,
          altura: altura,
        );

  @override
  double calcularArea() {
    return base * altura / 2;
  }
}
