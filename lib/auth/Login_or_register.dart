// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gaming_accessories_rent_app/pages/login.dart';
import 'package:gaming_accessories_rent_app/pages/register.dart';

class Login_or_Register extends StatefulWidget {
  const Login_or_Register({super.key});

  @override
  State<Login_or_Register> createState() => _Login_or_RegisterState();
}

class _Login_or_RegisterState extends State<Login_or_Register> {
  bool LoginShowPage = true;
  void toggalPage() {
    setState(() {
      LoginShowPage = !LoginShowPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (LoginShowPage == true) {
      // return LoginPage(onTap: toggalPage);
      return LoginPage(onTap: toggalPage);
    } else {
      return RegisterPage(onTap: toggalPage);
    }
  }
}
