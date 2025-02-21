import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class MyBottomNavBar extends StatelessWidget {
  void Function(int)? onTabChange;
  MyBottomNavBar({super.key, required this.onTabChange});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12, left: 16, right: 16),
      child: GNav(
        activeColor: Theme.of(context).colorScheme.primary,
        onTabChange: (value) => onTabChange!(value),
        tabBorderRadius: 12,
        gap: 12,
        tabs: const [
          GButton(
            text: "Prayer Times",
            icon: Icons.timer_rounded,
            textStyle: TextStyle(
              fontFamily: "Almarai",
              fontWeight: FontWeight.bold,
            ),
          ),
          GButton(
            // i did not find better than this menu icon
            icon: Icons.menu_book_rounded,
            text: "Quran",
            textStyle: TextStyle(
              fontFamily: "Almarai",
              fontWeight: FontWeight.bold,
            ),
          ),
          GButton(
            icon: Icons.mosque_rounded,
            text: "Qibla",
            textStyle: TextStyle(
              fontFamily: "Almarai",
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
