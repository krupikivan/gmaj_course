class MaquinaExpendedora {
  List<String> _bebidas;
  double _monedasParaCambio;
  double _precioPorLata;
  double _ganancia;
  bool _listaParaExpender;

  MaquinaExpendedora.llena() {
    _bebidas = ['Coca Cola', 'Fanta', 'Sprite', 'Pepsi'];
    _monedasParaCambio = 35.25;
    _precioPorLata = 5.25;
    _ganancia = 0;
    _listaParaExpender = false;
  }

  MaquinaExpendedora(List<String> bebidas, double monedasParaCambio,
      double precioPorLata, double ganancia) {
    this._bebidas = bebidas;
    this._ganancia = ganancia;
    this._monedasParaCambio = monedasParaCambio;
    this._precioPorLata = precioPorLata;
    this._listaParaExpender = false;
  }

  getBebidas() {
    return _bebidas;
  }

  getGanancias() {
    return _ganancia;
  }

  getCambio() {
    return _monedasParaCambio;
  }

  estaListaParaExpender() {
    return _listaParaExpender;
  }

  agregarDinero(double monto) {
    if (monto < _precioPorLata) {
      print('Vuelva a ingresar suficiente plata');
      return monto;
    }

    if ((monto - _precioPorLata) > _monedasParaCambio) {
      print('No tenemos cambio suficiente para devolverle');
      return monto;
    }

    _ganancia += _precioPorLata;
    _monedasParaCambio -= monto - _precioPorLata;

    _listaParaExpender = true;

    print('La maquina se encuentra lista para expender');
  }

  expenderBebida(int eleccion) {
    print('Aqui tiene su ${_bebidas[eleccion]}');
    _listaParaExpender = false;
  }
}
