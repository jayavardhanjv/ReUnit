import 'package:flutter/material.dart';

class BigText extends StatelessWidget {
  const BigText({
    super.key,
    required this.text,
  });
  final String text;
  // final String text = ttext;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
          padding: const EdgeInsets.only(left: 20),
          child: Text(
            text,
            style: const TextStyle(
              fontFamily: 'Poppins',
              color: Colors.black,
              fontSize: 38,
              fontWeight: FontWeight.bold,
            ),
          )),
    );
  }
}
