class Cuenta {
  String nombre;
  String numero;
  double tipo;
  double saldo;

  Cuenta() {}

  Cuenta.datos(String nombre, String numero, double tipo, double saldo) {
    this.nombre = nombre;
    this.numero = numero;
    this.tipo = tipo;
    this.saldo = saldo;
  }

  Cuenta.copia(Cuenta cuenta) {
    this.nombre = cuenta.nombre;
    this.numero = cuenta.numero;
    this.tipo = cuenta.tipo;
    this.saldo = cuenta.saldo;
  }

  getNombre() {
    return this.nombre;
  }

  getNumeroCuenta() {
    return this.numero;
  }

  getTipoInteres() {
    return this.tipo;
  }

  getSaldo() {
    return this.saldo;
  }

  setNombre(String nombre) {
    this.nombre = nombre;
  }

  setNumeroCuenta(String numero) {
    this.numero = numero;
  }

  setTipoInteres(double tipo) {
    this.tipo = tipo;
  }

  setSaldo(double saldo) {
    this.saldo = saldo;
  }

  ingreso(double monto) {
    print(
        'Se esta ingresando en la cuenta numero: ${this.numero} el monto de $monto');
    if (monto > 0) {
      this.saldo += monto;
    }
  }

  transferencia(Cuenta cuenta, double monto) {
    print(
        "Realizando transferencia desde la cuenta numero: ${this.numero} hacia la cuenta numero ${cuenta.numero}");
    if (monto > 0 && this.saldo > monto) {
      cuenta.saldo += monto;
      this.saldo -= monto;
    } else {
      print(
          "No se puede realizar la transferencia de \$$monto, el saldo de la cuenta numero ${this.numero} de \$${this.saldo} es insuficiente");
    }
  }
}
