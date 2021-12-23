import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gmaj_test_app/models/data_model.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UsuarioProvider extends ChangeNotifier {
  final List<User> _usuarios = [];

  List<User> get usuarios => _usuarios;

  Future getUserData() async {
    // print('getUserData');
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String datosJson;
    try {
      Client http = Client();
      Uri uri = Uri.parse('https://reqres.in/api/users');
      Response respuesta = await http.get(uri);
      prefs.setString(
          'datosDeInternet', respuesta.body); // guardando de forma local
      // print('datos de internet');
      datosJson = respuesta.body;
    } catch (e) {
      // print('catch error: $e');
      // print('levantando datos locales');
      datosJson = prefs.getString('datosDeInternet');
    }
    Map map = jsonDecode(datosJson);
    List<User> listaDeUsuarios = Data.fromJson(map).data;
    // Inyecto los usuarios en _usuarios dentro de provider
    _usuarios.clear();
    _usuarios.addAll(listaDeUsuarios);
    notifyListeners();
    // List usuarios = map['data'];
    // List<Usuario> listaDeUsuarios =
    //     usuarios.map((user) => Usuario.fromMap(user)).toList();
  }
}
