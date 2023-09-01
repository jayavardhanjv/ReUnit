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
      body: Container(child: BigText(text: "Notification")),
    );
  }
}
