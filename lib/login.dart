import 'package:fismet_formsapp/button.dart';
import 'package:fismet_formsapp/login_text.dart';
import 'package:flutter/material.dart';

class LoginP extends StatelessWidget {
  LoginP({super.key});
  final TextEditingController userController = TextEditingController();
  final TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          margin: const EdgeInsets.all(24),
          child: Column(
            children: [
              _header(context),
              _logo(context),
              //burbujas de usuario
              TextFieldInpute(
                textEditingController: userController,
                hintText: "Ingrese su usuario: ", 
                icon: (Icons.account_circle),
                ),
              //burbuja de contraseña
              TextFieldInpute(
                textEditingController: password,
                hintText: "Ingrese su contraseña: ", 
                icon: (Icons.lock),
                ),
              MyButton(onTab: (){}, text: "Entrar")  
            ],
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
