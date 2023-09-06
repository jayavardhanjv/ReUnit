import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class GettheData extends StatelessWidget {
  final String documentid;
  GettheData({required this.documentid});

  @override
  Widget build(BuildContext context) {
    CollectionReference reports =
        FirebaseFirestore.instance.collection("FoundItems");
    return FutureBuilder<DocumentSnapshot>(
      future: reports.doc(documentid).get(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;
          return Text(data["address"]);
        }
        return Text("Losading,.....");
      },
    );
  }
}
