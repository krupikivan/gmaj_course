import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:gmaj_test_app/models/user.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UsuarioProvider extends ChangeNotifier {
  final List<User> _usuarios = [];
  List<User> get usuarios => _usuarios;

  UsuarioProvider.init() {
    cargarListadoFavoritoDesdePreferencias();
  }

  List<String> _listadoFavoritos = [];
  List<String> get listadoFavoritos => _listadoFavoritos;

  bool _estaCargandoDatos = false;
  bool get estaCargandoDatos => _estaCargandoDatos;

  agregarRemoverUsuarioFavorito(String idUsuario) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (_listadoFavoritos.contains(idUsuario) == true) {
      _listadoFavoritos.remove(idUsuario);
    } else {
      _listadoFavoritos.add(idUsuario);
    }

    await prefs.setStringList('listadoFavoritos', _listadoFavoritos);
    notifyListeners();
  }

  cargarListadoFavoritoDesdePreferencias() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> listado = await prefs.getStringList('listadoFavoritos');
    _listadoFavoritos.addAll(listado);
    getUserData();
  }

  Future getUserData() async {
    _estaCargandoDatos = true;
    notifyListeners();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String datosJson;
    try {
      Client http = Client();
      Uri uri = Uri.parse('https://reqres.in/api/users');
      Response respuesta = await http.get(uri);
      prefs.setString(
          'datosDeInternet', respuesta.body); // guardando de forma local
      datosJson = respuesta.body;
    } catch (e) {
      datosJson = prefs.getString('datosDeInternet');
    }
    Map map = jsonDecode(datosJson);
    List<User> listaDeUsuarios =
        List<User>.from(map["data"].map((x) => User.fromJson(x)));
    _usuarios.clear();
    _usuarios.addAll(listaDeUsuarios);
    _estaCargandoDatos = false;
    notifyListeners();
  }
}
