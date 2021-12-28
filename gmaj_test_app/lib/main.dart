import 'package:flutter/material.dart';
import 'package:gmaj_test_app/providers/usuario_provider.dart';
import 'package:gmaj_test_app/screens/bienvenida.dart';
import 'package:gmaj_test_app/screens/home.dart';
import 'package:gmaj_test_app/screens/list_view_screen.dart';
import 'package:gmaj_test_app/screens/new_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      // Creamos la instancia o sea al sujeto que emite el estado
      create: (BuildContext context) => UsuarioProvider(),
      child: MaterialApp(
        theme: ThemeData(primarySwatch: Colors.green),
        debugShowCheckedModeBanner: false,
        // debugShowMaterialGrid: true,
        // home: NewPage(),
        title: 'Curso Gmaj',

        initialRoute: '/new_page', // ruta inicial por defecto
        routes: {
          '/': (_) => const Home(),
          '/new_page': (_) => NewPage(),
          '/bienvenida': (_) => Bienvenida(),
          '/listViewScreen': (_) => ListViewScreen(),
        },
      ),
    );
  }
}
