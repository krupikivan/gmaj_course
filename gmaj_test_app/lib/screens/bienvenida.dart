// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:gmaj_test_app/widgets/box.dart';
import 'package:random_color/random_color.dart';

class Bienvenida extends StatelessWidget {
  Bienvenida({Key key}) : super(key: key);

  List<Color> boxes =
      List.generate(20, (int index) => RandomColor().randomColor());

  @override
  Widget build(BuildContext context) {
    final String title = ModalRoute.of(context).settings.arguments as String;

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
        leading: Container(),
      ),
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
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/listViewScreen');
              },
              child: Text('ListView'),
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 20),
                // mainAxisAlignment: MainAxisAlignment.start,
                // mainAxisSize: MainAxisSize.min,
                children: boxes
                    .map(
                      (Color color) => Column(
                        children: [
                          Box(color),
                        ],
                      ),
                    )
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
