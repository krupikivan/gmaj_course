class Ticket {
  final String nombre;
  String mes;
  int year;
  String estado;
  double costo;

  Ticket({
    this.nombre,
    this.mes,
    this.year,
    this.estado,
  });

  cambiarEstadoDelTicket(String nuevoEstado) {
    this.estado = nuevoEstado;
  }

  pagar(double costoDelPasaje) {
    this.costo = costoDelPasaje;
  }

  mostrarEstadoDelPasaje() {
    print('El estado se encuentra: $estado');
  }

  cambiarFechaDelTicket({int nuevoYear, String nuevoMes}) {
    this.year = nuevoYear;
    this.mes = nuevoMes;
  }

  mostrarDatosDelTicket() {
    print('-----------------');
    print(
        'Nombre: $nombre \nEstado: $estado\nFecha: $mes-$year\nCosto Total: \$$costo');
    print('-----------------');
  }
}
