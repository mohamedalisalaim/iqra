import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iqra/components/setting_tile.dart';

import 'package:iqra/components/whole_text_quran.dart';
import 'package:iqra/components/word_by_word_quran.dart';
import 'package:iqra/models/irab.dart';
import 'package:iqra/models/meaning.dart';
import 'package:iqra/models/quran_settings.dart';
import 'package:iqra/models/surah.dart';
import 'package:provider/provider.dart';
import 'package:wakelock_plus/wakelock_plus.dart';

class ReadQuranPage extends StatefulWidget {
  final Surah s;
  final int i;

  const ReadQuranPage({
    super.key,
    required this.s,
    required this.i,
  });

  @override
  _ReadQuranPageState createState() => _ReadQuranPageState();
}

class _ReadQuranPageState extends State<ReadQuranPage> {
  List<Irab> irabs = [];
  List<Meaning> meanings = [];

  Future getIrab(int surahIndex) async {
    var jsonString = await rootBundle.loadString("lib/assets/irab.json");
    var json = jsonDecode(jsonString);

    for (int i = 0; i < json.length; i++) {
      if (json[i]["sura"] == surahIndex) {
        final irab = Irab(irab: json[i]["text"]);
        irabs.add(irab);
      }
    }

    setState(() {});
  }

  Future getMeanings(int surahIndex) async {
    var jsonString = await rootBundle.loadString("lib/assets/meaning.json");
    var json = jsonDecode(jsonString);

    for (int i = 0; i < json.length; i++) {
      if (json[i]["sura"] == surahIndex) {
        final meaning = Meaning(meaning: json[i]["text"]);
        meanings.add(meaning);
      }
    }

    setState(() {});
  }

  void openModalBottomSheet() {
    showModalBottomSheet(
      enableDrag: true,
      context: context,
      builder: (context) {
        final quranSetting = Provider.of<QuranSettings>(context, listen: true);

        return ListView(
          padding: EdgeInsets.all(25),
          children: [
            // verse by verse
            SettingTile(
              text: "Verse By Verse",
              onChanged: (type) => quranSetting.changeReadingMode(),
              value: quranSetting.verseByVerse,
            ),

            Divider(),

            // quran font bold
            SettingTile(
              text: "Quran Bold text",
              onChanged: (type) => quranSetting.quranBoldFont(),
              value: quranSetting.quranFontBold,
            ),

            // font size here
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Font Size",
                  style: TextStyle(
                    fontFamily: "Almarai",
                    fontSize: 18,
                  ),
                ),
                Slider(
                  activeColor: Theme.of(context).colorScheme.primary,
                  divisions: 7,
                  min: 8,
                  max: 64,
                  label: quranSetting.fontSize.toString(),
                  value: quranSetting.fontSize,
                  onChanged: (value) => quranSetting.changeFontSize(value),
                ),
              ],
            ),

            // heigth between words

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Font Height",
                  style: TextStyle(
                    fontFamily: "Almarai",
                    fontSize: 18,
                  ),
                ),
                Slider(
                  activeColor: Theme.of(context).colorScheme.primary,
                  divisions: 4,
                  label: quranSetting.spaceBetweenWords.toString(),
                  min: 1,
                  max: 3,
                  value: quranSetting.spaceBetweenWords,
                  onChanged: (value) => quranSetting.changeFontHeight(value),
                ),
              ],
            ),

            Divider(),

            // show english text
            SettingTile(
              text: "Show English Quran Text",
              onChanged: (type) => quranSetting.showEnglishQuran(),
              value: quranSetting.showEnglishText,
            ),
            // english text size
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "English Font Size",
                  style: TextStyle(
                    fontFamily: "Almarai",
                    fontSize: 18,
                  ),
                ),
                Slider(
                  activeColor: Theme.of(context).colorScheme.primary,
                  divisions: 4,
                  label: quranSetting.fontSizeEN.toString(),
                  min: 8,
                  max: 24,
                  value: quranSetting.fontSizeEN,
                  onChanged: (value) => quranSetting.changeFontSizeEn(value),
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  @override
  void initState() {
    getIrab(widget.i + 1);
    getMeanings(widget.i + 1);
    WakelockPlus.enable();
    super.initState();
  }

  @override
  void dispose() {
    WakelockPlus.disable();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final quran = Provider.of<QuranSettings>(context);
    return Scaffold(
      // the app Bar
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title: Text(
          widget.s.name,
          textDirection: TextDirection.rtl,
          style: TextStyle(
            fontSize: 22,
            fontWeight:
                quran.quranFontBold ? FontWeight.bold : FontWeight.normal,
            fontFamily: "Uthman",
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: IconButton(
              onPressed: openModalBottomSheet,
              icon: const Icon(Icons.settings_rounded),
            ),
          ),
        ],
      ),

      //the body
      body: Column(
        children: [
          quran.verseByVerse
              ? Flexible(
                  child: WordByWordQuran(
                  s: widget.s,
                  i: widget.i,
                  irabs: irabs,
                  meanings: meanings,
                ))
              : Flexible(child: WholeTextQuran(s: widget.s, i: widget.i)),
        ],
      ),
    );
  }
}
