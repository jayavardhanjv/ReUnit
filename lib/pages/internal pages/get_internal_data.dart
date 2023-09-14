import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class GettheData extends StatelessWidget {
  final String documentid;
  final String whichitem;
  GettheData({
    required this.documentid,
    required this.whichitem,
  });

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
            try {
              _imagedata = data["image"];
            } catch (e) {
              _imagedata = "assets/images/no_image.png";
            }
            return Expanded(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                padding: EdgeInsets.all(20),
                width: MediaQuery.of(context).size.width - 20,
                height: 250,
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
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        // color: Color.fromRGBO(255, 93, 78, 1),
                        color: Colors.white,
                      ),
                      width: MediaQuery.of(context).size.width * 0.3,
                      height: 230,
                      child: Image.network(
                        _imagedata,
                        alignment: Alignment.center,
                        fit: BoxFit.contain,
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Container(
                          width: MediaQuery.of(context).size.width * 0.4,
                          child: Center(
                            child: Text(
                              data["title"],
                              overflow: TextOverflow.clip,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: "Poppins",
                                fontSize: 18,
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
                              data["des"],
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
                        new Container(
                          // padding: new EdgeInsets.only(right: 8.0),
                          height: 80,
                          width: MediaQuery.of(context).size.width * 0.4,
                          child: Center(
                            child: new Text(
                              data["address"],
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
