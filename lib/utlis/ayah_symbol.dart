String getVerseEndSymbol(String verseNumber, {bool arabicNumeral = true}) {
  if (!arabicNumeral) {
    return '\u06dd$verseNumber';
  }

  const Map<String, String> arabicNumbers = {
    "0": "٠", "1": "١", "2": "٢", "3": "٣", "4": "٤",
    "5": "٥", "6": "٦", "7": "٧", "8": "٨", "9": "٩",
  };

  final buffer = StringBuffer();
  for (var e in verseNumber.runes) {
    buffer.write(arabicNumbers[String.fromCharCode(e)] ?? String.fromCharCode(e));
  }

  return '\u06dd${buffer.toString()}';
}

String AyahSymbol(String value, {bool arabicNumeral = true}) {
  // Check and replace only if verse-end symbols are not already present
  return value.replaceAllMapped(RegExp(r'\((\d+)\)'), (match) {
    return getVerseEndSymbol(match.group(1)!, arabicNumeral: arabicNumeral);
  }).replaceAll('\u06dd', ''); // Removes pre-existing symbols to avoid duplication.
}

