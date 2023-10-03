import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami/core/provider/app_provider.dart';
import 'package:islami/core/theme/application_theme.dart';
import 'package:islami/layout/home_layout.dart';
import 'package:islami/moduls/quran/quran_details_view.dart';
import 'package:islami/moduls/splash_screen/splash-screen.dart';
import 'package:provider/provider.dart';

import 'moduls/hadeth/hadeth_details_view.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
        create: (context) => AppProvider(), child: const MyApplcation()),
  );
}

class MyApplcation extends StatelessWidget {
  const MyApplcation({super.key});

  @override
  Widget build(BuildContext context) {
    ///////////////////////////////////////////
    var appProvider = Provider.of<AppProvider>(context);
    /////////////////////////////////////////
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      ///////////////////////////////////
      theme: ApplicationTheme.lightTheme,
      darkTheme: ApplicationTheme.darkTheme,
      themeMode: appProvider.currentTheme,
      ////////////////////////////////////////////
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(appProvider.currentLocal),
      ///////////////////////////////////
      initialRoute: Splashscreen.routeName,
      routes: {
        Splashscreen.routeName: (context) => const Splashscreen(),
        HomeLayout.routeName: (context) => HomeLayout(),
        QuranDetailsView.routeName: (context) => QuranDetailsView(),
        HadethDetailsView.routeName: (context) => HadethDetailsView(),
      },
    );
  }
}
