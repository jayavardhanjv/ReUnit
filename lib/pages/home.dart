import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gaming_accessories_rent_app/auth/Login_or_register.dart';

import '../components/bottom_nav.dart';

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
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
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
                  color: Colors.grey[900],
                ))
          ],
        ),
        body: BottamNavBar());
  }
}
