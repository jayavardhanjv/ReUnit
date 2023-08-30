import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  const MyTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
    required this.enableSuggestions,
    // required this.type,
  });

  final TextEditingController controller;

  final String hintText;

  final bool obscureText;
  final bool enableSuggestions;
  // final bool type;

  @override
  Widget build(BuildContext context) {
    // var kype;
    // kype = type;
    // var kype;
    return TextField(
      // keyboardType: TextInputType.kyp,
      controller: controller,
      obscureText: obscureText,
      enableSuggestions: enableSuggestions,
      decoration: InputDecoration(
          hintText: hintText,
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
            ),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
            ),
          ),
          fillColor: Colors.grey.shade100,
          filled: true,
          hintStyle: TextStyle(
            color: Colors.grey[500],
          )),
    );
  }
}
