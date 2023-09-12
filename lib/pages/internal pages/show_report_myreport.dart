import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gaming_accessories_rent_app/components/button.dart';
import 'package:gaming_accessories_rent_app/pages/mainPage.dart';
import 'package:gaming_accessories_rent_app/pages/notification_page.dart';
import 'package:gaming_accessories_rent_app/pages/yourreport.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class Show_myiem extends StatelessWidget {
  final String documentid;
  final String whichitem;

  Show_myiem({
    required this.documentid,
    required this.whichitem,
  });

  get context => null;

  // get context => null;
  delete() {
    try {
      FirebaseFirestore.instance
          .collection(whichitem)
          .doc(documentid)
          .delete()
          .then(
            (doc) => print("Document deleted"),
            onError: (e) => print("Error updating document $e"),
          );
      // Navigator.of(context).pop();
      // Navigator.of(context).pop();
    } catch (e) {
      print("error");
    }
  }

  // String reportimage;
  @override
  Widget build(BuildContext context) {
    try {
      String _imagedata;
      CollectionReference reports =
          FirebaseFirestore.instance.collection(whichitem);
      return FutureBuilder<DocumentSnapshot>(
        future: reports.doc(documentid).get(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            Map<String, dynamic> data =
                snapshot.data!.data() as Map<String, dynamic>;
            _imagedata = data["image"];
            // reportimage = data["image"];
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
                              )),
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
                                  data["address"],
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
                                    width:
                                        MediaQuery.of(context).size.width - 60,
                                    decoration: BoxDecoration(),
                                    child: GestureDetector(
                                      onTap: () {
                                        delete();
                                        Navigator.pushAndRemoveUntil(
                                          context,
                                          CupertinoPageRoute(
                                              builder: (context) => MainPage()),
                                          ModalRoute.withName('/'),
                                        );
                                      },
                                      child: Container(
                                        padding: const EdgeInsets.all(25),
                                        decoration: BoxDecoration(
                                          boxShadow: const [
                                            BoxShadow(
                                              color: Colors.black,
                                              offset: Offset(0, 1),
                                              blurRadius: 1,
                                            )
                                          ],
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        child: Center(
                                          child: Text(
                                            "DELETE",
                                            style: TextStyle(
                                              color: Color.fromRGBO(
                                                  255, 93, 78, 1),
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16,
                                            ),
                                          ),
                                        ),
                                      ),
                                    )),
                                Container(
                                  width: MediaQuery.of(context).size.width - 60,
                                  decoration: BoxDecoration(),
                                  child: MyButton(
                                    onTap: () {},
                                    text: 'ReUnited',
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
