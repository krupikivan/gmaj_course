import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gmaj_test_app/models/data_model.dart';
import 'package:gmaj_test_app/models/user_model_old.dart';
import 'package:gmaj_test_app/screens/detalle_usuario.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatelessWidget {
  const Home({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder(
          future: getUserData(),
          builder: (BuildContext context, AsyncSnapshot<List<User>> snapshot) {
            // snapshot.connectionState == ConnectionState.done ||
            if (snapshot.hasData) {
              List<User> usuarios = snapshot.data;

              // generando lista de widgets con los datos del usuario
              List<Widget> widgetUsuarios = usuarios.map((User usuario) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => DetalleUsuario(usuario),
                          ));
                    },
                    tileColor: Colors.orange,
                    title: Text(usuario.firstName),
                    leading: CachedNetworkImage(
                      imageUrl: usuario.avatar,
                      width: 50,
                    ),
                  ),
                );
              }).toList();

              return ListView(
                children: widgetUsuarios,
              );
            }
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}

Future<List<User>> getUserData() async {
  print('getUserData');
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String datosJson;
  try {
    Client http = Client();
    Uri uri = Uri.parse('https://reqres.in/api/users');
    Response respuesta = await http.get(uri);
    prefs.setString(
        'datosDeInternet', respuesta.body); // guardando de forma local
    print('datos de internet');
    datosJson = respuesta.body;
  } catch (e) {
    print('catch error: $e');
    print('levantando datos locales');
    datosJson = prefs.getString('datosDeInternet');
  }
  Map map = jsonDecode(datosJson);
  List<User> listaDeUsuarios = Data.fromJson(map).data;

  // List usuarios = map['data'];
  // List<Usuario> listaDeUsuarios =
  //     usuarios.map((user) => Usuario.fromMap(user)).toList();
  return listaDeUsuarios;
}
