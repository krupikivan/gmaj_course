import 'persona.dart';

void main() {
  Persona empleado = Persona();
  Persona jefe = Persona();

  empleado.nombre = 'Moishe';
  jefe.nombre = 'Shlomo';

  empleado.ingresoMensual = 35000;
  jefe.ingresoMensual = 55000;

  double promedio = (empleado.ingresoMensual + jefe.ingresoMensual) / 2;

  print("El promedio de ${empleado.nombre} y ${jefe.nombre} es de $promedio");

  empleado.ultimosTresMeses = [38000, 33000, 35000];

  promedio = 0;

  for (int i = 0; i < empleado.ultimosTresMeses.length; i++) {
    promedio += empleado.ultimosTresMeses[i];
  }

  promedio = promedio / empleado.ultimosTresMeses.length;

  print(
      "El promedio de los ultimos 3 meses de ${empleado.nombre} es de $promedio");
}
