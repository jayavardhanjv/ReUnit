import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gaming_accessories_rent_app/pages/notification_page.dart';

class MyNavBar extends StatefulWidget {
  const MyNavBar({super.key});

  @override
  State<MyNavBar> createState() => _MyNavBarState();
}

class _MyNavBarState extends State<MyNavBar> {
  void logout() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
