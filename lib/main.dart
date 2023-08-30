import 'package:flutter/material.dart';
import 'package:gaming_accessories_rent_app/Login_or_register.dart';
import 'pages/login.dart';
import 'pages/register.dart';
import 'pages/test.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: const Login_or_Register(),
    );
  }
}
