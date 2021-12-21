import 'persona.dart';

class Conductor extends Persona {
  Conductor({
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
