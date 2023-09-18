import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gaming_accessories_rent_app/auth/Login_or_register.dart';
import 'package:gaming_accessories_rent_app/pages/fogot_password.dart';
import 'package:gaming_accessories_rent_app/pages/mainPage.dart';
import 'package:gaming_accessories_rent_app/pages/verifyemail.dart';

// import '../pages/home.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          final user = snapshot.data;
          if (user != null) {
            // Check if the user's email is verified
            bool isEmailVerified = user.emailVerified;
            // Now you can use isEmailVerified in your UI
            if (isEmailVerified == true) {
              return MainPage();
            } else {
              return VerifyEmail();
            }
          } else {
            // User is not signed in
            return Login_or_Register();
          }
        } else {
          // Connection state is not active yet
          return MainPage();
        }
      },
    );
  }
}
