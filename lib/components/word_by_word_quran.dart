import 'package:easy_container/easy_container.dart';
import 'package:flutter/material.dart';
import 'package:iqra/models/irab.dart';
import 'package:iqra/models/meaning.dart';
import 'package:iqra/models/quran_settings.dart';
import 'package:iqra/models/surah.dart';
import 'package:iqra/utlis/arabic_numbers.dart';
import 'package:provider/provider.dart';

class WordByWordQuran extends StatefulWidget {
  final Surah s;
  final int i;
  final List<Irab> irabs;
  final List<Meaning> meanings;
  const WordByWordQuran({
    super.key,
    required this.s,
    required this.i,
    required this.irabs,
    required this.meanings,
  });

  @override
  State<WordByWordQuran> createState() => _WordByWordQuranState();
}

class _WordByWordQuranState extends State<WordByWordQuran> {
  String preprocessText(String text) {
    return text.replaceAll('<p>', '').replaceAll('</p>', '\n\n');
  }

  String preprocessText2(String text) {
    return text.replaceAll('<br>', ' ');
  }

  void showVerseData(int index) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return ListView(
          padding: EdgeInsets.all(25),
          children: [
            Text(
              "ألاعراب",
              textDirection: TextDirection.rtl,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: "Uthman",
                fontSize: 18,
              ),
            ),

            Text(
              preprocessText(widget.irabs[index].irab),
              textDirection: TextDirection.rtl,
              style: TextStyle(
                fontFamily: "Uthman",
                fontSize: 18,
              ),
            ),

            Divider(),

            // meanings
            Text(
              "المعاني",
              textDirection: TextDirection.rtl,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: "Uthman",
                fontSize: 18,
              ),
            ),

            Text(
              preprocessText2(widget.meanings[index].meaning),
              textDirection: TextDirection.rtl,
              style: TextStyle(
                fontFamily: "Uthman",
                fontSize: 18,
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildQuranText();
  }

  Widget _buildQuranText() {
    final quran = Provider.of<QuranSettings>(context, listen: false);
    // final shouldShowBismAllah = widget.i != 0 && widget.i != 8;

    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: 32),
      itemCount: widget.s.array.length,
      itemBuilder: (context, index) {
        return EasyContainer(
          alignment: Alignment.centerRight,
          onTap: () => showVerseData(index),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  widget.s.array[index]["ar"] +
                      ArabicNumber(widget.s.array[index]["id"].toString()),
                  textAlign: TextAlign.start,
                  textDirection: TextDirection.rtl,
                  style: TextStyle(
                    fontFamily: "Uthman",
                    fontSize: quran.fontSize,
                    fontWeight: quran.quranFontBold
                        ? FontWeight.bold
                        : FontWeight.normal,
                    height: quran.spaceBetweenWords,
                  ),
                ),
              ),

              // english text
              if (quran.showEnglishText)
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    widget.s.array[index]["en"],
                    textAlign: TextAlign.left,
                    textDirection: TextDirection.ltr,
                    style: TextStyle(
                      fontWeight: quran.quranFontBold
                          ? FontWeight.bold
                          : FontWeight.normal,
                      fontFamily: "Almarai",
                      fontSize: quran.fontSizeEN,
                      height: quran.spaceBetweenWords,
                    ),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}

// Text(
//               preprocessText(widget.irabs[index].irab),
//               textDirection: TextDirection.rtl,
//               style: TextStyle(
//                 fontFamily: "Uthman",
//                 fontSize: 16,
//               ),
//             ),
