class Cuenta {
  final String _nombreTitular;
  final String _numeroCuenta;
  double _saldoEnCuenta;

  Cuenta(this._nombreTitular, this._numeroCuenta, this._saldoEnCuenta);

  String get nombreTitular => _nombreTitular;

  String get numeroCuenta {
    return _numeroCuenta;
  }

  double get saldoEnCuenta {
    return _saldoEnCuenta;
  }

  double get diezPorcientoEnSaldo {
    return _saldoEnCuenta * 0.1;
  }

  cargarSaldo(double nuevoSaldo) {
    if (nuevoSaldo > 0) {
      this._saldoEnCuenta += nuevoSaldo;
    }
  }

  String devolverElCincuentaPorcientoDelSaldo() =>
      "El 50% es: ${this._saldoEnCuenta * 0.5}";

  guardarEnBaseDeDatosElCostoTotalDeLaCompra() {
    // Calcular el historial
    // Guardar en base de datos
  }

  mostrarDetalleCompletoDeLaCuenta() {
    print('---------------------');
    print('Nombre del Titular: ${this._nombreTitular}');
    print('Numero de Cuenta: ${this._numeroCuenta}');
    print('Saldo en Cuenta: ${this._saldoEnCuenta}');
    print('---------------------');
  }
}
