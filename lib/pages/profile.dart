import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gaming_accessories_rent_app/pages/edit2.dart';
import 'package:gaming_accessories_rent_app/pages/editeuser.dart';

import 'package:gaming_accessories_rent_app/pages/infoPage.dart';

import 'package:gaming_accessories_rent_app/pages/notification_page.dart';
import 'package:gaming_accessories_rent_app/pages/test.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import '../components/bigText.dart';
import '../components/show_confirm_dialog.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  List docId = [];
  var identifier = new Map();
  String name = '';
  final String joined_data = FirebaseAuth.instance.currentUser!.uid;
  Future _getDocID() async {
    try {
      final String currentuid = FirebaseAuth.instance.currentUser!.uid;

      await FirebaseFirestore.instance
          .collection("UserData")
          .where('userid', isEqualTo: currentuid)
          .get()
          .then(
            (snapshot) => snapshot.docs.forEach((element) {
              identifier.addAll(element.data());
              username = identifier['name'];
              useremail = identifier['email'];
              useraddress = identifier['address'];
              userph = identifier['phoneNo'];
              try {
                userimage = identifier['profile image'];
              } catch (e) {
                print("noimage");
              }
            }),
          );
    } catch (e) {
      print("error");
    }
  }

  String username = '';
  String useremail = '';
  String useraddress = '';
  String userph = '';
  String userimage = '';
  final String currentuid = FirebaseAuth.instance.currentUser!.uid;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getDocID();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _getDocID();
  }

  // final username = FirebaseFirestore.instance
  //     .collection('users')
  //     .get()
  //     .then((QuerySnapshot querySnapshot) {
  //   querySnapshot.docs.forEach((doc) {
  //     print(doc["name"]);
  //   });
  // });

  @override
  Widget build(BuildContext context) {
    String _imagedata;
    try {
      if (userimage != '') {
        _imagedata = userimage;
      } else {
        _imagedata =
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSrL-6SWu9yRIXoTaEFrIrmrXn6mY4iHEpXo0LuyI-U_EVWxqa84huhkkYeFDq7G3NO50U&usqp=CAU";
      }
    } catch (e) {
      _imagedata =
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSrL-6SWu9yRIXoTaEFrIrmrXn6mY4iHEpXo0LuyI-U_EVWxqa84huhkkYeFDq7G3NO50U&usqp=CAU";
    }
    return Scaffold(
      body: FutureBuilder(
        future: _getDocID(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          return SingleChildScrollView(
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
                            "Profile",
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
                const SizedBox(
                  height: 30,
                ),
                Container(
                  padding: EdgeInsets.all(8),
                  height: 700,
                  width: MediaQuery.of(context).size.width - 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.white70,
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 30,
                      ),
                      Stack(
                        children: [
                          SizedBox(
                            height: 120,
                            width: 120,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(180),
                              child: Image.network(
                                _imagedata,
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
                        height: 20,
                      ),
                      FutureBuilder(
                        future: _getDocID(),
                        builder: (context, snapshot) {
                          return Text(
                            username,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 20,
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.w400),
                          );
                        },
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      FutureBuilder(
                        future: _getDocID(),
                        builder: (BuildContext context,
                            AsyncSnapshot<dynamic> snapshot) {
                          return Text(
                            "Email:   ${useremail}",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 14,
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.w400),
                          );
                        },
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      FutureBuilder(
                        future: _getDocID(),
                        builder: (BuildContext context,
                            AsyncSnapshot<dynamic> snapshot) {
                          return Text(
                            "Address:   ${useraddress}",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 14,
                              fontFamily: "Poppins",
                            ),
                          );
                        },
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      FutureBuilder(
                        future: _getDocID(),
                        builder: (BuildContext context,
                            AsyncSnapshot<dynamic> snapshot) {
                          return Text(
                            "Phno:   ${userph}",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 14,
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.w400),
                          );
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        width: 200,
                        height: 60,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              CupertinoPageRoute(
                                  builder: (context) => EditUser()),
                            ).then((value) => setState(() {}));
                            // Navigator.of(context).push(
                            //   MaterialPageRoute<void>(
                            //     builder: (BuildContext context) =>
                            //         const Mytest(),
                            //   ),
                            // );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromRGBO(255, 93, 78, 1),
                            shape: StadiumBorder(),
                          ),
                          child: const Text(
                            "Edit data",
                            style: TextStyle(
                              fontFamily: 'Poppins',
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      const Divider(),
                      const SizedBox(
                        height: 10,
                      ),
                      Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(
                                CupertinoPageRoute<void>(
                                  builder: (BuildContext context) =>
                                      const InfoPage(),
                                ),
                              );
                            },
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.only(),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 40,
                                      height: 40,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(100),
                                        color: Color.fromRGBO(255, 93, 78, 1),
                                      ),
                                      child: Center(
                                        child: Icon(
                                          LineAwesomeIcons.info,
                                          color: Colors.white,
                                          // weight: ,
                                          size: 25,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 30,
                                    ),
                                    Text(
                                      "Information",
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                        fontFamily: 'Poppins',
                                      ),
                                    ),
                                    SizedBox(
                                      width: 40,
                                    ),
                                    Container(
                                        width: 40,
                                        height: 40,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(100),
                                            color:
                                                Color.fromRGBO(255, 93, 78, 1)),
                                        // padding: EdgeInsets.only(left: 20),
                                        child: Image.asset(
                                          "assets/icons/right-arrow.png",
                                          color: Colors.white,
                                          scale: 30,
                                        )),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          GestureDetector(
                            onTap: () {
                              showConfirm(context);
                              print("username");
                            },
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.only(right: 50),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 40,
                                      height: 40,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(100),
                                        color: Color.fromRGBO(255, 93, 78, 1),
                                      ),
                                      child: Center(
                                        child: Icon(
                                          LineAwesomeIcons.alternate_sign_out,
                                          color: Colors.white,
                                          // weight: ,
                                          size: 25,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 50,
                                    ),
                                    Text(
                                      "Logout",
                                      style: TextStyle(
                                          fontFamily: 'Poppins',
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.blue),
                                    ),
                                    SizedBox(
                                      width: 70,
                                    ),
                                    // Container(
                                    //     width: 40,
                                    //     height: 40,
                                    //     decoration: BoxDecoration(
                                    //         borderRadius:
                                    //             BorderRadius.circular(100),
                                    //         color: Color.fromRGBO(255, 93, 78, 1)),
                                    //     // padding: EdgeInsets.only(left: 20),
                                    //     child: Image.asset(
                                    //       "assets/icons/right-arrow.png",
                                    //       color: Colors.white,
                                    //       scale: 25,
                                    //     )),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
