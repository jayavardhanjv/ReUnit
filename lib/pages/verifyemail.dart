import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gaming_accessories_rent_app/auth/Login_or_register.dart';
import 'package:gaming_accessories_rent_app/auth/auth_google.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
import 'package:gaming_accessories_rent_app/components/Text_field.dart';
import 'package:gaming_accessories_rent_app/components/button.dart';
import 'package:gaming_accessories_rent_app/pages/login.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import '../components/show_error_dialog.dart';

// import '../components/showbox.dart';

class VerifyEmail extends StatefulWidget {
  // final Function()? onTap;
  const VerifyEmail({
    super.key,
    // required this.onTap,
  });
  @override
  State<VerifyEmail> createState() => _VerifyEmailState();
}

class _VerifyEmailState extends State<VerifyEmail> {
  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();
  final email = FirebaseAuth.instance.currentUser!.email;
  var acs = ActionCodeSettings(
      // URL you want to redirect back to. The domain (www.example.com) for this
      // URL must be whitelisted in the Firebase Console.
      url: 'https://www.example.com/finishSignUp?cartId=1234',
      // This must be true
      handleCodeInApp: true,
      iOSBundleId: 'com.example.ios',
      androidPackageName: 'com.example.android',
      // installIfNotAvailable
      androidInstallApp: true,
      // minimumVersion
      androidMinimumVersion: '12');
  void signin() async {
    try {
      FirebaseAuth.instance.currentUser?.sendEmailVerification();
      print(email);
    } on Exception catch (e) {
      // TODO
      print("${e}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //icons or image
                    Image.asset(
                      "assets/images/Forgot password-pana.png",
                      scale: 7,
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    //welcome message
                    const Text(
                      "Thank you for signing up with ReUnite. To ensure the security of your account and to activate your membership, we need to verify your email address.",
                      style: TextStyle(
                        fontFamily: "Poppins",
                        color: Colors.black,
                        fontSize: 15,
                        // fontWeight: FontWeight.w400,
                      ),
                      textAlign: TextAlign.center,
                    ),

                    //email field

                    const SizedBox(
                      height: 30,
                    ),
                    //password field
                    Center(
                        child: CircularProgressIndicator(
                      color: Color.fromRGBO(255, 93, 78, 1),
                    )),

                    const SizedBox(
                      height: 20,
                    ),
                    //Signin Button
                    MyButton(
                      onTap: signin,
                      text: 'Resend Verification Email',
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          CupertinoPageRoute<void>(
                            builder: (BuildContext context) =>
                                Login_or_Register(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        shape: StadiumBorder(),
                      ),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.3,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Icon(
                              LineAwesomeIcons.alternate_sign_out,
                              color: Color.fromRGBO(255, 93, 78, 1),
                            ),
                            const Text(
                              "Back to Login",
                              style: TextStyle(
                                color: Color.fromRGBO(255, 93, 78, 1),
                                fontFamily: 'Poppins',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                )),
          ),
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
