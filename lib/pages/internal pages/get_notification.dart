import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gaming_accessories_rent_app/components/constants.dart';
import 'package:gaming_accessories_rent_app/components/show_user_connect.dart';
import 'package:gaming_accessories_rent_app/pages/notification_page.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import '../../components/show_error_dialog.dart';

class GetNotification extends StatelessWidget {
  final String documentid;
  final String whichitem;
  GetNotification({
    required this.documentid,
    required this.whichitem,
  });
  List docId1 = [];
  Future getDocID() async {
    // final String currentuid = FirebaseAuth.instance.currentUser!.uid;

    await FirebaseFirestore.instance.collection("FoundItems").get().then(
          (snapshot) => snapshot.docs.forEach((element) {
            docId1.add(element.reference.id);
          }),
        );
  }

  Future Reject() async {
    try {
      final String currentuid = FirebaseAuth.instance.currentUser!.uid;

      await FirebaseFirestore.instance
          .collection("Connection")
          .doc("report")
          .collection(whichitem)
          .doc(documentid)
          .delete()
          .then(
            (doc) => print("Document deleted"),
            onError: (e) => print("Error updating document $e"),
          );
    } catch (e) {
      print("Loading");
    }
  }

  @override
  Widget build(BuildContext context) {
    try {
      String _imagedata;
      CollectionReference reports = FirebaseFirestore.instance
          .collection("Connection")
          .doc("report")
          .collection(whichitem);
      return FutureBuilder<DocumentSnapshot>(
        future: reports.doc(documentid).get(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            Map<String, dynamic> data =
                snapshot.data!.data() as Map<String, dynamic>;
            try {
              _imagedata = data["imagedata"];
            } catch (e) {
              _imagedata = "assets/images/no_image.png";
            }
            return Expanded(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                padding: EdgeInsets.all(20),
                width: MediaQuery.of(context).size.width - 20,
                height: 200,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 5.0, // soften the shadow
                        spreadRadius: 3.0, //extend the shadow
                        offset: Offset(
                          3.0, // Move to right 5  horizontally
                          3.0, // Move to bottom 5 Vertically
                        ),
                      )
                    ]),
                child: Row(
                  children: [
                    // Container(
                    //   decoration: BoxDecoration(
                    //     borderRadius: BorderRadius.circular(20),
                    //     // color: Color.fromRGBO(255, 93, 78, 1),
                    //     color: Colors.white,
                    //   ),
                    //   width: MediaQuery.of(context).size.width * 0.3,
                    //   height: 230,
                    //   child: Image.network(
                    //     _imagedata,
                    //     alignment: Alignment.center,
                    //     fit: BoxFit.contain,
                    //   ),
                    // ),
                    // SizedBox(
                    //   width: 20,
                    // ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "some user wants to connect with you",
                          overflow: TextOverflow.clip,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: "Poppins",
                            fontSize: 14,
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width - 60,
                          child: Center(
                            child: Text(
                              "Username : ${data["username"]}",
                              overflow: TextOverflow.clip,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: "Poppins",
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ),
                        new Container(
                          // padding: new EdgeInsets.only(right: 8.0),
                          height: 40,
                          width: MediaQuery.of(context).size.width * 0.4,
                          child: Center(
                            child: new Text(
                              data["reportdis"],
                              overflow: TextOverflow.ellipsis,
                              maxLines: 3,
                              style: new TextStyle(
                                fontSize: 12.0,
                                fontFamily: 'Roboto',
                                color: new Color(0xFF212121),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          // padding: new EdgeInsets.only(right: 13.0),
                          // height: 80,
                          width: MediaQuery.of(context).size.width * 0.8,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              ElevatedButton(
                                  onPressed: () {
                                    // mydialog();
                                    try {
                                      Navigator.push(
                                        context,
                                        CupertinoPageRoute(
                                            builder: (context) => Contact_data(
                                                  username: data["username"],
                                                  useremail: data["useremail"],
                                                  address: data["useraddress"],
                                                  phone: data["userph"],
                                                )),
                                      );
                                    } catch (e) {
                                      print(e);
                                    }
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        const Color.fromRGBO(255, 93, 78, 1),
                                    shape: StadiumBorder(),
                                  ),
                                  child: Text(
                                    "accept",
                                    style: TextStyle(fontFamily: "Poppins"),
                                  )),
                              ElevatedButton(
                                  onPressed: () {
                                    Reject();
                                    showError(context, "",
                                        "The request for connect is Rejected.");
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                NotificationPage()));
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        const Color.fromRGBO(255, 93, 78, 1),
                                    shape: StadiumBorder(),
                                  ),
                                  child: Text("Reject",
                                      style: TextStyle(fontFamily: "Poppins"))),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 40,
                    )
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

// mydialog() {
//   var widget;
//   return Stack(children: <Widget>[
//     Container(
//         padding: EdgeInsets.only(
//             left: Constants.padding,
//             top: Constants.avatarRadius + Constants.padding,
//             right: Constants.padding,
//             bottom: Constants.padding),
//         margin: EdgeInsets.only(top: Constants.avatarRadius),
//         decoration: BoxDecoration(
//             shape: BoxShape.rectangle,
//             color: Colors.white,
//             borderRadius: BorderRadius.circular(Constants.padding),
//             boxShadow: [
//               BoxShadow(
//                   color: Colors.black, offset: Offset(0, 10), blurRadius: 10),
//             ]),
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: <Widget>[
//             Text(
//               "hi bro",
//               style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
//             ),
//             SizedBox(
//               height: 15,
//             ),
//             Text(
//               "hello bro",
//               style: TextStyle(fontSize: 14),
//               textAlign: TextAlign.center,
//             ),
//             SizedBox(
//               height: 22,
//             ),
//             Align(
//               alignment: Alignment.bottomRight,
//               child: ElevatedButton(
//                   onPressed: () {
//                     // Navigator.of(context).pop();
//                   },
//                   child: Text(
//                     widget.text,
//                     style: TextStyle(fontSize: 18),
//                   )),
//             ),
//           ],
//         ))
//   ]);
// }
