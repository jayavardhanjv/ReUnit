// import 'package:flutter/cupertino.dart';
// import 'dart:js';

import 'package:flutter/material.dart';

Future<void> showConfirm(
  BuildContext context,
  String text,
) {
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Do You want to Logout?"),
          // content: Text(text),
          actions: [
            MaterialButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Cancel"),
            ),
            MaterialButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("OK"),
            )
          ],
        );
      });
}
