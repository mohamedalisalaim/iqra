import 'package:easy_container/easy_container.dart';
import 'package:flutter/material.dart';
import 'package:iqra/components/setting_tile.dart';
import 'package:iqra/models/theme_provider.dart';
import 'package:provider/provider.dart';

class AboutTheDeveloperPage extends StatefulWidget {
  const AboutTheDeveloperPage({super.key});

  @override
  State<AboutTheDeveloperPage> createState() => _AboutTheDeveloperPageState();
}

class _AboutTheDeveloperPageState extends State<AboutTheDeveloperPage> {
  void showMyImage() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Theme.of(context).colorScheme.primary,
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "Made By",
                style: TextStyle(fontFamily: "Almarai"),
                textAlign: TextAlign.center,
              ),
              ClipOval(
                child: Image.asset(
                  "lib/assets/images/Mohamed Ali Salaim.jpeg",
                  width: MediaQuery.of(context).size.width * 0.5,
                ),
              ),
              const Text(
                "Mohamed Ali Salaim",
                style: TextStyle(fontFamily: "Almarai"),
                textAlign: TextAlign.center,
              ),
              const Text(
                "Just A Muslim Starving For Junah",
                style: TextStyle(fontFamily: "Almarai"),
                textAlign: TextAlign.center,
              ),
              const Text(
                "Dont Forget To Pray To Me And My Family",
                style: TextStyle(fontFamily: "Almarai"),
                textAlign: TextAlign.center,
              ),
              const Text(
                "Made With ❤",
                style: TextStyle(fontFamily: "Almarai"),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        padding: const EdgeInsets.all(25),
        children: [
          SettingTile(
            text: "Dark Mode",
            onChanged: (value) => theme.toggleTheme(),
            value: theme.isDarkMode,
          ),
          EasyContainer(
            onTap: showMyImage,
            child: const Text("About The Developer"),
          ),
        ],
      ),
    );
  }
}
