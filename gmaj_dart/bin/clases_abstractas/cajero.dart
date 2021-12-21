import 'persona.dart';

class Cajero extends Persona {
  Cajero({
    legajo,
    nombre,
    puesto,
  }) : super(
          legajo: legajo,
          nombre: nombre,
          puesto: puesto,
        );

  @override
  String mostrarDetallePersona() {
    return 'Soy un cajero';
  }
}
