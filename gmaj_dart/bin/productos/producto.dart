class Producto {
  String marca;
  double precio;

  precioIva() {
    double masIva = precio * 1.21;
    return masIva;
  }

  precioDolarizado() {
    return precio / 150;
  }

  getMarca() {
    return marca;
  }

  getPrecio() {
    return precio;
  }

  setPrecio(double nuevoPrecio) {
    precio = nuevoPrecio;
  }
}
