import 'package:flutter/material.dart';
import 'package:iqra/components/prayer_tile.dart';
import 'package:iqra/models/prayer.dart';
import 'package:iqra/services/prayer_times_service.dart';

class PrayerTimesPage extends StatefulWidget {
  const PrayerTimesPage({super.key});

  @override
  _PrayerTimesPageState createState() => _PrayerTimesPageState();
}

class _PrayerTimesPageState extends State<PrayerTimesPage> {
  final _prayers = PrayerTimesService();
  Prayer? p;

  getPrayersTimes() async {
    try {
      final pos = await _prayers.getCurrentLocation();

      final _p = await _prayers.getPrayers(pos.latitude, pos.longitude);

      setState(() {
        p = _p;
      });
    } catch (e) {
      return Exception("help me pleases");
    }
  }

  @override
  void initState() {
    getPrayersTimes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _buildUi();
  }

  Widget _buildUi() {
    return SafeArea(
      child: Center(
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              Flexible(
                child: ListView(
                  padding: const EdgeInsets.all(8),
                  children: [
                    const Text(
                      "رَبِّ ٱجۡعَلۡنِي مُقِيمَ ٱلصَّلَوٰةِ وَمِن ذُرِّيَّتِيۚ رَبَّنَا وَتَقَبَّلۡ دُعَآءِ",
                      textAlign: TextAlign.center,
                      textDirection: TextDirection.rtl,
                      style: TextStyle(
                        fontFamily: "Uthman",
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    PrayerTile(text: "Fajr", time: p?.Fajr ?? "Not available"),
                    PrayerTile(
                        text: "Sunrise", time: p?.Sunrise ?? "Not available"),
                    PrayerTile(
                        text: "Dhuhr", time: p?.Dhuhr ?? "Not available"),
                    PrayerTile(text: "Asr", time: p?.Asr ?? "Not available"),
                    PrayerTile(
                        text: "Sunset", time: p?.Sunset ?? "Not available"),
                    PrayerTile(
                        text: "Maghrib", time: p?.Maghrib ?? "Not available"),
                    PrayerTile(text: "Isha", time: p?.Isha ?? "Not available"),
                    PrayerTile(
                        text: "Imsak", time: p?.Imsak ?? "Not available"),
                    PrayerTile(
                        text: "Midnight", time: p?.Midnight ?? "Not available"),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
