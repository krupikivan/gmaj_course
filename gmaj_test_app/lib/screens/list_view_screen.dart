import 'package:flutter/material.dart';

class ListViewScreen extends StatelessWidget {
  ListViewScreen({Key key}) : super(key: key);

  // final List personas = [
  //   'david',
  //   'iair',
  //   'shlomo',
  //   'rivka',
  //   'rajel',
  // ];
  List<Map> personas = [
    {
      'nombre': 'jaim',
      'dni': 216316546,
    },
    {
      'nombre': 'Tamara',
      'dni': 546465,
    },
    {
      'nombre': 'Rajel',
      'dni': 98798789,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black38,
      body: SafeArea(
        child: Column(
          children: [
            TextButton(
              onPressed: () {
                print('boton apretado');
                // Navigator.pop(context);
                Navigator.popUntil(context, ModalRoute.withName('/'));
              },
              child: Text('Volver atras'),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: personas.length,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    title: Text(personas[index]['nombre']),
                    // title: Text(personas[index]), // esto cuando es una lista de strings
                    subtitle: Text('${personas[index]['dni']}'),
                    trailing: const Icon(Icons.save),
                    tileColor: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
