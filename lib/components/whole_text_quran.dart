import 'package:flutter/material.dart';
import 'package:iqra/components/bismallah.dart';
import 'package:iqra/models/quran_settings.dart';
import 'package:iqra/models/surah.dart';
import 'package:provider/provider.dart';
import 'package:iqra/utlis/ayah_symbol.dart';

class WholeTextQuran extends StatelessWidget {
  final Surah s;
  final int i;

  const WholeTextQuran({
    super.key,
    required this.s,
    required this.i,
  });

  @override
  Widget build(BuildContext context) {
    final quranSettings = Provider.of<QuranSettings>(context, listen: false);

    final shouldShowBismAllah = i != 0 && i != 8;

    return ListView(
      padding: const EdgeInsets.only(left: 32, right: 32, top: 8, bottom: 32),
      children: [
        if (shouldShowBismAllah) const BismAllah(),
        SelectableText(
          AyahSymbol(s.ar),
          textAlign: TextAlign.justify,
          textDirection: TextDirection.rtl,
          style: TextStyle(
            locale: const Locale("ar"),
            fontSize: quranSettings.fontSize,
            fontWeight: quranSettings.quranFontBold
                ? FontWeight.bold
                : FontWeight.normal,
            fontFamily: "Uthman",
            height: quranSettings.spaceBetweenWords,
          ),
        ),
      ],
    );
  }
}
