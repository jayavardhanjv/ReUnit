import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

class MyTextField extends StatelessWidget {
  MyTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
    required this.enableSuggestions,
    required this.Myicon,
    required this.Mykeybord,
  });

  final TextEditingController controller;

  final String hintText;

  final bool obscureText;
  final bool enableSuggestions;
  final IconData Myicon;
  final TextInputType Mykeybord;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // var kype;
    // kype = type;
    // var kype;
    return Form(
      key: _formKey,
      child: TextFormField(
        keyboardType: Mykeybord,
        validator: RequiredValidator(errorText: "Required..*"),
        cursorColor: Colors.red[300],
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
            focusColor: Colors.red[300],
            suffixIcon: Icon(Myicon as IconData?),
            suffixIconColor: Colors.grey,
            hintStyle: TextStyle(
              color: Colors.grey[500],
            )),
      ),
    );
  }
}
