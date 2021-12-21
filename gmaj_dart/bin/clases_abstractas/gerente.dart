import 'persona.dart';

class Gerente extends Persona {
  Gerente({
    int legajo,
    String nombre,
    String puesto,
  }) : super(
          legajo: legajo,
          nombre: nombre,
          puesto: puesto,
        );
  @override
  String mostrarDetallePersona() {
    return 'Soy un gerente';
  }
}
