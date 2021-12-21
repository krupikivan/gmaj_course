abstract class Persona {
  final int legajo;
  final String nombre;
  final String puesto;

  Persona({
    this.legajo,
    this.nombre,
    this.puesto,
  });

  String mostrarDetallePersona() {
    return 'Soy una Persona abstracta';
  }
}
