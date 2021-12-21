import 'controlador.dart';
import 'ticket.dart';

void main() async {
  print('Aca comienza el programa');

  Ticket miPrimerPasaje = Ticket(
    nombre: 'Shimon',
    estado: 'Pendiente de pago',
    mes: 'Abril',
    year: 2022,
  );
  miPrimerPasaje.pagar(230000);
  miPrimerPasaje.cambiarEstadoDelTicket('Pagado');

  miPrimerPasaje.mostrarDatosDelTicket();

  Controlador controlador = Controlador();

  double blue = await controlador.getDolarBlue('blue');
  double ccl = await controlador.getDolarBlue('solidario');

  double costoEnDolaresBlue = miPrimerPasaje.costo / blue;
  double costoEnDolaresCcl = miPrimerPasaje.costo / ccl;

  String blue2 = costoEnDolaresBlue.toStringAsFixed(2);
  String ccl2 = costoEnDolaresCcl.toStringAsFixed(2);

  print("El costo en blue es: \$ $blue2");
  print("El costo en ccl es: \$ $ccl2");
}
