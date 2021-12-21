import 'dart:convert';

import 'package:http/http.dart' as http;
import 'dolar.dart';

void main() async {
  Dolar dolar = await getDolar();

  // print("El dolar oficial esta en \$${dolar.oficial}");
  // print("El dolar blue esta en \$${dolar.blue}");
}

Future<Dolar> getDolar() async {
  String url = 'https://criptoya.com/api/dolar';
  var response = await http.get(url);
  Map data = json.decode(response.body);

// Esta parte
  Dolar dolar = Dolar.criptoya(data);
  print("El dolar blue esta en: ${dolar.blue}");

  return dolar;
}
