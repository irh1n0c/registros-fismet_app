import 'package:flutter/material.dart';
import 'tmpt/login_text.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  

  @override
  Widget build(BuildContext context) {
    final userController = TextEditingController(); // Define el controlador

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Formulario ok pe',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            //Uso del template de boxes
            TextFieldInpute(
                  textEditingController: userController,
                  hintText: "Ingrese código de registro.",
                  icon: Icons.article_rounded,
                ),
          ],
        ),
      ),
    );
  }
}
