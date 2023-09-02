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
  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();
  void signin() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailTextController.text,
        password: passwordTextController.text,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'network-request-failed') {
        showError(
          context,
          'No Internet Connection',
        );

        //devtools.log('No Internet Connection');
      } else if (e.code == "wrong-password") {
        // return showErrorDialog(context, 'Please Enter correct password');
        //devtools.log('Please Enter correct password');
        showError(
          context,
          'Please Enter correct password',
        );
        //print('Please Enter correct password');
      } else if (e.code == 'user-not-found') {
        // showErrorDialog(context, 'Email not found');
        showError(
          context,
          'Email not found',
        );
        // print('Email not found');
      } else if (e.code == 'too-many-requests') {
        // return showErrorDialog(context, 'Too many attempts please try later');
        showError(
          context,
          'Too many attempts please try later',
        );
        //print('Too many attempts please try later');
      } else if (e.code == 'unknwon') {
        // showErrorDialog(context, 'Email and password field are required');
        showError(
          context,
          'Email and password field are required',
        );
        //print('Email and password field are required');
      } else if (e.code == 'unknown') {
        // showErrorDialog(context, 'Email and Password Fields are required');
        showError(
          context,
          'Email and Password Fields are required',
        );
        //print(e.code);
      } else {
        showError(
          context,
          'Some error in login',
        );
      }
    }
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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //icons or image
                    Image.asset(
                      "assets/images/Computer login-pana.png",
                      scale: 8,
                    ),
                    const SizedBox(
                      height: 30,
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
                    MyTextField(
                      controller: emailTextController,
                      hintText: "Enter the  Email",
                      obscureText: false,
                      enableSuggestions: true,
                      Myicon: Icons.mail_outline,
                      Mykeybord: TextInputType.emailAddress,
                    ),

                    const SizedBox(
                      height: 10,
                    ),
                    //password field
                    MyTextField(
                      controller: passwordTextController,
                      hintText: "Enter the Password",
                      obscureText: true,
                      enableSuggestions: false,
                      Myicon: Icons.remove_red_eye_outlined,
                      Mykeybord: TextInputType.visiblePassword,
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
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    //Signin Button
                    MyButton(
                      onTap: signin,
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
