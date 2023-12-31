import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:gaming_accessories_rent_app/components/bottom_nav.dart';
// import 'package:gaming_accessories_rent_app/auth/Login_or_register.dart';
import 'package:gaming_accessories_rent_app/components/nav.dart';
import 'package:gaming_accessories_rent_app/pages/found_page.dart';
import 'package:gaming_accessories_rent_app/pages/lost_page.dart';
import 'package:google_fonts/google_fonts.dart';

import '../components/drawer.dart';
import 'internal pages/report_found.dart';
import 'internal pages/report_lost.dart';
import 'notification_page.dart';

// import '../components/bottom_nav.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void logout() {
    FirebaseAuth.instance.signOut();
    // return Login_or_Register();
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final useremail = FirebaseAuth.instance.currentUser!.email;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: Mydrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 30, left: 20),
              child: Row(
                children: [
                  // const Icon(
                  //   Icons.menu,
                  //   size: 30,
                  //   color: Colors.black87,
                  // ),
                  GestureDetector(
                    onTap: () {
                      // logout();
                      // Mydrawer();
                      _scaffoldKey.currentState?.openDrawer();
                    },
                    child: Image.asset(
                      "assets/icons/menu.png",
                      scale: 14,
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
                    child: Expanded(
                      flex: 1,
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
                          // color: Colors.black87,
                        ),
                      ),
                    ),
                  ),
                ],
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
              // padding: const EdgeInsets.only(left: 20),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          CupertinoPageRoute(
                            builder: (context) => const LostPage(),
                          ),
                        );
                      },
                      child: Expanded(
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.5 - 20,
                          height: 200,
                          // color: Colors.grey,
                          decoration: BoxDecoration(
                              color: Colors.deepPurple[100],
                              borderRadius: BorderRadius.circular(20),
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
                          child: Container(
                            // padding: const EdgeInsets.all(10),
                            child: Column(
                              children: [
                                const Padding(
                                  padding: EdgeInsets.all(10),
                                ),
                                Image.asset(
                                  "assets/images/lost.png",
                                  width: 120,
                                  height: 120,
                                ),
                                const Text(
                                  "Lost Items",
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    color: Colors.black,
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          CupertinoPageRoute(
                              builder: (context) => const FoundPage()),
                        );
                      },
                      child: Expanded(
                        child: Container(
                          // clipBehavior: Clip.hardEdge,
                          width: MediaQuery.of(context).size.width * 0.5 - 20,
                          height: 200,
                          // color: Colors.grey,
                          decoration: BoxDecoration(
                              color: Colors.amber[100],
                              borderRadius: BorderRadius.circular(20),
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

                          child: Container(
                            padding: EdgeInsets.all(10),
                            child: Column(
                              children: [
                                Image.asset(
                                  "assets/images/found.png",
                                  // fit: BoxFit.fitWidth,
                                  width: MediaQuery.of(context).size.width,
                                  height: 120,
                                ),
                                const Text(
                                  "Found Items",
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    color: Colors.black,
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Padding(padding: EdgeInsets.only(bottom: 10)),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            SingleChildScrollView(
              child: Flexible(
                child: Container(
                  height: 400,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
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
                    ],
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.grey.shade200,
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.03,
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
                      // const SizedBox(
                      //   height: 5,
                      // ),
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
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            CupertinoPageRoute(
                                builder: (context) => const Report_Found()),
                          );
                        },
                        child: Container(
                          // padding: const EdgeInsets.only(right: 5),
                          child: Column(
                            children: [
                              SafeArea(
                                child: Center(
                                  child: Expanded(
                                    child: Container(
                                      height: 100,
                                      width: MediaQuery.of(context).size.width -
                                          40,
                                      decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey,
                                            blurRadius:
                                                5.0, // soften the shadow
                                            spreadRadius:
                                                2.0, //extend the shadow
                                            offset: Offset(
                                              3.0, // Move to right 5  horizontally
                                              3.0, // Move to bottom 5 Vertically
                                            ),
                                          )
                                        ],
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
                                        padding: const EdgeInsets.all(10.0),
                                        child: Center(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                  padding:
                                                      EdgeInsets.only(left: 10),
                                                  child: Image.asset(
                                                      "assets/icons/found.png")),
                                              Container(
                                                padding: const EdgeInsets.only(
                                                    left: 0),
                                                child: Text(
                                                  "Found an Item",
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontFamily: "Poppins",
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 20,
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                  padding: EdgeInsets.only(
                                                      left:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.025),
                                                  child: Image.asset(
                                                    "assets/icons/right-arrow.png",
                                                    color: Colors.white70,
                                                    scale: 20,
                                                  )),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    CupertinoPageRoute<void>(
                                      builder: (BuildContext context) =>
                                          const Report_Lost(),
                                    ),
                                  );
                                },
                                child: SafeArea(
                                  child: Center(
                                    child: Container(
                                      height: 100,
                                      width: MediaQuery.of(context).size.width -
                                          40,
                                      decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey,
                                            blurRadius:
                                                5.0, // soften the shadow
                                            spreadRadius:
                                                2.0, //extend the shadow
                                            offset: Offset(
                                              3.0, // Move to right 5  horizontally
                                              3.0, // Move to bottom 5 Vertically
                                            ),
                                          )
                                        ],
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
                                        padding: const EdgeInsets.all(10.0),
                                        child: Center(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                  padding:
                                                      EdgeInsets.only(left: 25),
                                                  child: Image.asset(
                                                      "assets/icons/lost.png")),
                                              Container(
                                                child: Text(
                                                  "Lost an Item",
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontFamily: "Poppins",
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 20,
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                  // alignment: Alignment.centerRight,
                                                  child: Image.asset(
                                                      "assets/icons/right-arrow.png",
                                                      scale: 20,
                                                      color: Colors.white70)),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 30,
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
