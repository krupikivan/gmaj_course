import 'package:flutter/material.dart';
import 'package:gmaj_test_app/providers/usuario_provider.dart';
import 'package:provider/src/provider.dart';
import 'package:image_picker/image_picker.dart';

class AgregarUsuario extends StatefulWidget {
  const AgregarUsuario({Key key}) : super(key: key);

  @override
  State<AgregarUsuario> createState() => _AgregarUsuarioState();
}

class _AgregarUsuarioState extends State<AgregarUsuario> {
  TextEditingController emailController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController imagenController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nuevo Usuario'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (value) => value.length > 3 ? null : 'Error',
              controller: emailController,
              decoration: InputDecoration(
                hintText: 'Ingrese email',
                contentPadding: EdgeInsets.only(left: 15),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            TextField(
              controller: firstNameController,
              decoration: InputDecoration(
                hintText: 'Ingrese Nombre',
                contentPadding: EdgeInsets.only(left: 15),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            TextField(
              controller: lastNameController,
              decoration: InputDecoration(
                hintText: 'Ingrese Apellido',
                contentPadding: EdgeInsets.only(left: 15),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            if (context.watch<UsuarioProvider>().file != null)
              Image.memory(context.watch<UsuarioProvider>().file),

            ElevatedButton.icon(
                onPressed: () => _cargarImagen(),
                icon: Icon(Icons.photo),
                label: Text('Cargar Imagen')),
            // TextField(
            //   controller: imagenController,
            //   decoration: InputDecoration(
            //     hintText: 'Ingrese Imagen',
            //     contentPadding: EdgeInsets.only(left: 15),
            //   ),
            // ),
            Spacer(),
            ElevatedButton(
              onPressed: () {
                if (emailController.text.isEmpty ||
                    firstNameController.text.isEmpty ||
                    lastNameController.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Hay espacios sin completar')));
                } else {
                  context.read<UsuarioProvider>().agregarNuevoUsuario(
                        email: emailController.text,
                        firstName: firstNameController.text,
                        lastName: lastNameController.text,
                      );
                  _limpiarFormulario();
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Usuario guardado')));
                }
              },
              child: Text('Guardar'),
            )
          ],
        ),
      ),
    );
  }

  _cargarImagen() async {
    final ImagePicker _picker = ImagePicker();
    final XFile image = await _picker.pickImage(source: ImageSource.gallery);
    context.read<UsuarioProvider>().agregarImagen(image);
  }

  void _limpiarFormulario() {
    emailController.clear();
    lastNameController.clear();
    firstNameController.clear();
  }
}
