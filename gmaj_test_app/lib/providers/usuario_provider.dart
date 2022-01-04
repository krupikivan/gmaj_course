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

  Future<bool> agregarRemoverUsuarioFavorito(String idUsuario) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool fueAgregado;
    if (_listadoFavoritos.contains(idUsuario) == true) {
      _listadoFavoritos.remove(idUsuario);
      fueAgregado = false;
    } else {
      _listadoFavoritos.add(idUsuario);
      fueAgregado = true;
    }

    await prefs.setStringList('listadoFavoritos', _listadoFavoritos);
    notifyListeners();
    return fueAgregado;
  }

  cargarListadoFavoritoDesdePreferencias() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> listado = await prefs.getStringList('listadoFavoritos');
    if (listado != null) {
      _listadoFavoritos.addAll(listado);
    }
    getUserData();
  }

  Future eliminarUsuario(String id) async {
    try {
      Client http = Client();
      Uri uri = Uri.parse('http://localhost:3004/users/$id');
      await http.delete(
        uri,
      );
      getUserData();
    } catch (e) {}
  }

  Future agregarNuevoUsuario() async {
    try {
      Client http = Client();
      Uri uri = Uri.parse('http://localhost:3004/users');
      await http.post(
        uri,
        body: {
          "email": "gmaj@gmaj.com",
          "first_name": "GMAJ",
          "last_name": "Center",
          "avatar": "https://reqres.in/img/faces/1-image.jpg"
        },
      );
      getUserData();
    } catch (e) {}
  }

  Future getUserData() async {
    _estaCargandoDatos = true;
    notifyListeners();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var datosJson;
    try {
      Client http = Client();
      Uri uri = Uri.parse('http://localhost:3004/users');
      Response respuesta = await http.get(uri);
      prefs.setString(
          'datosDeInternet', respuesta.body); // guardando de forma local
      datosJson = respuesta.body;
    } catch (e) {
      datosJson = prefs.getString('datosDeInternet');
    }
    List usuariosData = jsonDecode(datosJson);
    List<User> listaDeUsuarios =
        List<User>.from(usuariosData.map((x) => User.fromJson(x)));

    _usuarios.clear();
    _usuarios.addAll(listaDeUsuarios);
    _estaCargandoDatos = false;
    notifyListeners();
  }
}
