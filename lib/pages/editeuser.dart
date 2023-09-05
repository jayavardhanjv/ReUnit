import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gaming_accessories_rent_app/components/Text_field.dart';
import 'package:gaming_accessories_rent_app/pages/profile.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class EditUser extends StatefulWidget {
  const EditUser({
    super.key,
  });

  @override
  State<EditUser> createState() => _EditUserState();
}

class _EditUserState extends State<EditUser> {
  // final TextEditingController email;
  late final TextEditingController _email;
  late final TextEditingController _address;
  late final TextEditingController _phone;
  late final TextEditingController _username;

  FirebaseFirestore db = FirebaseFirestore.instance;
  String docid = '';

  Future GetuserDoc() async {
    FirebaseFirestore.instance.collection("UserData").doc(docid).update({
      'name': _username.text,
      'address': _address.text,
      'phoneNo': _phone.text,
      // 'email': _email.text
    }).then((value) => print("DocumentSnapshot successfully updated!"),
        onError: (e) => print("Error updating document $e"));
    ;
    showDialog(
        context: context,
        builder: (context) {
          return const Center(
              child: CircularProgressIndicator(
            color: Color.fromRGBO(255, 93, 78, 1),
          ));
        });
    Timer(Duration(seconds: 1), () {
      Navigator.of(context).pop();
      Navigator.of(context).pop();
      // Navigator.of(context).pushAndRemoveUntil(
      //     MaterialPageRoute(builder: (c) => UserProfile()), (route) => false);
    });
  }

  Future update() async {
    final String currentuid = FirebaseAuth.instance.currentUser!.uid;
    await FirebaseFirestore.instance
        .collection('UserData')
        .where("userid", isEqualTo: currentuid)
        .get()
        .then((snapshot) => snapshot.docs.forEach((element) {
              docid = element.id;
            }));
    // return docid;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    update();
    _email = TextEditingController();
    _address = TextEditingController();
    _phone = TextEditingController();
    _username = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _email.dispose();
    _address.dispose();
    _phone.dispose();
    _username.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 40, left: 20),
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // const Icon(
                  //   Icons.menu,
                  //   size: 30,
                  //   color: Colors.black87,
                  // ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Image.asset(
                      "assets/icons/left.png",
                      scale: 16,
                      color: Colors.black87,
                    ),
                  ),
                  Expanded(child: Container()),
                  Padding(
                    padding: const EdgeInsets.only(right: 50),
                    child: Container(
                      child: const Text(
                        "Edit Profile",
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 24),
                      ),
                    ),
                  ),
                  Expanded(child: Container()),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            // const Divider(),
            Container(
              height: 750,
              width: 350,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                // color: Colors.white70,
              ),
              child: Center(
                  child: Column(children: [
                const SizedBox(
                  height: 30,
                ),
                Stack(
                  children: [
                    SizedBox(
                      height: 120,
                      width: 120,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(180),
                        child: Image.asset(
                          "assets/images/photo.jpg",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        height: 35,
                        width: 35,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: Colors.red[300],
                        ),
                        child: Icon(LineAwesomeIcons.alternate_pencil),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                MyTextField(
                  expand: false,
                  controller: _username,
                  hintText: "Enter the Username",
                  obscureText: false,
                  enableSuggestions: true,
                  Myicon: Icons.person,
                  Mykeybord: TextInputType.text,
                ),
                // const SizedBox(
                //   height: 15,
                // ),
                // MyTextField(
                //   expand: false,
                //   controller: _email,
                //   hintText: "Enter the Email",
                //   obscureText: false,
                //   enableSuggestions: true,
                //   Myicon: Icons.mail_outline,
                //   Mykeybord: TextInputType.emailAddress,
                // ),
                const SizedBox(
                  height: 15,
                ),
                MyTextField(
                  expand: false,
                  controller: _phone,
                  hintText: "Enter the Phone Number",
                  obscureText: false,
                  enableSuggestions: true,
                  Myicon: Icons.mobile_friendly,
                  Mykeybord: TextInputType.number,
                ),
                const SizedBox(
                  height: 15,
                ),
                MyTextField(
                  expand: false,
                  controller: _address,
                  hintText: "Enter the Address",
                  obscureText: false,
                  enableSuggestions: true,
                  Myicon: Icons.location_city,
                  Mykeybord: TextInputType.streetAddress,
                ),
                const SizedBox(
                  height: 30,
                ),
                SizedBox(
                  width: 200,
                  height: 60,
                  child: ElevatedButton(
                    onPressed: () {
                      // update();
                      GetuserDoc();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromRGBO(255, 93, 78, 1),
                      shape: StadiumBorder(),
                    ),
                    child: Text("Confirm"),
                  ),
                ),
              ])),
            ),
          ],
        ),
      ),
    );
  }
}
