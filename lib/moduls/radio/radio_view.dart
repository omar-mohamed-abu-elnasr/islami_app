import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/theme/application_theme.dart';

class RadioView extends StatelessWidget {
  const RadioView({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = ApplicationTheme.lightTheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 50),
      child: Column(
        children: [
          Container(
              margin: EdgeInsets.only(top: 70.0, bottom: 50.0),
              child: Image.asset(
                'assets/icons/radio_image.png',
                fit: BoxFit.cover,
              )),
          Container(
            margin: EdgeInsets.only(bottom: 50.0),
            child: Text(
              'إذاعة القرأن الكريم',
              style: GoogleFonts.elMessiri(fontSize: 38.0),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ImageIcon(
                AssetImage('assets/icons/previous.png'),
                color: theme.primaryColor,
                size: 40.0,
              ),
              ImageIcon(
                AssetImage('assets/icons/play.png'),
                color: theme.primaryColor,
                size: 40.0,
              ),
              ImageIcon(
                AssetImage('assets/icons/next.png'),
                color: theme.primaryColor,
                size: 40.0,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
