import 'dart:js';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

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
    showConfirm;
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 0,
      backgroundColor: Colors.white,
      child: Column(
        children: [
          DrawerHeader(
            child: Icon(
              Icons.person,
              color: Colors.grey[900],
              size: 100,
            ),
          ),
          const SafeArea(
            child: Center(
              child: Padding(
                padding: EdgeInsets.only(
                  top: 12.0,
                  left: 20,
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.home_outlined,
                      size: 30,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 70.0),
                      child: Text(
                        "Home",
                        style: TextStyle(
                            fontSize: 23, fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          GestureDetector(
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
                        Icons.person_outline,
                        size: 30,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 70.0),
                        child: Text(
                          "Profile",
                          style: TextStyle(
                              fontSize: 23, fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          Column(
            children: [
              GestureDetector(
                onTap: () {
                  logout();
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
                            Icons.logout_outlined,
                            size: 30,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 70.0),
                            child: Text(
                              "Logout",
                              style: TextStyle(
                                  fontSize: 23, fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
