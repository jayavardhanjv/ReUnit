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
    required this.expand,
  });

  final TextEditingController controller;

  final String hintText;

  final bool obscureText;
  final bool enableSuggestions;
  final IconData Myicon;
  final TextInputType Mykeybord;
  final bool expand;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // var kype;
    // kype = type;
    // var kype;
    return Form(
      key: _formKey,
      child: SizedBox(
        width: MediaQuery.of(context).size.width - 30,
        child: TextFormField(
          keyboardType: Mykeybord,
          // maxLines: 5,
          validator: RequiredValidator(errorText: "Required..*"),
          cursorColor: Colors.red[300],
          controller: controller,
          obscureText: obscureText,
          enableSuggestions: enableSuggestions,
          expands: expand,
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
                fontFamily: 'Poppins',
                fontSize: 12,
                color: Colors.grey[500],
              )),
        ),
      ),
    );
  }
}
