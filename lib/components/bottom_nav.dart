import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class BottamNavBar extends StatefulWidget {
  const BottamNavBar({super.key});

  @override
  State<BottamNavBar> createState() => _BottamNavBarState();
}

class _BottamNavBarState extends State<BottamNavBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        color: Colors.black,
        child: const Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
          child: GNav(
            gap: 8,
            padding: EdgeInsets.all(16),
            backgroundColor: Colors.black,
            activeColor: Colors.white,
            tabBackgroundColor: Colors.grey,
            tabs: const [
              GButton(
                icon: Icons.home,
                text: "Home",
                iconColor: Colors.white,
              ),
              GButton(
                icon: Icons.favorite,
                text: "Like",
                iconColor: Colors.white,
              ),
              GButton(
                icon: Icons.search,
                text: "Search",
                iconColor: Colors.white,
              ),
              GButton(
                icon: Icons.settings,
                text: "Settings",
                iconColor: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
