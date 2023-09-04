import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class MyAuthService extends StatelessWidget {
  const MyAuthService({super.key});
  Future<void> logout() async {
    // showDialog(
    //     context: context,
    //     builder: (context) {
    //       CircularProgressIndicator();
    //     });
    FirebaseAuth.instance.signOut();
    // return Login_or_Register();
    // showError(context, 'text');
  }

  Future<void> currentUser() async {}
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
