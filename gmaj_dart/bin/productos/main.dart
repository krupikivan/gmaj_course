import 'producto.dart';

void main() {
  Producto jugo = Producto();
  List<int> lista = [1, 3, 5, 5, 5, 5];
  var data = lista.fold(0, (previousValue, element) => previousValue + element);
  print(data);
  // jugo.marca = 'citric';

  // jugo.precio = 70;

  // print("El precio es de ${jugo.getPrecio()}");

  // jugo.setPrecio(120); // El estado CAMBIA

  // print("El nuevo precio es de ${jugo.getPrecio()}");
}
