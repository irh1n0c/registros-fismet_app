import 'package:fismet_formsapp/login_text.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginP extends StatelessWidget {
  LoginP({super.key});
  final TextEditingController userController = TextEditingController();
  final TextEditingController password = TextEditingController();

  Future<void> _signIn(BuildContext context) async {
    try {
      final email = userController.text;
      final pass = password.text;

      if (email.isEmpty || pass.isEmpty) {
        // Manejo de error si los campos están vacíos
        print('Campos vacíos');
        return;
      }

      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: pass,
      );
      print('Usuario autenticado: ${userCredential.user?.email}');
      Navigator.pushReplacementNamed(context, '/home'); // Redirige al usuario autenticado

    } catch (e) {
      print('Error en la autenticación: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.all(24),
            child: Column(
              children: [
                _header(context),
                _logo(context),
                //burbuja de usuario
                TextFieldInpute(
                  textEditingController: userController,
                  hintText: "Ingrese su usuario: ", 
                  icon: Icons.account_circle,
                ),
                //burbuja de contraseña
                TextFieldInpute(
                  textEditingController: password,
                  hintText: "Ingrese su contraseña: ", 
                  icon: Icons.lock,
                ),
                ElevatedButton(
                  onPressed: () => _signIn(context),
                  child: const Text("Entrar"),
                    style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF003A75), // Color de fondo
                    foregroundColor: Colors.white, // Color del texto
                    padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 54.0), // Padding
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20), // Bordes redondeados
                    ),
                    textStyle: const TextStyle(
                      fontWeight: FontWeight.w300, // Peso del texto
                      fontSize: 15, // Tamaño del texto
                    ),
                  ),
                ),  
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _header(BuildContext context) {
    return const Column(
      children: [
        Text(
          "Registros Fismet",
          style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Widget _logo(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return SizedBox(
      width: double.infinity,
      height: height / 2.7,
      child: Image.asset("assets/img/login.png"),
    );
  }
}

