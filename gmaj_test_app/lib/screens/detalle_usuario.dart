import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gmaj_test_app/models/user.dart';
import 'package:gmaj_test_app/providers/usuario_provider.dart';
import 'package:provider/provider.dart';

class DetalleUsuario extends StatelessWidget {
  final User usuario;
  const DetalleUsuario(this.usuario, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Column(
          children: [
            Text('Id: ${usuario.id}'),
            Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: [
                Image.network(
                  usuario.avatar,
                  fit: BoxFit.fitWidth,
                  height: 300,
                  width: double.infinity,
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    color: Colors.black54,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        '${usuario.firstName} ${usuario.lastName}',
                        style: TextStyle(color: Colors.white),
                        textAlign: TextAlign.center,
                        textScaleFactor: 2,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(CupertinoIcons.mail),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('${usuario.email}'),
                      ),
                    ],
                  ),
                  ElevatedButton.icon(
                    onPressed: () {},
                    label: Text('usuario.email'),
                    icon: Icon(CupertinoIcons.mail),
                  ),
                  IconButton(
                    onPressed: () => context
                        .read<UsuarioProvider>()
                        .agregarRemoverUsuarioFavorito(usuario.id),
                    icon: Consumer<UsuarioProvider>(
                      builder: (context, data, _) {
                        bool esFavorito =
                            data.listadoFavoritos.contains(usuario.id);

                        return Icon(
                          esFavorito ? Icons.favorite : Icons.favorite_outline,
                          color: esFavorito ? Colors.red : Colors.black,
                          size: 50,
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
