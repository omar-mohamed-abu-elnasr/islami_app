import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami/core/provider/app_provider.dart';
import 'package:islami/moduls/hadeth/hadeth_view.dart';
import 'package:islami/moduls/quran/quran_view.dart';
import 'package:islami/moduls/radio/radio_view.dart';
import 'package:islami/moduls/sebha/sebha_view.dart';
import 'package:islami/moduls/settings/settings_view.dart';
import 'package:provider/provider.dart';

class HomeLayout extends StatefulWidget {

  static const String routeName = "home_layout";


   HomeLayout({super.key});

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  int selectedIndex = 0;
  List<Widget> screens = [
    SettingsView(),
    RadioView(),
    SebhaView(),
    HadethView(),
    QuranView(),
  ];

  @override
  Widget build(BuildContext context) {
    var appProvider = Provider.of<AppProvider>(context);

    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(appProvider.backgroundImage()),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        //////////////////////////////////////////
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.islami),
        ),
        ////////////////////////////////////////////////
        body: screens[selectedIndex] ,
        //////////////////////////////////////////////////
        bottomNavigationBar: BottomNavigationBar(

          onTap: (int index){
            setState(() {
              selectedIndex =index;
            });
          },
          currentIndex: selectedIndex,
          items: [
            BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage("assets/icons/settings.png"),
                ),
                label: AppLocalizations.of(context)!.settings),
            BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage("assets/icons/radio.png"),
                ),
                label: AppLocalizations.of(context)!.radio),
            BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage("assets/icons/sebha.png"),
                ),
                label: AppLocalizations.of(context)!.tasbeh),
            BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage("assets/icons/moshaf_blue.png"),
                ),
                label: AppLocalizations.of(context)!.hadeth),
            BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage("assets/icons/quran.png"),
                ),
                label: AppLocalizations.of(context)!.qruan),
          ],
        ),
///////////////////////////////////////////////////////

      ),
    );
  }
}
