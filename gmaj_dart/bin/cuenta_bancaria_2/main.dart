import 'cuenta.dart';

main() {
  Cuenta cuenta1 = Cuenta(
    'Matias',
    '23401',
    45000,
  );

  String saldoConPorcentaje = cuenta1.devolverElCincuentaPorcientoDelSaldo();

  print(saldoConPorcentaje);
}
