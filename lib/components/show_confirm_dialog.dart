// import 'package:flutter/cupertino.dart';
// import 'dart:js';

import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gaming_accessories_rent_app/auth/auth.dart';
import 'package:gaming_accessories_rent_app/pages/login.dart';

Future<void> showConfirm(
  BuildContext context,
) {
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Do You want to Logout?"),
          // content: Text(text),
          actions: [
            MaterialButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Cancel"),
            ),
            MaterialButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) => const Center(
                            child: CircularProgressIndicator(
                          color: Color.fromRGBO(255, 93, 78, 1),
                        )));
                FirebaseAuth.instance.signOut();
                Timer(const Duration(seconds: 2), () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute<void>(
                        builder: (BuildContext context) => const AuthPage()),
                    ModalRoute.withName('/'),
                  );
                });
              },
              child: const Text(
                "OK",
                style: TextStyle(
                  color: Color.fromRGBO(255, 93, 78, 1),
                ),
              ),
            )
          ],
        );
      });
}
