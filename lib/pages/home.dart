import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gaming_accessories_rent_app/auth/Login_or_register.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void logout() {
    FirebaseAuth.instance.signOut();
    // return Login_or_Register();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Icon(
          Icons.menu,
          color: Colors.grey[900],
        ),
        title: Text(
          "ReUnite",
          style: TextStyle(color: Colors.grey[900]),
        ),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
              onPressed: logout,
              icon: Icon(
                Icons.logout_outlined,
              ))
        ],
      ),
      body: Center(child: Text("data")),
    );
  }
}
