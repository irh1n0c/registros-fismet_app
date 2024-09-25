import 'package:flutter/material.dart';

class MiCards extends StatelessWidget {
  final String title;
  final String? subtitle; // Nuevo parámetro opcional para el subtítulo
  final Color backgroundColor; // Color del Padding (fondo)
  final Color textColor;       // Color del texto
  final double height;         // Alto
  final double titleFontSize;  // Tamaño de fuente para el título
  final double subtitleFontSize; // Tamaño de fuente para el subtítulo

  const MiCards({
    super.key,
    required this.title,
    this.subtitle,
    required this.backgroundColor,
    required this.textColor,
    required this.height,
    this.titleFontSize = 30, // Valor predeterminado
    this.subtitleFontSize = 20, // Valor predeterminado
  });

  @override
  Widget build(BuildContext context) {
    // Obtener el ancho de la pantalla
    double width = MediaQuery.of(context).size.width;

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0), // Bordes redondeados
      ),
      clipBehavior: Clip.antiAlias,
      child: Container(
        width: width,    // Ocupa todo el ancho de la pantalla
        height: height,  // Ajustar la altura
        color: backgroundColor, // Color de fondo
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column( // Cambiado a Column para mostrar título y subtítulo
            crossAxisAlignment: CrossAxisAlignment.start, // Alinear a la izquierda
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: titleFontSize, // Tamaño de fuente del título
                  color: textColor, // Color del texto
                ),
              ),
              if (subtitle != null) // Mostrar subtítulo si no es nulo
                Text(
                  subtitle!,
                  style: TextStyle(
                    fontSize: subtitleFontSize, // Tamaño de fuente del subtítulo
                    color: textColor.withOpacity(0.7), // Color del subtítulo
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

