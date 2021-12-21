import 'algoritmo_encriptacion.dart';

class ManejadorArchivo {
  ManejadorArchivo();

  // Este metodo recibe la IMPLEMENTACION, pero desde el main le mandamos la concreta
  void encriptarArchivo(AlgoritmoEncriptacion algo) => algo.encrypt();
}
