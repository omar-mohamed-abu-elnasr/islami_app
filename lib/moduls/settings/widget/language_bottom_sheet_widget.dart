import 'package:flutter/material.dart';
import 'package:islami/core/provider/app_provider.dart';
import 'package:islami/moduls/settings/widget/selected_option.dart';
import 'package:islami/moduls/settings/widget/unselected_option.dart';
import 'package:provider/provider.dart';

class LanguageBottomSheet extends StatelessWidget {
  const LanguageBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var appProvider = Provider.of<AppProvider>(context);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 25, vertical: 60),
      decoration: BoxDecoration(
        color: theme.primaryColor.withOpacity(0.8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              appProvider.changeLanguage("en");
              Navigator.pop(context);
            },
            child: appProvider.changeLanguage == ("en")
                ? SelectedOption(selectedTitle: "English")
                : UnSelectedOption(unSelectedTitle: "English"),
          ),
          ///////////////////////////////////////////////////////////////////////////////
          SizedBox(height: 30),
          ///////////////////////////////////////////////////////////////////////////////
          GestureDetector(
            onTap: () {
              appProvider.changeLanguage("ar");
              Navigator.pop(context);
            },
            child: appProvider.changeLanguage == ("en")
                ? UnSelectedOption(unSelectedTitle: "عربي")
                : SelectedOption(selectedTitle: "عربي"),
          ),
        ],
      ),
    );
  }
}
