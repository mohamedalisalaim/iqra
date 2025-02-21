import 'package:easy_container/easy_container.dart';
import 'package:flutter/material.dart';
import 'package:iqra/models/surah.dart';
import 'package:iqra/utlis/arabic_numbers.dart';

class SurahTile extends StatelessWidget {
  final Surah s;
  final int i;
  final void Function()? onPressed;
  const SurahTile({
    super.key,
    required this.s,
    required this.i,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return EasyContainer(
      allowOverflow: false,
      color: Theme.of(context).colorScheme.primary,
      padding: 25,
      margin: 8,
      borderRadius: 12,
      onTap: onPressed,
      child: Column(
        children: [
          // surah name and index
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "${i + 1} ${s.name_translation}",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: "Almarai",
                  fontSize: 12,
                ),
              ),
              Text(
                "${ArabicNumber((i + 1).toString())} ${s.name}",
                textDirection: TextDirection.rtl,
                style: const TextStyle(
                  fontFamily: "Cairo",
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              )
            ],
          ),

          // there are no space so i have to do this
          Text(
            "${s.type} - (${ArabicNumber(s.verses.toString())})",
            style: const TextStyle(
              fontFamily: "Cairo",
              fontWeight: FontWeight.bold,
              fontSize: 12,
            ),
          ),

          // another row

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "ألاحرف: ${ArabicNumber(s.letters.toString())}",
                style: const TextStyle(
                  fontFamily: "Cairo",
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
              Text(
                "ألكلمات: ${ArabicNumber(s.words.toString())}",
                style: const TextStyle(
                  fontFamily: "Cairo",
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
