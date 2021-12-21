import 'dart:convert';

import 'package:http/http.dart';
import 'package:initial_app/user.dart';

Future<List<User>> getListadoDeUsuarios() async {
  Client http = Client();
  final url = Uri.parse('https://6050f73e5346090017670fee.mockapi.io/users');

  var respuesta = await http.get(url);

  final List jsonData = jsonDecode(respuesta.body);

  return jsonData.map((e) => User.fromJson(e)).toList();
}
