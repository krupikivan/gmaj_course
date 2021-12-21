class Dolar {
  double oficial;
  double solidario;
  double mep;
  double ccl;
  double ccb;
  double blue;

  Dolar() {
    this.oficial;
    this.solidario;
    this.mep;
    this.ccl;
    this.ccb;
    this.blue;
  }

  Dolar.criptoya(Map data) {
    this.oficial = data['oficial'].toDouble();
    this.solidario = data['solidario'].toDouble();
    this.mep = data['mep'].toDouble();
    this.ccl = data['ccl'].toDouble();
    this.ccb = data['ccb'].toDouble();
    this.blue = data['blue'].toDouble();
  }
}
