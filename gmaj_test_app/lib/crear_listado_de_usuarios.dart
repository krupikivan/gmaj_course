import 'package:flutter/material.dart';
import 'package:gmaj_test_app/providers/usuario_provider.dart';
import 'package:gmaj_test_app/screens/detalle_usuario.dart';
import 'package:provider/provider.dart';

import 'models/user.dart';

List<Widget> crearListadoDeUsuarios(List<User> usuarios, BuildContext context) {
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
            Widget widget;
            if (data.listadoFavoritos.contains(usuario.id)) {
              widget = Icon(
                Icons.favorite,
                color: Colors.red,
              );
            } else {
              widget = SizedBox();
            }
            ;
            return widget;
          }),
        ),
      );
    }).toList();
  }