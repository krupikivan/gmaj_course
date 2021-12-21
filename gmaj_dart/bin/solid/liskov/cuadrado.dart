import 'rectangulo.dart';

class Cuadrado extends Rectangulo {
  Cuadrado({
    double largo,
  }) : super(
          altura: largo,
          base: largo,
        );
}
