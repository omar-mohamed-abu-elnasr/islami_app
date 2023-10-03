import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami/core/provider/app_provider.dart';
import 'package:islami/moduls/settings/widget/language_bottom_sheet_widget.dart';
import 'package:islami/moduls/settings/widget/setting_item.dart';
import 'package:islami/moduls/settings/widget/theme_mood_bottom_sheet.dart';
import 'package:provider/provider.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var mediaQuery = MediaQuery.of(context).size;
    var appProvider = Provider.of<AppProvider>(context);
    var local = AppLocalizations.of(context)!;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 60),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SettingItem(
            settingOptionTitle: local.language,
            selectedOption:
                appProvider.changeLanguage == ("en") ? "English" : "عربي",
            onOptionToped: () {
              showLanguageBottomSheet(context);
            },
          ),
          /////////////////////////////////////////////////////////////////////////////////
          SizedBox(height: 50),

          SettingItem(
            settingOptionTitle: local.theme_mood,
            selectedOption: appProvider.isDark() ? local.dark : local.light,
            onOptionToped: () {
              showThemeBottomSheet(context);
            },
          ),
          ///////////////////////////////////////////////////////
        ],
      ),
    );
  }

  void showLanguageBottomSheet(context) {
    showModalBottomSheet(
        context: context, builder: (context) => LanguageBottomSheet());
  }

  void showThemeBottomSheet(context) {
    showModalBottomSheet(
        context: context, builder: (context) => ThemeMoodBottom());
  }
}
