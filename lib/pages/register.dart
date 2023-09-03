import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
import 'package:gaming_accessories_rent_app/components/Text_field.dart';
import 'package:gaming_accessories_rent_app/components/button.dart';

import '../auth/auth_google.dart';
import '../auth/userregister.dart';
import '../components/show_error_dialog.dart';

class RegisterPage extends StatefulWidget {
  final Function()? onTap;
  const RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  late final TextEditingController _email;
  late final TextEditingController _password;
  late final TextEditingController _phone;
  late final TextEditingController _username;
  FirebaseFirestore db = FirebaseFirestore.instance;
  CollectionReference user = FirebaseFirestore.instance.collection('UserData');

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _email = TextEditingController();
    _password = TextEditingController();
    _phone = TextEditingController();
    _username = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _email.dispose();
    _password.dispose();
    _phone.dispose();
    _username.dispose();
  }

  Future<void> addUser(String userid) {
    return user
        .add({
          'name': _username.text,
          'email': _email.text,
          'phoneNo': _phone.text,
          'userid': userid,
        })
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }

  void signup() async {
    showDialog(
        context: context,
        builder: (context) {
          return const Center(
            child: CircularProgressIndicator(
              color: Color.fromRGBO(255, 93, 78, 1),
            ),
          );
        });
    Timer(Duration(seconds: 2), () async {
      Navigator.of(context).pop();

      try {
        final credential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _email.text,
          password: _password.text,
        );

        final currentUser = FirebaseAuth.instance.currentUser!.uid;
        final userId = currentUser;
        addUser(userId);
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          // print('The password provided is too weak.');
          showError(
            context,
            'The password provided is too weak.',
          );
        } else if (e.code == 'email-already-in-use') {
          showError(context, 'The account already exists for that email.');
        } else {
          showError(context, 'some error in registration');
        }
      } catch (e) {
        print(e);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    CollectionReference user =
        FirebaseFirestore.instance.collection('UserData');
    // Future<void> addUser() {
    //   return user
    //       .add({
    //         'name': _username.text,
    //         'email': _email.text,
    //         'phoneNo': _phone.text,
    //       })
    //       .then((value) => print("User Added"))
    //       .catchError((error) => print("Failed to add user: $error"));
    // }

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //icons or image
                  Image.asset(
                    "assets/images/Sign up-pana.png",
                    scale: 12,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  //welcome message
                  const Text(
                    "Lets Create an Account for you",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  //email field
                  MyTextField(
                    controller: _email,
                    hintText: "Enter the Email",
                    obscureText: false,
                    enableSuggestions: true,
                    Myicon: Icons.mail_outline,
                    Mykeybord: TextInputType.emailAddress,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  MyTextField(
                    controller: _username,
                    hintText: "Enter the User Name",
                    obscureText: false,
                    enableSuggestions: true,
                    Myicon: Icons.person_2_outlined,
                    Mykeybord: TextInputType.name,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  MyTextField(
                    controller: _phone,
                    hintText: "Enter the Phone Number",
                    obscureText: false,
                    enableSuggestions: true,
                    Myicon: Icons.phone_android_outlined,
                    Mykeybord: TextInputType.number,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  //password field
                  MyTextField(
                    controller: _password,
                    hintText: "Enter the Password",
                    obscureText: true,
                    enableSuggestions: false,
                    Myicon: Icons.remove_red_eye_outlined,
                    Mykeybord: TextInputType.visiblePassword,
                  ),
                  // const SizedBox(
                  //   height: 10,
                  // ),
                  //Password re enter
                  // MyTextField(
                  //   controller: RenterTextController,
                  //   hintText: "Re-Enter Password",
                  //   obscureText: true,
                  //   enableSuggestions: false,
                  //   Myicon: Icons.remove_red_eye_outlined,
                  // ),
                  const SizedBox(
                    height: 30,
                  ),
                  //Signin Button
                  MyButton(
                    onTap: signup,
                    text: 'Sign Up',
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  //register page
                  const Text("Or Create Account with",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      )),
                  const SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      AuthGoogle().SigninWithGoogle();
                    },
                    child: Container(
                      height: 60,
                      width: 60,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black,
                            offset: Offset(0, 2),
                            blurRadius: 6,
                          )
                        ],
                        image: DecorationImage(
                          image: AssetImage("assets/google.png"),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Already have an account?",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          )),
                      const SizedBox(
                        width: 4,
                      ),
                      GestureDetector(
                        onTap: widget.onTap,
                        child: Text(
                          "Sign In",
                          style: TextStyle(
                              color: Color.fromRGBO(255, 93, 78, 1),
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
