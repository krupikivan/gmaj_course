import 'dart:convert';
import 'package:http/http.dart' as http;

class Controlador {
  Future<double> getDolarBlue(String tipo) async {
    String url = 'https://criptoya.com/api/dolar';
    var response = await http.get(url);
    Map data = json.decode(response.body);
    double blue = data[tipo].toDouble();
    return blue;
  }
}
