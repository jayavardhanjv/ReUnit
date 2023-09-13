import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Future<void> showconnect(
  BuildContext context,
  String email,
  String title,
  String username,
  String phone,
  String address,
) {
  return showDialog(
      context: context,
      builder: (context) {
        return Container(
          child: AlertDialog(
            title: Text(title),
            content: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(username),
                      // ElevatedButton.icon(
                      //     onPressed: () {},
                      //     icon: Icon(Icons.copy),
                      //     label: Text("copy")),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(email),
                      // ElevatedButton.icon(
                      //     onPressed: () {},
                      //     icon: Icon(Icons.copy),
                      //     label: Text("copy")),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(address),
                      // ElevatedButton.icon(
                      //     onPressed: () {},
                      //     icon: Icon(Icons.copy),
                      //     label: Text("copy")),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(phone),
                      // ElevatedButton.icon(
                      //     onPressed: () {},
                      //     icon: Icon(Icons.copy),
                      //     label: Text("copy")),
                    ],
                  ),
                ],
              ),
            ),
            actions: [
              MaterialButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("OK"),
              )
            ],
          ),
        );
      });
}
