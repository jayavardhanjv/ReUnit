import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gaming_accessories_rent_app/components/report_iteam.dart';
import 'package:gaming_accessories_rent_app/pages/internal%20pages/get_internal_data.dart';
import 'package:gaming_accessories_rent_app/pages/internal%20pages/show_report.dart';
import 'package:gaming_accessories_rent_app/pages/notification_page.dart';

class LostPage extends StatefulWidget {
  const LostPage({super.key});

  @override
  State<LostPage> createState() => _LostPageState();
}

class _LostPageState extends State<LostPage> {
  List docId = [];
  // var identifier = new Map();
  String name = '';
  // final String joined_data = FirebaseAuth.instance.currentUser!.uid;
  Future getDocID() async {
    // final String currentuid = FirebaseAuth.instance.currentUser!.uid;

    await FirebaseFirestore.instance.collection("LostItems").get().then(
          (snapshot) => snapshot.docs.forEach((element) {
            docId.add(element.reference.id);
          }),
        );
  }

  String username = '';
  String useremail = '';
  String useraddress = '';
  String userph = '';
  final String currentuid = FirebaseAuth.instance.currentUser!.uid;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // getDocID();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    getDocID();
  }

  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
=======
    if (docId != null) {
      docId.clear();
    }
>>>>>>> cb3726194330ae59eb00e5da4b8424bb9fe6a52c
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
                        "Lost Items",
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
                        "assets/icons/bell.png",
                        // height: 5,
                        // width: 5,
                        scale: 18,
                        // color: Colors.black87,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 703,
              decoration: BoxDecoration(
                color: Colors.white70,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Expanded(
                      child: FutureBuilder(
                    future: getDocID(),
                    builder: (context, snapshot) {
                      return ListView.builder(
                        itemCount: docId.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              {
                                Navigator.push(
                                  context,
                                  CupertinoPageRoute(
                                      builder: (context) => Show_Item(
                                            documentid: docId[index],
                                            whichitem: 'LostItems',
                                          )),
                                );
                              }
                            },
                            child: GettheData(
                              documentid: docId[index],
                              whichitem: 'LostItems',
                            ),
                          );
                        },
                      );
                    },
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
