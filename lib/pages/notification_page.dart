import 'package:flutter/material.dart';
import 'package:gaming_accessories_rent_app/components/bigText.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(color: Colors.red[300]),
        child: Column(
          children: [
            const Padding(padding: EdgeInsets.only(top: 80)),
            const BigText(text: "Notification"),
            const SizedBox(
              height: 40,
            ),
            SafeArea(
              child: Container(
                // child: const BigText(text: "Notification"),
                padding: const EdgeInsets.only(top: 30),
                height: 641,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
