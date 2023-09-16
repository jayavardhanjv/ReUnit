// import 'dart:async';
import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:gaming_accessories_rent_app/components/Text_field.dart';
import 'package:gaming_accessories_rent_app/components/uitility.dart';
import 'package:gaming_accessories_rent_app/pages/profile.dart';
import 'package:gaming_accessories_rent_app/pages/register.dart';
import 'package:image_picker/image_picker.dart';
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
  late final TextEditingController _email = TextEditingController();
  late final TextEditingController _address = TextEditingController();
  late final TextEditingController _phone = TextEditingController();
  late final TextEditingController _username = TextEditingController();

  FirebaseFirestore db = FirebaseFirestore.instance;
  String docid = '';

  Future GetuserDoc() async {
    FirebaseFirestore.instance.collection("UserData").doc(docid).update({
      'name': _username.text,
      'address': _address.text,
      'phoneNo': _phone.text,
      'profile image': imageUrl,
      // '_': _.text
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
  late File file;
  late String imageUrl;
  Future<void> addImage() async {
    try {
      final imagePicker = ImagePicker();
      final XFile? image =
          await imagePicker.pickImage(source: ImageSource.gallery);

      if (image != null) {
        _image = await image.readAsBytes();
        setState(() {
          file = File(image.path);
          uploadProfileImage();
        });
      }
    } catch (e) {
      print("Error: $e");
    }
  }

  final String currentuid = FirebaseAuth.instance.currentUser!.uid;
  uploadProfileImage() async {
    Reference reference =
        FirebaseStorage.instance.ref().child('profileImage/${currentuid}');
    UploadTask uploadTask = reference.putFile(file);
    TaskSnapshot snapshot = await uploadTask;
    imageUrl = await snapshot.ref.getDownloadURL();
    print(imageUrl);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    update();
    _image;
    _email;
    _address;
    _phone;
    _username;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    update();
    _image;
    _email;
    _address;
    _phone;
    _username;
  }

  void _submit() {
    final isValid = _formKey.currentState?.validate();
    if (!isValid!) {
      return;
    }
    if (isValid) {
      // update();
      GetuserDoc();
      // print(FirebaseAuth.instance.currentUser!._Verified);
    }
    _formKey.currentState!.save();
  }

  var _formKey = GlobalKey<FormState>();
  var isLoading = false;

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
                      scale: 14,
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
                key: _formKey,
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
                          addImage();
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
                  TextFormField(
                    keyboardType: TextInputType.name,
                    // maxLines: 5,
                    // validator: validator,
                    cursorColor: Colors.red[300],
                    controller: _username,
                    // autofocus: true,
                    obscureText: false,
                    enableSuggestions: true,
                    expands: false,
                    decoration: InputDecoration(
                        hintText: "Enter  the  Name",
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
                          fontSize: 14,
                          color: Colors.grey[500],
                        )),
                    // keyboardType: TextInputType._Address,
                    onFieldSubmitted: (value) {
                      //Validator
                    },
                    validator: (value) {
                      return vAddress(value);
                    },
                  ),
                  // const SizedBox(
                  //   height: 15,
                  // ),
                  // MyTextField(
                  //   expand: false,
                  //   controller: __,
                  //   hintText: "Enter the Email",
                  //   obscureText: false,
                  //   enableSuggestions: true,
                  //   Myicon: Icons.mail_outline,
                  //   Mykeybord: TextInputType.emailAddress,
                  // ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    // maxLines: 5,
                    // validator: validator,
                    cursorColor: Colors.red[300],
                    controller: _phone,
                    // autofocus: true,
                    obscureText: false,
                    enableSuggestions: true,
                    expands: false,
                    decoration: InputDecoration(
                        hintText: "Enter  the  PhoneNo",
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
                        suffixIcon: Icon(Icons.phone_android),
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
                    height: 15,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.text,
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
                        suffixIcon: Icon(Icons.navigation_outlined),
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
                    height: 30,
                  ),
                  SizedBox(
                    width: 200,
                    height: 60,
                    child: ElevatedButton(
                      onPressed: () {
                        // update();
                        _submit();
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
  if (value!.isEmpty || !RegExp(r"^[0-9]{10}$").hasMatch(value)) {
    return 'Enter a valid 10-digit phone number!';
  }
  return null;
}
