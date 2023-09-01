import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
import 'package:gaming_accessories_rent_app/components/Text_field.dart';
import 'package:gaming_accessories_rent_app/components/button.dart';

import '../auth/auth_google.dart';
import '../components/show_error_dialog.dart';

class RegisterPage extends StatefulWidget {
  final Function()? onTap;
  const RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();
  final RenterTextController = TextEditingController();
  void signup() async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailTextController.text,
        password: passwordTextController.text,
      );
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //icons or image
                const Icon(
                  Icons.airplay_rounded,
                  size: 100,
                ),
                const SizedBox(
                  height: 30,
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
                  height: 50,
                ),
                //email field
                MyTextField(
                  controller: emailTextController,
                  hintText: "Enter the Email",
                  obscureText: false,
                  enableSuggestions: true,
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
                ),
                const SizedBox(
                  height: 10,
                ),
                //Password re enter
                MyTextField(
                  controller: RenterTextController,
                  hintText: "Re-Enter Password",
                  obscureText: true,
                  enableSuggestions: false,
                ),
                const SizedBox(
                  height: 20,
                ),
                //Signin Button
                MyButton(
                  onTap: signup,
                  text: 'Sign Up',
                ),
                const SizedBox(
                  height: 30,
                ),
                //register page
                const Text("Or Create Account with",
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
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
