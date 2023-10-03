import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/theme/application_theme.dart';

class SebhaView extends StatefulWidget {
  const SebhaView({super.key});

  @override
  State<SebhaView> createState() => _SebhaState();
}

class _SebhaState extends State<SebhaView> {
  int count = 1;
  int add = 1;
  double angle = 0.0;
  String doaa = "سبحان الله";

  @override
  Widget build(BuildContext context) {
    if (add == 31) add = 0;
    var theme = ApplicationTheme.lightTheme;
    return Container(
      width: double.infinity,
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                margin: const EdgeInsets.only(left: 100.0),
                child: Image.asset(
                  "assets/icons/head_sebha_logo.png",
                  fit: BoxFit.cover,
                ),
              ),
              Column(
                children: [
                  const SizedBox(
                    height: 65,
                  ),
                  Transform.rotate(
                    angle: angle,
                    child: Container(
                      width: 200.0,
                      height: 200.0,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                            'assets/icons/body_sebha_logo.png',
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.only(top: 240, left: 100),
                width: 23.0,
                height: 23.0,
                child: CircleAvatar(
                  backgroundColor: theme.primaryColor,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 90, left: 25),
                width: 23.0,
                height: 23.0,
                child: CircleAvatar(
                  backgroundColor: theme.primaryColor,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 180, left: 170),
                width: 23.0,
                height: 23.0,
                child: CircleAvatar(
                  backgroundColor: theme.primaryColor,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20.0,
          ),
          const Text(
            'التسبيحات',
          ),
          Container(
            width: 80.0,
            height: 80.0,
            child: CircleAvatar(
              backgroundColor: theme.primaryColor,
              child: Text(
                '$add',
                style: const TextStyle(color: Colors.white, fontSize: 30.0),
              ),
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          MaterialButton(
            onPressed: () {
              setState(() {
                count++;
                add++;
                angle += 0.1;
                changeDoaa();
              });
              print(count);
            },
            height: 50.0,
            color: theme.primaryColor,
            padding:
                const EdgeInsets.symmetric(vertical: 20.0, horizontal: 15.0),
            child: Text(
              doaa,
              style: GoogleFonts.elMessiri(
                fontSize: 25.0,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  changeDoaa() {
    if (count <= 33) {
      doaa = "سبحان الله";
    } else if (count <= 66) {
      doaa = "الحمد الله";
    } else if (count <= 99) {
      doaa = "الله أكبر";
    } else if (count == 100) {
      count = 1;
      add = 1;
    }
  }
}
