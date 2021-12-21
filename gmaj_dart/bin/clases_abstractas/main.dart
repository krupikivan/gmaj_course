import 'conductor.dart';
import 'gerente.dart';
import 'persona.dart';
import 'cajero.dart';
import 'repositor.dart';

main() {
  Cajero cajero1 = Cajero(
    legajo: 1234,
    nombre: 'David',
    puesto: 'Cajero',
  );
  Gerente gerente1 = Gerente(
    legajo: 1,
    nombre: 'Adam',
    puesto: 'Gerente',
  );
  Conductor conductor = Conductor(
    legajo: 1,
    nombre: 'Adam',
    puesto: 'Conductor',
  );
  Repositor repositor1 = Repositor(
    legajo: 1,
    nombre: 'Adam',
    puesto: 'Gerente',
  );
  Repositor repositor2 = Repositor(
    legajo: 2345,
    nombre: 'Matias',
    puesto: 'Marketing',
  );

  cajero1.mostrarDetallePersona();
  repositor2.mostrarDetallePersona();
}
