import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
import 'package:gaming_accessories_rent_app/components/Text_field.dart';
import 'package:gaming_accessories_rent_app/components/button.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

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
  late final TextEditingController _address;
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
    _address = TextEditingController();
    _password = TextEditingController();
    _phone = TextEditingController();
    _username = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _email.dispose();
    _address.dispose();
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
          'address': _address.text,
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
      try {
        final credential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _email.text,
          password: _password.text,
        );
        Timer(Duration(microseconds: 50), () {
          final currentUser = FirebaseAuth.instance.currentUser!.uid;
          FirebaseAuth.instance.currentUser?.sendEmailVerification();
          final userId = currentUser;
          addUser(userId);
        });
        print(FirebaseAuth.instance.currentUser!.emailVerified);
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          // print('The password provided is too weak.');
          showError(
              context, 'The password provided is too weak.', 'an error occred');
        } else if (e.code == 'email-already-in-use') {
          showError(context, 'The account already exists for that email.',
              'an error occred');
        } else {
          showError(context, 'some error in registration', 'an error occred');
        }
      } catch (e) {
        print(e);
      }
      Navigator.of(context).pop();
    });
  }

  var _formKey = GlobalKey<FormState>();
  var isLoading = false;

  void _submit() {
    final isValid = _formKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    if (isValid) {
      signup();
    }
    _formKey.currentState!.save();
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
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //icons or image

                    //welcome message
                    const Text(
                      "Lets Create an Account for you",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    //email field
                    TextFormField(
                      keyboardType: TextInputType.visiblePassword,
                      // maxLines: 5,
                      // validator: validator,
                      cursorColor: Colors.red[300],
                      controller: _email,
                      // autofocus: true,
                      obscureText: false,
                      enableSuggestions: true,
                      expands: false,
                      decoration: InputDecoration(
                          hintText: "Enter  the  Email",
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
                          suffixIcon: Icon(Icons.lock),
                          suffixIconColor: Colors.grey,
                          hintStyle: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 14,
                            color: Colors.grey[500],
                          )),
                      // keyboardType: TextInputType.emailAddress,
                      onFieldSubmitted: (value) {
                        //Validator
                      },
                      validator: (value) {
                        return vEmail(value);
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.visiblePassword,
                      // maxLines: 5,
                      // validator: validator,
                      cursorColor: Colors.red[300],
                      controller: _username,
                      // autofocus: true,
                      obscureText: false,
                      enableSuggestions: true,
                      expands: false,
                      decoration: InputDecoration(
                          hintText: "Enter  the  User  Name",
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
                          suffixIcon: Icon(Icons.lock),
                          suffixIconColor: Colors.grey,
                          hintStyle: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 14,
                            color: Colors.grey[500],
                          )),
                      // keyboardType: TextInputType.emailAddress,
                      onFieldSubmitted: (value) {
                        //Validator
                      },
                      validator: (value) {
                        return vName(value);
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.visiblePassword,
                      // maxLines: 5,
                      // validator: validator,
                      cursorColor: Colors.red[300],
                      controller: _phone,
                      // autofocus: true,
                      obscureText: false,
                      enableSuggestions: true,
                      expands: false,
                      decoration: InputDecoration(
                          hintText: "Enter  the  Phone Number",
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
                          suffixIcon: Icon(Icons.lock),
                          suffixIconColor: Colors.grey,
                          hintStyle: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 14,
                            color: Colors.grey[500],
                          )),
                      // keyboardType: TextInputType.emailAddress,
                      onFieldSubmitted: (value) {
                        //Validator
                      },
                      validator: (value) {
                        return vPhone(value);
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.visiblePassword,
                      // maxLines: 5,
                      // validator: validator,
                      cursorColor: Colors.red[300],
                      controller: _address,
                      // autofocus: true,
                      obscureText: false,
                      enableSuggestions: true,
                      expands: false,
                      decoration: InputDecoration(
                          hintText: "Enter  the  Address",
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
                          suffixIcon: Icon(Icons.lock),
                          suffixIconColor: Colors.grey,
                          hintStyle: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 14,
                            color: Colors.grey[500],
                          )),
                      // keyboardType: TextInputType.emailAddress,
                      onFieldSubmitted: (value) {
                        //Validator
                      },
                      validator: (value) {
                        return vAddress(value);
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    //password field
                    TextFormField(
                      keyboardType: TextInputType.visiblePassword,
                      // maxLines: 5,
                      // validator: validator,
                      cursorColor: Colors.red[300],
                      controller: _password,
                      // autofocus: true,
                      obscureText: false,
                      enableSuggestions: true,
                      expands: false,
                      decoration: InputDecoration(
                          hintText: "Enter  the  Password",
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
                          suffixIcon: Icon(Icons.lock),
                          suffixIconColor: Colors.grey,
                          hintStyle: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 14,
                            color: Colors.grey[500],
                          )),
                      // keyboardType: TextInputType.emailAddress,
                      onFieldSubmitted: (value) {
                        //Validator
                      },
                      validator: (value) {
                        return vPassword(value);
                      },
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
                      onTap: _submit,
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
      ),
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
  if (value!.isEmpty || value.length < 8) {
    return 'Enter a valid password!';
  }
  return null;
}

String? vName(value) {
  if (value!.isEmpty || !RegExp(r"^[A-Za-z\s]+$").hasMatch(value)) {
    return 'Enter a valid name!';
  }
  return null;
}

String? vPhone(value) {
  if (value!.isEmpty || !RegExp(r"^[0-9]{10}$").hasMatch(value)) {
    return 'Enter a valid 10-digit phone number!';
  }
  return null;
}

String? vAddress(value) {
  if (value!.isEmpty || !RegExp(r"^[A-Za-z0-9\s,.-]+$").hasMatch(value)) {
    return 'Enter a valid address!';
  }
  return null;
}
