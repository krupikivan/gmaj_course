import 'package:flutter/material.dart';
import 'package:gmaj_test_app/crear_listado_de_usuarios.dart';
import 'package:gmaj_test_app/models/user.dart';

class SearchUsers extends SearchDelegate<String> {
  final List<User> usuarios;
  SearchUsers(this.usuarios);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: Icon(Icons.close),
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.pop(context);
        // close(context, '');
      },
      icon: Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return showUsers(context);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return showUsers(context);
  }

  Widget showUsers(BuildContext context) {
    // List<User> usuarios;
    List<User> nuevosUsurios = [];
    for (User usuario in usuarios) {
      if (usuario.firstName.toLowerCase().contains(query)) {
        nuevosUsurios.add(usuario);
      }
    }

    return ListView(
      children:crearListadoDeUsuarios(nuevosUsurios, context),
    );
  }
}
