import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:gaming_accessories_rent_app/components/bottom_nav.dart';
// import 'package:gaming_accessories_rent_app/auth/Login_or_register.dart';
import 'package:gaming_accessories_rent_app/components/nav.dart';
import 'package:google_fonts/google_fonts.dart';

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
                Container(
                  margin: EdgeInsets.only(right: 20),
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(10)),
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
                  onTap: () {
                    print("i lost my v");
                  },
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
                            "Lost Item",
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
                            "Found Item",
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
          )
        ],
      ),
    );
  }
}
