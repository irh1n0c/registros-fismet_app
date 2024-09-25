import 'package:flutter/material.dart';
import 'package:fismet_formsapp/templates/button_form/button.dart';
import 'package:fismet_formsapp/templates/cards.dart';
import 'package:fismet_formsapp/templates/card_background.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final userController = TextEditingController();

    return Scaffold(
      body: Stack(
        children: [
          // Usar un Container para el MiCards
          const Positioned(
            top: 50,
            left: 100, // Ajusta la posición horizontal
            right: 0, // Permite que ocupe todo el ancho
            child: MiCards(
              title: 'Formularios Fismet',
              subtitle: 'Seleccion de formularios',
              backgroundColor: Color(0xFF1d277f),
              textColor: Colors.white,
              height: 100, // Alto del card
              titleFontSize: 22, // Ajustar el tamaño del título
              subtitleFontSize: 12, // Ajustar el tamaño del subtítulo
            ),
          ),
          
          Positioned(
            top: 150,
            left: 0,
            right: 0,
            child: TextFieldInpute(
              textEditingController: userController,
              hintText: "Ingrese código registro",
              icon: Icons.article_rounded,
            ),
          ),
          const Positioned(
            top: 250,
            left: 0,
            right: 0,
            child: Row(
              children: [
                Expanded(
                  child: MiCards(
                  title: 'Título 2',
                  subtitle: 'Este es un subtítulo',
                  backgroundColor: Colors.blue,
                  textColor: Colors.white,
                  height: 100, // Alto del card
                  titleFontSize: 28, // Ajustar el tamaño del título
                  subtitleFontSize: 15, // Ajustar el tamaño del subtítulo
                  ),
                ),
                Expanded(
                  child: MiCards(
                  title: 'Título 3',
                  subtitle: 'Este es un subtítulo',
                  backgroundColor: Color(0xFF21F356),
                  textColor: Colors.white,
                  height: 100, // Alto del card
                  titleFontSize: 28, // Ajustar el tamaño del título
                  subtitleFontSize: 15, // Ajustar el tamaño del subtítulo
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 60,
            left: 10,
            child: Image.asset(
              'assets/img/login.png',
              width: 90,
              height: 90,
            ),
          ),
          Positioned(
            top: 300,
            left: 0,
            right: 0,
            child: TextFieldInpute(
              textEditingController: userController,
              hintText: "Ingrese código registro",
              icon: Icons.article_rounded,
            ),
          ),
        ],
      ),
    );
  }
}
