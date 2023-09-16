import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gaming_accessories_rent_app/components/button.dart';
import 'package:gaming_accessories_rent_app/pages/notification_page.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class Show_Item extends StatefulWidget {
  final String documentid;
  final String whichitem;

  Show_Item({
    required this.documentid,
    required this.whichitem,
  });
  @override
  State<Show_Item> createState() => _Show_ItemState();
}

class _Show_ItemState extends State<Show_Item> {
  var identifier = new Map();

  String currentuser = FirebaseAuth.instance.currentUser!.uid;

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
            }),
          );
      print(username);
    } catch (e) {
      print("error");
    }
  }

  // String? useremail = FirebaseAuth.instance.currentUser!.email;
  late String username;
  late String useremail;

  // String useremail = '';
  late String useraddress;

  late String userph;
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
    // _Show_ItemState();
  }

  @override
  Widget build(BuildContext context) {
    try {
      String _imagedata;
      CollectionReference reports =
          FirebaseFirestore.instance.collection(widget.whichitem);
      return FutureBuilder<DocumentSnapshot>(
        future: reports.doc(widget.documentid).get(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            Map<String, dynamic> data =
                snapshot.data!.data() as Map<String, dynamic>;
            try {
              _imagedata = data["image"];
            } catch (e) {
              _imagedata = "assets/images/no_image.png";
            }
            Future MyConnect() async {
              try {
                FirebaseFirestore.instance
                    .collection("Connection")
                    .doc("report")
                    .collection(data["useruid"])
                    .doc()
                    .set({
                      "reportowner": data["useruid"],
                      "docid": widget.documentid,
                      "wanttoconnect": currentuser,
                      "useremail": useremail,
                      "reportdis": data["des"],
                      "imagedata": data["image"],
                      "username": username,
                      "userph": userph,
                      "useraddress": useraddress
                    })
                    .then((snapshot) => print("connection Added"))
                    .catchError((onError) => print("error found"));
              } catch (e) {
                print(e);
              }
            }

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
                            padding: const EdgeInsets.only(right: 50),
                            child: Container(
                              child: const Text(
                                "Content",
                                style: TextStyle(
                                    fontFamily: 'Poppins',
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 24),
                              ),
                            ),
                          ),
                          Expanded(child: Container()),

                          // GestureDetector(
                          //   onTap: () {
                          //     Navigator.push(
                          //       context,
                          //       CupertinoPageRoute(
                          //           builder: (context) => const NotificationPage()),
                          //     );
                          //   },
                          //   child: Container(
                          //     margin: EdgeInsets.only(right: 20),
                          //     width: 50,
                          //     height: 50,
                          //     decoration: BoxDecoration(
                          //         // color: Colors.grey.withOpacity(0.5),
                          //         borderRadius: BorderRadius.circular(10)),
                          //     child: Image.asset(
                          //       "assets/icons/bell.png",
                          //       // height: 5,
                          //       // width: 5,
                          //       scale: 18,
                          //       // color: Colors.black87,
                          //     ),
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                    Container(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            height: 250,
                            width: MediaQuery.of(context).size.width - 30,
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
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.grey[600]),
                            child: Image.network(
                              _imagedata,
                              alignment: Alignment.center,
                              fit: BoxFit.contain,
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Container(
                            height: 500,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(30),
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
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  data["title"],
                                  style: TextStyle(
                                      fontFamily: "Poppins", fontSize: 22),
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width - 40,
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      data["des"],
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontFamily: "Poppins", fontSize: 16),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width - 20,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        data["address"],
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontFamily: "Poppins",
                                          fontSize: 14,
                                        ),
                                      ),
                                      Text(
                                        "24 days ago",
                                        style: TextStyle(
                                            fontFamily: "Poppins",
                                            fontSize: 14),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width - 60,
                                  decoration: BoxDecoration(),
                                  child: MyButton(
                                    onTap: () {
                                      MyConnect();
                                    },
                                    text: 'Connect +',
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
          return Text(
            "Loading,.....",
            style: TextStyle(
                color: Color.fromRGBO(255, 93, 78, 1),
                fontFamily: "Poppins",
                fontSize: 16),
          );
        },
      );
    } catch (error) {
      // Handle the error gracefully, e.g., show an error message

      return Text(
        'An error occurred: $error',
        style: TextStyle(
            color: Color.fromRGBO(255, 93, 78, 1),
            fontFamily: "Poppins",
            fontSize: 16),
      );
    }
  }
}
