import 'dart:ffi';

import 'package:flutter/material.dart';
// import 'package:form_field_validator/form_field_validator.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserRegister extends StatelessWidget {
  const UserRegister({
    super.key,
    required this.name,
    required this.email,
    required this.phoneNo,
    // required this.email,
  });
  final String name;
  final String email;
  final String phoneNo;

  @override
  Widget build(BuildContext context) {
    CollectionReference user =
        FirebaseFirestore.instance.collection('UserData');
    Future<void> addUser() {
      return user
          .add({
            'name': name,
            'email': email,
            'phoneNo': phoneNo,
          })
          .then((value) => print("User Added"))
          .catchError((error) => print("Failed to add user: $error"));
    }

    return Container();
  }
}
