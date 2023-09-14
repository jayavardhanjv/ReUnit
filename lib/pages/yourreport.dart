import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gaming_accessories_rent_app/components/report_iteam.dart';
import 'package:gaming_accessories_rent_app/pages/internal%20pages/get_internal_data.dart';
import 'package:gaming_accessories_rent_app/pages/internal%20pages/show_report.dart';
import 'package:gaming_accessories_rent_app/pages/internal%20pages/show_report_myreport.dart';
import 'package:gaming_accessories_rent_app/pages/notification_page.dart';

enum WidgetMaker { found, lost }

class MyReport extends StatefulWidget {
  const MyReport({super.key});

  @override
  State<MyReport> createState() => _MyReportState();
}

class _MyReportState extends State<MyReport> {
  List docId1 = [];
  List docId2 = [];
  // var identifier = new Map();
  String name = '';
  // final String joined_data = FirebaseAuth.instance.currentUser!.uid;
  Future getDocIDFound() async {
    final String currentuid = FirebaseAuth.instance.currentUser!.uid;

    await FirebaseFirestore.instance
        .collection("FoundItems")
        .where("useruid", isEqualTo: currentuid)
        .get()
        .then(
          (snapshot) => snapshot.docs.forEach((element) {
            docId1.add(element.reference.id);
          }),
        );
  }

  Future getDocIDLost() async {
    final String currentuid = FirebaseAuth.instance.currentUser!.uid;

    await FirebaseFirestore.instance
        .collection("LostItems")
        .where("useruid", isEqualTo: currentuid)
        .get()
        .then(
          (snapshot) => snapshot.docs.forEach((element) {
            docId2.add(element.reference.id);
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
    getDocIDFound();
    getDocIDLost();
    getCustomContiner();
  }

  WidgetMaker selectedwidgetmaker = WidgetMaker.found;

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
                      // Navigator.of(context).pop();
                    },
                    child: Image.asset(
                      "assets/icons/left.png",
                      scale: 14,
                      color: Colors.white,
                    ),
                  ),
                  Expanded(child: Container()),
                  Padding(
                    padding: const EdgeInsets.only(left: 0),
                    child: Container(
                      child: const Text(
                        "My Report",
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
                      // Navigator.push(
                      //   context,
                      //   CupertinoPageRoute(
                      //       builder: (context) => const NotificationPage()),
                      // );
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
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 50,
              width: MediaQuery.of(context).size.width - 30,
              // color: Colors.red,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromRGBO(255, 93, 78, 1),
                        shape: StadiumBorder(),
                      ),
                      onPressed: () {
                        setState(() {
                          selectedwidgetmaker = WidgetMaker.found;
                        });
                      },
                      child: Text(
                        "Found",
                        style: TextStyle(fontFamily: "Poppins"),
                      )),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromRGBO(255, 93, 78, 1),
                        shape: StadiumBorder(),
                      ),
                      onPressed: () {
                        // dispose();

                        setState(() {
                          selectedwidgetmaker = WidgetMaker.lost;
                        });
                      },
                      child: Text("Lost",
                          style: TextStyle(fontFamily: "Poppins"))),
                ],
              ),
            ),
            Container(
              // width: MediaQuery.of(context).size.width - 40,
              child: getCustomContiner(),
            ),
            Container(
              height: 250,
              width: 300,
              // child: getCustomContiner(),
            )
          ],
        ),
      ),
    );
  }

  Widget getCustomContiner() {
    switch (selectedwidgetmaker) {
      case WidgetMaker.found:
        return getFoundContiner();
      case WidgetMaker.lost:
        return getLostContiner();

      // break;
      default:
        getFoundContiner();
    }
    return getCustomContiner();
  }

  Widget getFoundContiner() {
    if (docId1 != null) {
      docId1.clear();
    }
    try {
      return Container(
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
              future: getDocIDFound(),
              builder: (context, snapshot) {
                return ListView.builder(
                  itemCount: docId1.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        {
                          Navigator.push(
                              context,
                              CupertinoPageRoute(
                                  builder: (context) => Show_myiem(
                                        documentid: docId1[index],
                                        whichitem: 'FoundItems',
                                      )));

                          // );
                          // Navigator.push(
                          //   context,
                          //   CupertinoPageRoute(
                          //     builder: (context) => Show_myiem(
                          //       documentid: docId[index],
                          //       whichitem: 'FoundItems',
                          //     ),
                          //   ),
                          // ).then((_) => setState(() {}));
                        }
                      },
                      child: GettheData(
                        documentid: docId1[index],
                        whichitem: 'FoundItems',
                      ),
                    );
                  },
                );
              },
            )),
          ],
        ),
      );
    } catch (e) {
      return Text("Loading");
    }
  }

  Widget getLostContiner() {
    if (docId2 != null) {
      docId2.clear();
    }
    try {
      return Container(
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
              future: getDocIDLost(),
              builder: (context, snapshot) {
                return ListView.builder(
                  itemCount: docId2.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        {
                          Navigator.push(
                              context,
                              CupertinoPageRoute(
                                  builder: (context) => Show_myiem(
                                        documentid: docId2[index],
                                        whichitem: 'LostItems',
                                      )));

                          // );
                          // Navigator.push(
                          //   context,
                          //   CupertinoPageRoute(
                          //     builder: (context) => Show_myiem(
                          //       documentid: docId[index],
                          //       whichitem: 'FoundItems',
                          //     ),
                          //   ),
                          // ).then((_) => setState(() {}));
                        }
                      },
                      child: GettheData(
                        documentid: docId2[index],
                        whichitem: 'LostItems',
                      ),
                    );
                  },
                );
              },
            )),
          ],
        ),
      );
    } catch (e) {
      return Text("Loading");
    }
  }
}
