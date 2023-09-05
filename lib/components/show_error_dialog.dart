import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Future<void> showError(
  BuildContext context,
  String text,
  String title,
) {
  return showDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: Text(title),
          content: Text(text),
          actions: [
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
