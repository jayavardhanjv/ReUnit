import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gaming_accessories_rent_app/components/report_iteam.dart';
import 'package:gaming_accessories_rent_app/pages/internal%20pages/get_internal_data.dart';
import 'package:gaming_accessories_rent_app/pages/internal%20pages/show_report.dart';
import 'package:gaming_accessories_rent_app/pages/notification_page.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class Contact_data extends StatefulWidget {
  Contact_data({
    super.key,
    required this.username,
    required this.useremail,
    required this.address,
    required this.phone,
  });
  String useremail;
  String username;
  String address;
  String phone;
  @override
  State<Contact_data> createState() => _Contact_dataState();
}

_calling() async {
  const url = 'tel:+12345678';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

class _Contact_dataState extends State<Contact_data> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 40, left: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                    padding: const EdgeInsets.only(left: 0),
                    child: Container(
                      child: const Text(
                        "User Details",
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 24),
                      ),
                    ),
                  ),
                  Expanded(child: Container()),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      margin: EdgeInsets.only(right: 20),
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                          // color: Colors.grey.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(10)),
                      child: Image.asset(
                        "assets/icons/bell.png",
                        // height: 5,
                        // width: 5,
                        scale: 18,
                        color: Colors.transparent,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Container(
              height: 350,
              width: MediaQuery.of(context).size.width - 40,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 5.0, // soften the shadow
                      spreadRadius: 2.0, //extend the shadow
                      offset: Offset(
                        3.0, // Move to right 5  horizontally
                        3.0, // Move to bottom 5 Vertically
                      ),
                    )
                  ]),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                      width: MediaQuery.of(context).size.width * 0.7,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          // Icon(LineAwesomeIcons.user),
                          Flexible(
                            child: Text("Name: ${widget.username}",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    overflow: TextOverflow.clip,
                                    fontFamily: 'Poppins',
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14)),
                          ),
                        ],
                      )),
                  Container(
                      width: MediaQuery.of(context).size.width * 0.7,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          // Icon(Icons.mail_outline_rounded),
                          Flexible(
                            child: Text("Email: ${widget.useremail}",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    overflow: TextOverflow.clip,
                                    fontFamily: 'Poppins',
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14)),
                          ),
                        ],
                      )),
                  Container(
                      width: MediaQuery.of(context).size.width * 0.7,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          // Icon(Icons.navigation_outlined),
                          Flexible(
                            child: Text("Address: ${widget.address}",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    overflow: TextOverflow.clip,
                                    fontFamily: 'Poppins',
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14)),
                          ),
                        ],
                      )),
                  Container(
                      width: MediaQuery.of(context).size.width * 0.7,
                      // width: MediaQuery.of(context).size.width * 0.4,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          // Icon(
                          //   LineAwesomeIcons.phone,
                          //   color: Colors.black,
                          // ),
                          Flexible(
                            child: Text("PhoneNo: ${widget.phone}",
                                overflow: TextOverflow.clip,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    overflow: TextOverflow.ellipsis,
                                    fontFamily: 'Poppins',
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14)),
                          ),
                        ],
                      )),
                  Container(
                      width: MediaQuery.of(context).size.width * 0.7,
                      // width: MediaQuery.of(context).size.width * 0.4,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          GestureDetector(
                            onTap: () {
                              // _makingPhoneCall();
                              launch("tel:${widget.phone}");
                            },
                            child: Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                  color: Color.fromRGBO(255, 93, 78, 1),
                                  borderRadius: BorderRadius.circular(90)),
                              child: Center(
                                  child: Icon(
                                Icons.phone,
                                color: Colors.white,
                              )),
                            ),
                          ),
                          // Container(
                          //   width: 40,
                          //   height: 40,
                          //   decoration: BoxDecoration(
                          //       color: Color.fromRGBO(255, 93, 78, 1),
                          //       borderRadius: BorderRadius.circular(90)),
                          //   child: Center(
                          //       child: Icon(
                          //     Icons.navigation_outlined,
                          //     color: Colors.white,
                          //   )),
                          // ),
                          GestureDetector(
                            onTap: () {
                              // _makingPhoneCall();
                              launch('mailto:${widget.useremail}');
                            },
                            child: Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                  color: Color.fromRGBO(255, 93, 78, 1),
                                  borderRadius: BorderRadius.circular(90)),
                              child: Center(
                                  child: Icon(
                                Icons.mail_outline,
                                color: Colors.white,
                              )),
                            ),
                          )
                        ],
                      )),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
