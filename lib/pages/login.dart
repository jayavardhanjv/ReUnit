import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
import 'package:gaming_accessories_rent_app/components/Text_field.dart';
import 'package:gaming_accessories_rent_app/components/button.dart';

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
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: emailTextController.text,
      password: passwordTextController.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange[500],
      body: SafeArea(
        child: Center(
          child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //icons or image
                  const Icon(
                    Icons.lock_outline_rounded,
                    size: 100,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  //welcome message
                  const Text(
                    "Welcome Back, We Missed You!",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  //email field
                  MyTextField(
                    controller: emailTextController,
                    hintText: "Enter the  Email",
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
                  //Signin Button
                  MyButton(
                    onTap: signin,
                    text: 'Sign In',
                  ),

                  const SizedBox(
                    height: 30,
                  ),
                  const Text("-OR-",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      )),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text("Sign in with",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      )),
                  const SizedBox(
                    height: 30,
                  ),
                  GestureDetector(
                    onTap: () {},
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
                            color: Colors.white,
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
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
