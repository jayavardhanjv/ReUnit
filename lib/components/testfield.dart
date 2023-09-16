import 'package:flutter/material.dart';

class myfiled extends StatelessWidget {
  const myfiled({
    super.key,
    required this.hinttext,
    required this.validator,
    required this.Mykeybord,
    required this.enableSuggestions,
    required this.obscureText,
    required this.expand,
    required this.controller,
  });

  final String hinttext;
  final validator;
  final TextInputType Mykeybord;
  final bool enableSuggestions;
  final bool obscureText;
  final bool expand;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: Mykeybord,
      // maxLines: 5,
      // validator: validator,
      cursorColor: Colors.red[300],
      controller: controller,
      autofocus: true,
      obscureText: obscureText,
      enableSuggestions: enableSuggestions,
      expands: expand,
      decoration: InputDecoration(
          hintText: hinttext,
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
          suffixIcon: Icon(Icons.person),
          suffixIconColor: Colors.grey,
          hintStyle: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 12,
            color: Colors.grey[500],
          )),
      // keyboardType: TextInputType.emailAddress,
      onFieldSubmitted: (value) {
        //Validator
      },
      validator: (value) {
        return validator(value);
      },
    );
  }
}

String? vEmail(value) {
  if (value!.isEmpty ||
      !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
          .hasMatch(value)) {
    return 'Enter a valid email!';
  }
  return null;
}

String? vPassword(value) {
  if (value!.isEmpty ||
      !RegExp(r"^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\><*~]).{8,}/pre>")
          .hasMatch(value)) {
    return 'Enter a valid password!';
  }
  return null;
}

String? vName(value) {
  if (value!.isEmpty ||
      !RegExp(r"^\s*([A-Za-z]{1,}([\.,] |[-']| ))+[A-Za-z]+\.?\s*$")
          .hasMatch(value)) {
    return 'Enter a valid name!';
  }
  return null;
}

String? vPhone(value) {
  if (value!.isEmpty || !RegExp(r"^\+?0[0-9]{10}$").hasMatch(value)) {
    return 'Enter a valid PhoneNo!';
  }
  return null;
}
