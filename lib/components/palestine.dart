import 'package:flutter/material.dart';

class Palestine extends StatelessWidget {
  const Palestine({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'lib/assets/images/Palestine.png',
      height: MediaQuery.of(context).size.height / 2 * 0.5,
      width: MediaQuery.of(context).size.width / 2 * 0.5,
    );
  }
}
