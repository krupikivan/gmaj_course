import 'package:flutter/material.dart';
import 'package:initial_app/controlador.dart';
import 'package:initial_app/user.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Listado de Usuarios'),
        ),
        body: FutureBuilder(
          future: getListadoDeUsuarios(),
          builder: (context, AsyncSnapshot<List<User>> snapshot) {
            if (!snapshot.hasData) {
              return const Center(child: CircularProgressIndicator());
            } else {
              return ListView(
                  children: snapshot.data
                      .map(
                        (User e) => ListTile(
                          contentPadding: const EdgeInsets.all(10),
                          title: Text(e.name),
                          leading: Image.network(e.imagen),
                        ),
                      )
                      .toList());
            }
          },
        ),
      ),
    );
  }
}
