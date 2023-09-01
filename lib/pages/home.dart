import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:gaming_accessories_rent_app/components/bottom_nav.dart';
// import 'package:gaming_accessories_rent_app/auth/Login_or_register.dart';
import 'package:gaming_accessories_rent_app/components/nav.dart';
import 'package:gaming_accessories_rent_app/pages/found_page.dart';
import 'package:google_fonts/google_fonts.dart';

import 'notification_page.dart';

// import '../components/bottom_nav.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void logout() {
    FirebaseAuth.instance.signOut();
    // return Login_or_Register();
  }

  final useremail = FirebaseAuth.instance.currentUser!.email;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: 60, left: 20),
            child: Row(
              children: [
                // const Icon(
                //   Icons.menu,
                //   size: 30,
                //   color: Colors.black87,
                // ),
                GestureDetector(
                  onTap: () {
                    logout();
                  },
                  child: Image.asset(
                    "assets/icons/menu.png",
                    scale: 12,
                    color: Colors.black87,
                  ),
                ),
                Expanded(child: Container()),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      CupertinoPageRoute(
                          builder: (context) => const NotificationPage()),
                    );
                  },
                  child: Container(
                    margin: EdgeInsets.only(right: 20),
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                        // color: Colors.grey.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(10)),
                    child: Image.asset(
                      "assets/icons/notification.png",
                      // height: 5,
                      // width: 5,
                      scale: 14,
                      // color: Colors.black87,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
                padding: const EdgeInsets.only(left: 20),
                child: const Text(
                  "Discover",
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    color: Colors.black,
                    fontSize: 38,
                    fontWeight: FontWeight.bold,
                  ),
                )),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            padding: const EdgeInsets.only(left: 20),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    width: 180,
                    height: 200,
                    // color: Colors.grey,
                    decoration: BoxDecoration(
                      color: Colors.deepPurple[100],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          const Padding(padding: EdgeInsets.only(top: 10)),
                          Image.asset(
                            "assets/images/lost.png",
                            width: 140,
                            height: 140,
                          ),
                          const Text(
                            "Lost Items",
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                GestureDetector(
                  onTap: () {
                    print("ilost my d");
                  },
                  child: Container(
                    width: 180,
                    height: 200,
                    // color: Colors.grey,
                    decoration: BoxDecoration(
                      color: Colors.amber[100],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Container(
                      // padding: EdgeInsets.all(5),
                      child: Column(
                        children: [
                          Image.asset(
                            "assets/images/found.png",
                            width: 160,
                            height: 160,
                          ),
                          const Text(
                            "Found Items",
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Padding(padding: EdgeInsets.only(bottom: 10)),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            height: 360,
            width: 420,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Colors.grey.shade200,
            ),
            child: Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    padding: const EdgeInsets.only(left: 20),
                    child: const Text(
                      "Report",
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        color: Colors.black,
                        fontSize: 28,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    padding: const EdgeInsets.only(left: 20),
                    child: const Text(
                      "select which one you want to report.",
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        // shadows:,
                        color: Colors.black,
                        fontSize: 13,
                        fontWeight: FontWeight.w200,
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(right: 5),
                  child: Column(
                    children: [
                      SafeArea(
                        child: Center(
                          child: Container(
                            height: 90,
                            width: 370,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  begin: Alignment.bottomLeft,
                                  end: Alignment.topRight,
                                  colors: [
                                    Colors.blue.shade600,
                                    Colors.blue.shade200,
                                  ]),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(
                                child: Row(
                                  children: [
                                    Container(
                                        padding: EdgeInsets.only(left: 10),
                                        child: Image.asset(
                                            "assets/icons/found.png")),
                                    Container(
                                      padding: EdgeInsets.only(left: 40),
                                      child: const Text(
                                        "Found an Item",
                                        style: TextStyle(
                                          fontFamily: "Poppins",
                                          fontWeight: FontWeight.w500,
                                          fontSize: 24,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SafeArea(
                        child: Center(
                          child: Container(
                            height: 90,
                            width: 370,
                            decoration: BoxDecoration(
                              // color: Colors.pink[200],
                              borderRadius: BorderRadius.circular(20),
                              gradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [
                                    Colors.purple.shade300,
                                    Colors.purple.shade100,
                                  ]),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(
                                child: Row(
                                  children: [
                                    Container(
                                        padding: EdgeInsets.only(left: 20),
                                        child: Image.asset(
                                            "assets/icons/lost.png")),
                                    Container(
                                      padding: EdgeInsets.only(left: 30),
                                      child: const Text(
                                        "Lost an Item",
                                        style: TextStyle(
                                          fontFamily: "Poppins",
                                          fontWeight: FontWeight.w500,
                                          fontSize: 24,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
