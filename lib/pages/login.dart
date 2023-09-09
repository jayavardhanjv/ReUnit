import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gaming_accessories_rent_app/auth/auth_google.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
import 'package:gaming_accessories_rent_app/components/Text_field.dart';
import 'package:gaming_accessories_rent_app/components/button.dart';
import 'package:gaming_accessories_rent_app/pages/fogot_password.dart';

import '../components/show_error_dialog.dart';

// import '../components/showbox.dart';

class LoginPage extends StatefulWidget {
  final Function()? onTap;
  const LoginPage({
    super.key,
    required this.onTap,
  });
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var _formKey = GlobalKey<FormState>();
  var isLoading = false;
  final _email = TextEditingController();
  final _password = TextEditingController();
  void signin() async {
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
            child: CircularProgressIndicator(
          color: Color.fromRGBO(255, 93, 78, 1),
        ));
      },
    );
    Timer(Duration(seconds: 3), () async {
      try {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _email.text,
          password: _password.text,
        );
      } on FirebaseAuthException catch (e) {
        if (e.code == 'network-request-failed') {
          showError(context, 'No Internet Connection', 'an error occred');

          //devtools.log('No Internet Connection');
        } else if (e.code == "wrong-password") {
          // return showErrorDialog(context, 'Please Enter correct password');
          //devtools.log('Please Enter correct password');
          showError(
              context, 'Please Enter correct password', 'an error occred');
          //print('Please Enter correct password');
        } else if (e.code == 'user-not-found') {
          // showErrorDialog(context, 'Email not found');
          showError(context, 'Email not found', 'an error occred');
          // print('Email not found');
        } else if (e.code == 'too-many-requests') {
          // return showErrorDialog(context, 'Too many attempts please try later');
          showError(
              context, 'Too many attempts please try later', 'an error occred');
          //print('Too many attempts please try later');
        } else if (e.code == 'unknwon') {
          // showErrorDialog(context, 'Email and password field are required');
          showError(context, 'Email and password field are required',
              'an error occred');
          //print('Email and password field are required');
        } else if (e.code == 'unknown') {
          // showErrorDialog(context, 'Email and Password Fields are required');
          showError(context, 'Email and Password Fields are required',
              'an error occred');
          //print(e.code);
        } else {
          showError(context, 'Some error in login', 'an error occred');
        }
      }
      Navigator.of(context).pop();
    });
  }

  void _submit() {
    final isValid = _formKey.currentState?.validate();
    if (!isValid!) {
      return;
    }
    if (isValid) {
      // update();
      signin();
      print(FirebaseAuth.instance.currentUser!.emailVerified);
    }
    _formKey.currentState!.save();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      //icons or image
                      Image.asset(
                        "assets/images/Computer login-pana.png",
                        scale: 10,
                      ),

                      //welcome message
                      const Text(
                        "Welcome Back, We Missed You!",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      //email field
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
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
                            suffixIcon: Icon(Icons.person),
                            suffixIconColor: Colors.grey,
                            hintStyle: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 16,
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
                              fontSize: 16,
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
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              CupertinoPageRoute(
                                  builder: (context) =>
                                      const ForgotPasswordPage()),
                            );
                          },
                          child: const Text(
                            "Forgot Password?",
                            style: TextStyle(
                                color: Color.fromRGBO(255, 93, 78, 1),
                                fontWeight: FontWeight.w100,
                                fontFamily: "Poppins"),
                          ),
                        ),
                      ),

                      //Signin Button
                      MyButton(
                        onTap: _submit,
                        text: 'Sign In',
                      ),

                      const SizedBox(
                        height: 30,
                      ),
                      const Text("Or Sign in with",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          )),
                      const SizedBox(
                        height: 30,
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
                        height: 30,
                      ),
                      //register page

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Don't have an account?",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                              )),
                          const SizedBox(
                            width: 4,
                          ),
                          GestureDetector(
                            onTap: widget.onTap,
                            child: const Text(
                              "Register Now",
                              style: TextStyle(
                                color: Color.fromRGBO(255, 93, 78, 1),
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              )),
        ),
      ),
    );
  }
}

class DialogExample extends StatelessWidget {
  const DialogExample(
      {super.key, required String text, required String content});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('AlertDialog Title'),
          content: const Text('AlertDialog description'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'Cancel'),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context, 'OK'),
              child: const Text('OK'),
            ),
          ],
        ),
      ),
      child: const Text('Show Dialog'),
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
  if (value!.isEmpty || value.length < 6) {
    return 'Enter a valid password!';
  }
  return null;
}

String? vName(value) {
  if (value!.isEmpty ||
      !RegExp(r"^\s*([A-Za-z]{1,}([\.,] |[-']| ))+[A-Za-z]+\.?\s*$")
          .hasMatch(value)) {
    return 'Enter a valid name!';
  }
  return null;
}

String? vPhone(value) {
  if (value!.isEmpty || !RegExp(r"^\+?0[0-9]{10}$").hasMatch(value)) {
    return 'Enter a valid PhoneNo!';
  }
  return null;
}
