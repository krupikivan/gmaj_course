import 'cuenta.dart';

void main() {
  String nombre;
  String numero;
  double tipo;
  double saldo;

  //se crea objeto cuenta1 sin parámetros
  //se ejecuta el constructor por defecto
  Cuenta cuenta1 = Cuenta();

  nombre = 'Jaime';
  numero = '1234567';
  tipo = 2.5;
  saldo = 200;
  print("Nombre: $nombre");
  print("Número de cuenta: $numero");
  print("Tipo de interes: $tipo");
  print("Saldo: $saldo");

  cuenta1.setNombre(nombre);
  cuenta1.setNumeroCuenta(numero);
  cuenta1.setTipoInteres(tipo);
  cuenta1.setSaldo(saldo);

  //se crea el objeto cuenta2 con los valores leidos por teclado
  //se ejecuta el constructor con parámetros
  Cuenta cuenta2 =
      Cuenta.datos("Juan Ferrández Rubio", "1234567890", 1.75, 300);

  //se crea cuenta3 como copia de cuenta1
  //se ejecuta el constructor copia
  Cuenta cuenta3 = Cuenta.copia(cuenta1);

  //mostrar los datos de cuenta1
  print("---------------------------------");
  print("Datos de la cuenta 1");
  print("Nombre del titular: " + cuenta1.getNombre());
  print("Número de cuenta: " + cuenta1.getNumeroCuenta());
  print("Tipo de interés: " + cuenta1.getTipoInteres().toString());
  print("Saldo: " + cuenta1.getSaldo().toString());
  print("---------------------------------");

  //se realiza un ingreso en cuenta1
  cuenta1.ingreso(50);
  //mostrar el saldo de cuenta1 después del ingreso
  print("Nuevo saldo: " + cuenta1.getSaldo().toString());
  print("---------------------------------");

  //mostrar los datos de cuenta2
  print("Datos de la cuenta 2");
  print("Nombre del titular: " + cuenta2.getNombre());
  print("Número de cuenta: " + cuenta2.getNumeroCuenta());
  print("Tipo de interés: " + cuenta2.getTipoInteres().toString());
  print("Saldo: " + cuenta2.getSaldo().toString());
  print("---------------------------------");

  //mostrar los datos de cuenta3
  print("Datos de la cuenta 3");
  print("Nombre del titular: " + cuenta3.getNombre());
  print("Número de cuenta: " + cuenta3.getNumeroCuenta());
  print("Tipo de interés: " + cuenta3.getTipoInteres().toString());
  print("Saldo: " + cuenta3.getSaldo().toString());
  print("---------------------------------");

  //realizar una transferencia de $100 desde cuenta3 a cuenta2
  cuenta3.transferencia(cuenta2, 100);
  //realizar una transferencia de $100 desde cuenta3 a cuenta2
  cuenta2.transferencia(cuenta3, 1000);
  print("---------------------------------");

  //mostrar el saldo de cuenta2
  print("Saldo de la cuenta 2");
  print("Saldo: " + cuenta2.getSaldo().toString());

  //mostrar el saldo de cuenta3
  print("Saldo de la cuenta 3");
  print("Saldo: " + cuenta3.getSaldo().toString());
}
