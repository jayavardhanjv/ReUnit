import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gaming_accessories_rent_app/auth/Login_or_register.dart';
import 'package:gaming_accessories_rent_app/pages/mainPage.dart';
import 'package:gaming_accessories_rent_app/pages/verifyemail.dart';

// import '../pages/home.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: ((context, snapshot) {
        if (snapshot.hasData) {
          return const MainPage();
        } else {
          return const Login_or_Register();
          // print(FirebaseAuth.instance.currentUser!.emailVerified);
        }
      }),
    );
  }
}
