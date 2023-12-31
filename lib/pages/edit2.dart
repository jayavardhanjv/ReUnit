// import 'dart:async';
import 'dart:async';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:gaming_accessories_rent_app/components/Text_field.dart';
import 'package:gaming_accessories_rent_app/components/uitility.dart';
import 'package:gaming_accessories_rent_app/pages/profile.dart';
import 'package:gaming_accessories_rent_app/pages/test.dart';
import 'package:image_picker/image_picker.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class MyEditUser extends StatefulWidget {
  const MyEditUser({
    super.key,
  });

  @override
  State<MyEditUser> createState() => _MyEditUserState();
}

class _MyEditUserState extends State<MyEditUser> {
  // final TextEditingController email;
  static late final TextEditingController email = TextEditingController();
  static late final TextEditingController address = TextEditingController();
  static late final TextEditingController phone = TextEditingController();
  static late final TextEditingController username = TextEditingController();

  FirebaseFirestore db = FirebaseFirestore.instance;
  String docid = '';

  Future GetuserDoc() async {
    FirebaseFirestore.instance.collection("UserData").doc(docid).update({
      'name': username.text,
      'address': address.text,
      'phoneNo': phone.text,
      // 'email': email.text
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

  Uint8List? _image;
  Future addimage() async {
    try {
      Uint8List img = await MyImagPicker(ImageSource.gallery);
      _image = img;
    } catch (e) {
      print("error");
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    update();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  GlobalKey<FormState> _form = GlobalKey<FormState>();

  void _validate() {
    _form.currentState?.validate();
  }

  final _formKey = GlobalKey<FormState>();
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
              width: MediaQuery.of(context).size.width - 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                // color: Colors.white70,
              ),
              child: Center(
                  child: Form(
                key: _form,
                child: Column(children: [
                  const SizedBox(
                    height: 30,
                  ),
                  Stack(
                    children: [
                      _image != null
                          ? CircleAvatar(
                              radius: 64,
                              backgroundImage: MemoryImage(_image!),
                            )
                          : CircleAvatar(
                              radius: 64,
                              backgroundImage: NetworkImage(
                                  "https://w7.pngwing.com/pngs/78/788/png-transparent-computer-icons-avatar-business-computer-software-user-avatar-child-face-hand-thumbnail.png"),
                            ),
                      GestureDetector(
                        onTap: () {
                          addimage();
                        },
                        child: Positioned(
                          bottom: 50,
                          left: 50,
                          child: Container(
                            height: 35,
                            width: 35,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: Colors.red[300],
                            ),
                            child: Icon(LineAwesomeIcons.alternate_pencil),
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  // need to add form field
                  MyTextField(
                    // validator:
                    //     ValidationBuilder().email().maxLength(50).build(),
                    controller: email,
                    hintText: '',
                    obscureText: false,
                    enableSuggestions: true,
                    Myicon: Icons.person,
                    Mykeybord: TextInputType.emailAddress,
                    expand: false,
                    // inputFormatters: [],
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
                        // GetuserDoc();
                        // _validate();
                        // Mytest();
                        Navigator.of(context).push(
                          MaterialPageRoute<void>(
                            builder: (BuildContext context) => const Mytest(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromRGBO(255, 93, 78, 1),
                        shape: StadiumBorder(),
                      ),
                      child: Text(
                        "Confirm",
                        style: TextStyle(
                          fontFamily: 'Poppins',
                        ),
                      ),
                    ),
                  ),
                ]),
              )),
            ),
          ],
        ),
      ),
    );
  }
}
