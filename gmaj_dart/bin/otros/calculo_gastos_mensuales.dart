void main() {
  List<double> gastosMensuales = [3400, 6780.3, 4010.89, 2099.2, 5000];

  double gastoTotal = 0;

  for (int i = 0; i < gastosMensuales.length; i++) {
    gastoTotal += gastosMensuales[i];
  }
  gastoTotal = gastoTotal / gastosMensuales.length;
  print("El gasto promedio mensual fue de \$$gastoTotal");
}
