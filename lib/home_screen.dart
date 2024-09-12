import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pantalla Principal'),
      ),
      body: const Center(
        child: Text(
          'Bienvenido a la pantalla principal',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
