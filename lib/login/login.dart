import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'tmpt/login_text.dart';


class LoginP extends StatefulWidget {
  const LoginP({super.key});

  @override
  LoginPState createState() => LoginPState();
}

class LoginPState extends State<LoginP> {
  final TextEditingController userController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool _obscureText = true;

  Future<void> _signIn() async {
    try {
      final email = userController.text;
      final pass = passwordController.text;

      if (email.isEmpty || pass.isEmpty) {
        // Manejo de error si los campos están vacíos
        return;
      }

      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: pass,
      );
      
      if (mounted) {
        Navigator.pushReplacementNamed(context, '/home');
      }

    } catch (e) {
      ('Error en la autenticación: $e');
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
                  onPressed: () => _signIn(),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF003A75), 
                    foregroundColor: Colors.white, 
                    padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 54.0), 
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25), 
                    ),
                    textStyle: const TextStyle(
                      fontWeight: FontWeight.w300, 
                      fontSize: 15, 
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

