import 'package:fismet_formsapp/login_text.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';


class LoginP extends StatefulWidget {
  LoginP({super.key});

  @override
  _LoginPState createState() => _LoginPState();
}

class _LoginPState extends State<LoginP> {
  final TextEditingController userController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool _obscureText = true;

  Future<void> _signIn(BuildContext context) async {
    try {
      final email = userController.text;
      final pass = passwordController.text;

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
                // Burbuja de usuario
                TextFieldInpute(
                  textEditingController: userController,
                  hintText: "Ingrese su usuario:",
                  icon: Icons.account_circle,
                ),
                // Burbuja de contraseña
                  TextFieldInpute(
                  textEditingController: passwordController,
                  hintText: "Ingrese su contraseña:",
                  icon: Icons.lock,
                  isPass: true, // Indicar que este es un campo de contraseña
                  obscureText: _obscureText,
                  onObscureTextChanged: (bool value) {
                    setState(() {
                      _obscureText = value;
                    });
                  },
                ),
                ElevatedButton(
                  // Botón de login
                  onPressed: () => _signIn(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF003A75), // Color de fondo
                    foregroundColor: Colors.white, // Color del texto
                    padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 54.0), // Padding
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25), // Bordes redondeados
                    ),
                    textStyle: const TextStyle(
                      fontWeight: FontWeight.w300, // Peso del texto
                      fontSize: 15, // Tamaño del texto
                    ),
                  ),
                  child: const Text("Entrar"),
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

