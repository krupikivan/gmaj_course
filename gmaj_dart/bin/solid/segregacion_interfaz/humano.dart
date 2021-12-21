import 'corador.dart';
import 'durmiente.dart';
import 'trabajador.dart';

class Humano implements Trabajador, Durmiente, Cobrador {
  void trabajar() => print("Hago mucho trabajo");
  void dormir() => print("Duermo 10 hs por dia");
  void cobrar() {}
}
