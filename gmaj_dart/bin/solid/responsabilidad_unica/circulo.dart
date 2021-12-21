import 'figura.dart';

class Circulo extends Figura {
  final double radio;
  double get PI => 3.1415;
  Circulo({
    this.radio,
    base,
    altura,
  }) : super(
          base: base,
          altura: altura,
        );

  @override
  double calcularArea() {
    return radio * radio * PI;
  }
}
