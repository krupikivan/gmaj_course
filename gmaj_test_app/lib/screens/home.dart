import 'package:flutter/material.dart';
import 'package:gmaj_test_app/crear_listado_de_usuarios.dart';
import 'package:gmaj_test_app/models/user.dart';
import 'package:gmaj_test_app/providers/usuario_provider.dart';
import 'package:gmaj_test_app/screens/detalle_usuario.dart';
import 'package:gmaj_test_app/widgets/search_users.dart';
import 'package:provider/provider.dart';

import 'agregar_usuario_screen.dart';

class Home extends StatelessWidget {
  Home({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () => context.read<UsuarioProvider>().getUserData(),
      child: Consumer<UsuarioProvider>(
        builder: (BuildContext context, data, _) {
          return Scaffold(
            floatingActionButton: FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => AgregarUsuario(),
                  )),
            ),
            appBar: AppBar(
              title: Text('Home'),
              actions: [
                IconButton(
                  icon: const Icon(Icons.search),
                  tooltip: 'Buscar',
                  onPressed: data.usuarios.isEmpty
                      ? null
                      : () {
                          showSearch<String>(
                            context: context,
                            delegate: SearchUsers(data.usuarios),
                          );
                        },
                ),
              ],
            ),
            body: SafeArea(
              child: _builListado(data, context),
              // Consumer de TIPO UsuarioProvider
            ),
          );
        },
      ),
    );
  }

  Widget _builListado(UsuarioProvider data, BuildContext context) {
    if (data.estaCargandoDatos == true) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    if (data.usuarios.isEmpty) {
      return const Center(
        child: Text('Lista vacia'),
      );
    }
    return ListView(
      children: crearListadoDeUsuarios(data.usuarios, context),
    );
  }
}
