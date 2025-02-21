import 'package:flutter/material.dart';

class PrayerTile extends StatelessWidget {
  final String text;
  final String time;
  const PrayerTile({super.key, required this.text, required this.time});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(12),
      ),
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: const TextStyle(
              fontFamily: "Almarai",
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            time,
            style: const TextStyle(
              fontFamily: "Almarai",
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
