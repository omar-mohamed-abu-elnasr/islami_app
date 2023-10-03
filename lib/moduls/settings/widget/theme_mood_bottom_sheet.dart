import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami/core/provider/app_provider.dart';
import 'package:islami/moduls/settings/widget/selected_option.dart';
import 'package:islami/moduls/settings/widget/unselected_option.dart';
import 'package:provider/provider.dart';

class ThemeMoodBottom extends StatelessWidget {
  const ThemeMoodBottom({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var appProvider = Provider.of<AppProvider>(context);
    var local = AppLocalizations.of(context)!;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 25, vertical: 60),
      decoration: BoxDecoration(
        color: theme.primaryColor.withOpacity(0.8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ///////////////////////////////////////////////////
          GestureDetector(
            onTap: () {
              appProvider.changeTheme(ThemeMode.dark);
              Navigator.pop(context);
            },
            child: appProvider.isDark()
                ? SelectedOption(selectedTitle: local.dark)
                : UnSelectedOption(unSelectedTitle: local.dark),
          ),
          ///////////////////////////////////////////////////
          SizedBox(height: 30),

          /////////////////////////////////////////////////////////
          GestureDetector(
              onTap: () {
                appProvider.changeTheme(ThemeMode.light);
                Navigator.pop(context);
              },
              child: appProvider.isDark()
                  ? UnSelectedOption(unSelectedTitle: local.light)
                  : SelectedOption(selectedTitle: local.light)),
        ],
      ),
    );
  }
}
