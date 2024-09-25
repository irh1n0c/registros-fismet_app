import 'package:flutter/material.dart';

class BackgroundWidget extends StatelessWidget {
  final Widget child; // Para recibir cualquier contenido que se pase al fondo

  const BackgroundWidget({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.blueAccent, Colors.lightBlueAccent], // Colores del fondo
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Stack(
        children: [
          child, // Aquí colocamos el contenido que se pase
        ],
      ),
    );
  }
}


