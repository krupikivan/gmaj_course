import 'package:flutter/material.dart';
import 'package:gmaj_test_app/models/user.dart';
import 'package:gmaj_test_app/providers/usuario_provider.dart';
import 'package:gmaj_test_app/screens/detalle_usuario.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  const Home({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () => context.read<UsuarioProvider>().getUserData(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Home'),
        ),
        body: SafeArea(
          // Consumer de TIPO UsuarioProvider
          child: Consumer<UsuarioProvider>(
            builder: (BuildContext context, data, _) {
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
            },
          ),
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
          trailing: Consumer<UsuarioProvider>(builder: (context, data, _) {
            return Icon(
              Icons.favorite,
              color: data.listadoFavoritos.contains(usuario.id)
                  ? Colors.red
                  : Colors.black38,
            );
          }),
        ),
      );
    }).toList();
  }
}
