import 'figura.dart';

class Rectangulo extends Figura {
  Rectangulo({
    base,
    altura,
  }) : super(
          base: base,
          altura: altura,
        );

  @override
  double calcularArea() {
    return base * altura;
  }
}
