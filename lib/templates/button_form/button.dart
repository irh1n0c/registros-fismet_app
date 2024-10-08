import 'package:flutter/material.dart';

class TextFieldInpute extends StatelessWidget {
  final TextEditingController textEditingController;
  final bool isPass;
  final String hintText;
  final IconData icon;
  final bool obscureText;
  final ValueChanged<bool>? onObscureTextChanged;

  const TextFieldInpute({super.key, 
  required this.textEditingController, 
  this.isPass=false, 
  required this.hintText, 
  required this.icon,
  this.obscureText = false,
  this.onObscureTextChanged,
  });
  

@override
Widget build(BuildContext context) {
  return SingleChildScrollView(
    padding: const EdgeInsets.all(16.0),
    child: TextField(
      obscureText: isPass? obscureText: false,
      controller: textEditingController,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(
          color: Color(0xFF900909),
          fontWeight: FontWeight.w300,
          fontSize: 15,
          ),
        prefixIcon: Icon(
          icon,
          color: const Color(0xFF900909)),
        contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        border: InputBorder.none,
        filled: true,
        fillColor: const Color.fromARGB(53, 231, 209, 209),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(20),
        ),
        
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 0.5, color: Color(0xFFB3B3B3)),
          borderRadius: BorderRadius.circular(20),
        ),
        suffixIcon: isPass
            ? IconButton(
                icon: Icon(
                  obscureText ? Icons.visibility : Icons.visibility_off,
                  color: const Color(0xFF900909),
                ),
                onPressed: () {
                  if (onObscureTextChanged != null) {
                    onObscureTextChanged!(!obscureText);
                  }
                },
              )
          : null,
        ),
      ),
    );
  }
}