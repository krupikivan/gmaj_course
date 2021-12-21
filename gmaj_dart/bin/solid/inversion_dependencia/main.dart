import 'algo_aes.dart';
import 'algo_rsa.dart';
import 'manejador_archivo.dart';

void main() {
  final manejador = ManejadorArchivo();

  manejador.encriptarArchivo(AlgoAES()); // Le estamos pasando la implementacion
  manejador.encriptarArchivo(AlgoRSA());
}
