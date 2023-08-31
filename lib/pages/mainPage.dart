import 'package:flutter/material.dart';
import 'package:gaming_accessories_rent_app/pages/found_page.dart';
import 'package:gaming_accessories_rent_app/pages/home.dart';
import 'package:gaming_accessories_rent_app/pages/lost_page.dart';
import 'package:gaming_accessories_rent_app/pages/notification_page.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List Pages = [HomePage(), LostPage(), FoundPage(), NotificationPage()];
  int currentindex = 0;
  void onTap(int index) {
    setState(() {
      currentindex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Pages[currentindex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedFontSize: 0,
        unselectedFontSize: 0,
        onTap: onTap,
        elevation: 0,
        unselectedItemColor: Colors.grey.withOpacity(0.5),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: currentindex,
        selectedItemColor: Colors.black54,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.apps),
            label: "home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_bubble),
            label: "lost",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: "notification",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "About",
          ),
        ],
      ),
    );
  }
}
