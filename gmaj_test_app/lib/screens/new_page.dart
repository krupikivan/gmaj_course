// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:gmaj_test_app/screens/bienvenida.dart';
import 'package:gmaj_test_app/screens/home.dart';
import 'package:gmaj_test_app/widgets/box.dart';
import 'package:random_color/random_color.dart';

class NewPage extends StatefulWidget {
  NewPage({Key key}) : super(key: key);

  @override
  State<NewPage> createState() => _NewPageState();
}

class _NewPageState extends State<NewPage> {
  int number = 0;
  bool isOpen = true;
  List imagenes = ['januca.jpg', 'januca2.jpg'];

  @override
  void initState() {
    super.initState();
    var nombreA = ["shelomo"];
    List nombreB = List.from(nombreA); // referencia
    nombreB.add('jaim');
    print('nombreB $nombreB');
    print('nombreA $nombreA');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          // FloatingActionButton(
          //   child: Icon(Icons.add),
          //   onPressed: () {
          //     setState(() {
          //       print('boton apretado');
          //       number++;
          //       print('Numero vale $number');
          //     });
          //   },
          // ),
          // SizedBox(height: 10),
          FloatingActionButton(
            child: Icon(Icons.remove),
            onPressed: () {
              setState(() {
                print('boton apretado');
                number--;
                print('Numero vale $number');
              });
            },
          ),
        ],
      ),
      appBar: AppBar(
          // backgroundColor: Colors.blue,
          ),
      // appBar: AppBar(
      //   title: Text('Nueva Pantalla'),
      //   centerTitle: true,
      //   // backgroundColor: Colors.grey,
      // ),
      // backgroundColor: Colors.red,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Switch(
                value: isOpen,
                onChanged: (bool newValue) {
                  setState(() {
                    isOpen = newValue;
                  });
                  print('el switcher es $newValue');
                },
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Lista de colores'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    '/',
                  );
                },
                child: Text('ir a Home'),
              ),
              ElevatedButton(
                onPressed: isOpen
                    ? () {
                        Navigator.pushNamed(
                          context,
                          '/bienvenida',
                          arguments: 'Bienvenida otra vez',
                        );
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (_) => Bienvenida(),
                        //   ),
                        // );
                      }
                    : null,
                child: Text('ir a la otra pagina'),
              ),
              Image.asset('assets/${imagenes[isOpen ? 0 : 1]}'),
            ],
          ),
        ),
      ),
    );
  }
}
