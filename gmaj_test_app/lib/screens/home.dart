import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gmaj_test_app/models/data_model.dart';
import 'package:gmaj_test_app/providers/usuario_provider.dart';
import 'package:gmaj_test_app/screens/detalle_usuario.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  const Home({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () =>
            Provider.of<UsuarioProvider>(context, listen: false).getUserData(),
      ),
      appBar: AppBar(),
      body: SafeArea(
        // Consumer de TIPO UsuarioProvider
        child: Consumer<UsuarioProvider>(
          builder: (BuildContext context, data, _) {
            if (data.usuarios.isEmpty) {
              return const Center(
                child: Text('Lista vacia'),
              );
            }

            return ListView(
              children: crearListadoDeUsuarios(data.usuarios, context),
            );
          },
        ),
      ),
    );
  }

  List<Widget> crearListadoDeUsuarios(List<User> usuarios, context) {
    return usuarios.map((User usuario) {
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
          leading: FadeInImage.assetNetwork(
            placeholder: 'assets/loading.gif',
            image: usuario.avatar,
            imageCacheWidth: 50,
            width: 50,
          ),
        ),
      );
    }).toList();
  }
}
