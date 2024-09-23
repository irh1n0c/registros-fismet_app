import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Página Principal'),
        backgroundColor: const Color.fromARGB(255, 55, 123, 78), // Mismo color que el botón de login
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Bienvenido a la Página Principal',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Ejemplo: cerrar sesión o navegar a otra pantalla
                Navigator.pop(context); // Volver a la pantalla anterior (login)
              },
              
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF003A75),
                padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 30.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                textStyle: const TextStyle(
                  fontWeight: FontWeight.w300,
                  fontSize: 15,
                ),
              ),
              child: const Text('Cerrar sesión'),
            ),
          ],
        ),
      ),
    );
  }
}
