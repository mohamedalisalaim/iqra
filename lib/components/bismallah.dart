import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:iqra/models/quran_settings.dart';

class BismAllah extends StatefulWidget {
  const BismAllah({super.key});

  @override
  State<BismAllah> createState() => _BismAllahState();
}

class _BismAllahState extends State<BismAllah> {
  @override
  Widget build(BuildContext context) {
    final quranSettings = Provider.of<QuranSettings>(context, listen: false);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Text(
        textAlign: TextAlign.center,
        "بِسۡمِ ٱللَّهِ ٱلرَّحۡمَٰنِ ٱلرَّحِيمِ",
        style: TextStyle(
          fontFamily: "Uthman",
          fontSize: quranSettings.fontSize,
          fontWeight: (quranSettings.quranFontBold)
              ? FontWeight.bold
              : FontWeight.normal,
        ),
      ),
    );
  }
}
