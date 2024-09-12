import 'package:flutter/material.dart';

class TextFieldInpute extends StatelessWidget {
  final TextEditingController textEditingController;
  final bool isPass;
  final String hintText;
  final IconData icon;

  const TextFieldInpute({super.key, 
  required this.textEditingController, 
  this.isPass=false, 
  required this.hintText, 
  required this.icon});

  @override
Widget build(BuildContext context) {
  return SingleChildScrollView(
    padding: const EdgeInsets.all(16.0),
    child: TextField(
      obscureText: isPass,
      controller: textEditingController,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(
          color: Color(0xFF1d277f),
          //fontSize: 18,
          ),
        prefixIcon: Icon(
          icon,
          color: const Color(0xFF1d277f)),
        contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        border: InputBorder.none,
        filled: true,
        fillColor: const Color.fromARGB(217, 203, 202, 224),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(20),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 0.5, color: Color(0xFF1d277f)),
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    ),
  );
}
}

/*Widget build(BuildContext context) {
      return TextField( decoration: InputDecoration(
        border:  InputBorder.none,
        filled: true,
        fillColor: Color(0xFF92fcf6),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
           borderRadius: BorderRadius.circular(20),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 0.5,color: Color(0xFF1d277f)),
           borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}*/
