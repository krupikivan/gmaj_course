import 'maquina_expendedora.dart';

void main() {
  MaquinaExpendedora expendedora = MaquinaExpendedora.llena();

  print(
      'La maquiena se encuentra lista para expender? ${expendedora.estaListaParaExpender()}');

  print('Agregando dinero...');
  expendedora.agregarDinero(11);

  print(expendedora.getBebidas());
  expendedora.expenderBebida(2);

  print('La expendedora lleva recaudado ${expendedora.getGanancias()}');
  print('Todavia tiene ${expendedora.getCambio()} para devolver en cambio');
}
