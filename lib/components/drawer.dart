// import 'dart:js';

// import 'dart:js';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gaming_accessories_rent_app/components/show_error_dialog.dart';
import 'package:gaming_accessories_rent_app/pages/found_page.dart';
import 'package:gaming_accessories_rent_app/pages/internal%20pages/report_found.dart';
import 'package:gaming_accessories_rent_app/pages/internal%20pages/report_lost.dart';
import 'package:gaming_accessories_rent_app/pages/lost_page.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import '../pages/profile.dart';
import 'show_confirm_dialog.dart';

class Mydrawer extends StatelessWidget {
  Mydrawer({super.key});
  void logout() {
    // showDialog(
    //     context: context,
    //     builder: (context) {
    //       CircularProgressIndicator();
    //     });
    // FirebaseAuth.instance.signOut();
    // return Login_or_Register();
    // showError(context, 'text');
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 0,
      backgroundColor: Colors.white,
      child: SingleChildScrollView(
        child: Column(
          children: [
            const DrawerHeader(
              child: Icon(
                LineAwesomeIcons.user,
                color: Color.fromRGBO(255, 93, 78, 1),
                size: 100,
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: const SafeArea(
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.only(
                      top: 12.0,
                      left: 20,
                    ),
                    child: Row(
                      children: [
                        Icon(
                          LineAwesomeIcons.home,
                          size: 30,
                          color: Color.fromRGBO(255, 93, 78, 1),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 70.0),
                          child: Text(
                            "Home",
                            style: TextStyle(
                                fontFamily: "Poppins",
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            // const SizedBox(
            //   height: 10,
            // ),

            // const SizedBox(
            //   height: 10,
            // ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  CupertinoPageRoute<void>(
                    builder: (BuildContext context) => const LostPage(),
                  ),
                );
              },
              child: const SafeArea(
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.only(
                      top: 5.0,
                      left: 20,
                    ),
                    child: Row(
                      children: [
                        Icon(
                          LineAwesomeIcons.book_reader,
                          color: Color.fromRGBO(255, 93, 78, 1),
                          size: 30,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 50.0),
                          child: Text(
                            "Discover Lost",
                            style: TextStyle(
                                fontFamily: "Poppins",
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            // const SizedBox(
            //   height: 10,
            // ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  CupertinoPageRoute<void>(
                    builder: (BuildContext context) => const FoundPage(),
                  ),
                );
              },
              child: const SafeArea(
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.only(
                      top: 5.0,
                      left: 20,
                    ),
                    child: Row(
                      children: [
                        Icon(
                          LineAwesomeIcons.intercom,
                          color: Color.fromRGBO(255, 93, 78, 1),
                          size: 30,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 40.0),
                          child: Text(
                            "Discover Found",
                            style: TextStyle(
                                fontFamily: "Poppins",
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
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
                    builder: (BuildContext context) => const Report_Lost(),
                  ),
                );
              },
              child: const SafeArea(
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.only(
                      top: 5.0,
                      left: 20,
                    ),
                    child: Row(
                      children: [
                        Icon(
                          LineAwesomeIcons.book_open,
                          color: Color.fromRGBO(255, 93, 78, 1),
                          size: 30,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 50.0),
                          child: Text(
                            "Report Lost",
                            style: TextStyle(
                                fontFamily: "Poppins",
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
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
                    builder: (BuildContext context) => const Report_Found(),
                  ),
                );
              },
              child: const SafeArea(
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.only(
                      top: 5.0,
                      left: 20,
                    ),
                    child: Row(
                      children: [
                        Icon(
                          LineAwesomeIcons.book,
                          color: Color.fromRGBO(255, 93, 78, 1),
                          size: 30,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 50.0),
                          child: Text(
                            "Report Lost",
                            style: TextStyle(
                                fontFamily: "Poppins",
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            // Column(
            //   children: [
            //     GestureDetector(
            //       onTap: () {
            //         logout();
            //       },
            //       child: const SafeArea(
            //         child: Center(
            //           child: Padding(
            //             padding: EdgeInsets.only(
            //               top: 5.0,
            //               left: 20,
            //             ),
            //             child: Row(
            //               children: [
            //                 Icon(
            //                   LineAwesomeIcons.alternate_sign_out,
            //                   size: 30,
            //                 ),
            //                 Padding(
            //                   padding: EdgeInsets.only(left: 70.0),
            //                   child: Text(
            //                     "Logout",
            //                     style: TextStyle(
            //                         fontFamily: "Poppins",
            //                         fontSize: 23,
            //                         fontWeight: FontWeight.bold),
            //                   ),
            //                 )
            //               ],
            //             ),
            //           ),
            //         ),
            //       ),
            //     ),
            //   ],
            // )
          ],
        ),
      ),
    );
  }
}
