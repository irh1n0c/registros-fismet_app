import 'package:flutter/material.dart';
import 'package:fismet_formsapp/templates/button_form/button.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final userController = TextEditingController();

    return Scaffold(
      body: Stack( 
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'Formulario ok pe',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                // Uso del template de boxes
                TextFieldInpute(
                  textEditingController: userController,
                  hintText: "EL AMIRU ME LA PELA",
                  icon: Icons.article_rounded,
                ),
              ],
            ),
          ),
          // Imagen en la esquina superior izquierda
          Positioned(
            top: 40, // Ajusta la posición vertical
            left: 10, // Ajusta la posición horizontal
            child: Image.asset(
              'assets/icon/registros.png', 
              width: 50, // Ancho de la imagen
              height: 50, // Alto de la imagen
            ),
          ),
          
        ],
      ),
    );
  }
}

