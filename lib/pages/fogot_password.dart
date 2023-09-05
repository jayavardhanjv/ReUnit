import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gaming_accessories_rent_app/auth/auth_google.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
import 'package:gaming_accessories_rent_app/components/Text_field.dart';
import 'package:gaming_accessories_rent_app/components/button.dart';

import '../components/show_error_dialog.dart';

// import '../components/showbox.dart';

class ForgotPasswordPage extends StatefulWidget {
  // final Function()? onTap;
  const ForgotPasswordPage({
    super.key,
    // required this.onTap,
  });
  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();
  void signin() async {
    showDialog(
        context: context,
        builder: (context) {
          return const Center(
              child: CircularProgressIndicator(
            color: Color.fromRGBO(255, 93, 78, 1),
          ));
        });
    Timer(const Duration(seconds: 2), () async {
      Navigator.of(context).pop();

      try {
        await FirebaseAuth.instance.sendPasswordResetEmail(
          email: emailTextController.text,
          // actionCodeSettings:
        );
        // Navigator.of(context).pop();
        return showError(
            context,
            'Password reset Email has been sent,Please check your mail',
            'an error occred');
      } on FirebaseAuthException catch (e) {
        if (e.code == 'invaild-email') {
          showError(context, 'Email is not valid', 'an error occred');

          //devtools.log('No Internet Connection');
        } else if (e.code == "user-not-found") {
          // return showErrorDialog(context, 'Please Enter correct password');
          //devtools.log('Please Enter correct password');
          showError(context, 'No user found Associated to this email',
              'an error occred');
          //print('Please Enter correct password');
        } else {
          showError(context, 'Some error ', 'an error occred');
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //icons or image
                  Image.asset(
                    "assets/images/Forgot password-pana.png",
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  //welcome message
                  const Text(
                    "Enter the email associated with your account to change your password.",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  //email field
                  MyTextField(
                    expand: false,
                    controller: emailTextController,
                    hintText: "Enter the  Email",
                    obscureText: false,
                    enableSuggestions: true,
                    Myicon: Icons.mail_outline_outlined,
                    Mykeybord: TextInputType.emailAddress,
                  ),

                  const SizedBox(
                    height: 10,
                  ),
                  //password field

                  const SizedBox(
                    height: 10,
                  ),
                  //Signin Button
                  MyButton(
                    onTap: signin,
                    text: 'Send mail',
                  ),
                ],
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
