import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:gmaj_test_app/models/user.dart';
import 'package:http/http.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UsuarioProvider extends ChangeNotifier {
  final List<User> _usuarios = [];
  List<User> get usuarios => _usuarios;

  UsuarioProvider.init() {
    cargarListadoFavoritoDesdePreferencias();
  }

  List<String> _listadoFavoritos = [];
  List<String> get listadoFavoritos => _listadoFavoritos;

  Uint8List _file;
  XFile _imagen;
  XFile get imagen => _imagen;
  Uint8List get file => _file;

  agregarImagen(XFile imagen) async {
    _file = await imagen.readAsBytes();
    _imagen = imagen;
    notifyListeners();
  }

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

  Future agregarNuevoUsuario({
    String email,
    String firstName,
    String lastName,
  }) async {
    try {
      Client http = Client();
      Uri uri = Uri.parse('http://localhost:3004/users');
      File file = File.fromRawPath(_file);
      await http.post(
        uri,
        body: {
          "email": email,
          "first_name": firstName,
          "last_name": lastName,
          "avatar": file.path
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
