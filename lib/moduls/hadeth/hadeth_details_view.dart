import 'package:flutter/material.dart';
import 'package:islami/moduls/hadeth/hadeth_view.dart';
import 'package:provider/provider.dart';

import '../../core/provider/app_provider.dart';

class HadethDetailsView extends StatefulWidget {
  static const String routeName = "Hadeth_Details";

  HadethDetailsView({super.key});

  @override
  State<HadethDetailsView> createState() => _HadethDetailsViewState();
}

class _HadethDetailsViewState extends State<HadethDetailsView> {
  String content = "";
  List<String> allVerses = [];

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as HadethContent;
    var mediaQuery = MediaQuery.of(context).size;
    var theme = Theme.of(context);
    var appProvider = Provider.of<AppProvider>(context);
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(appProvider.backgroundImage()),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text("اسلامي"),
        ),
        body: Container(
          margin: EdgeInsets.only(left: 30, right: 30, top: 50, bottom: 120),
          padding: EdgeInsets.symmetric(vertical: 40, horizontal: 15),
          width: mediaQuery.width,
          height: mediaQuery.height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: theme.colorScheme.onBackground.withOpacity(0.6),
          ),
          child: Column(
            children: [
              Text(
                args.title,
                style: theme.textTheme.bodyLarge!.copyWith(
                  color: theme.colorScheme.onSecondary,
                ),
              ),
              /////////////////////////////////////////////
              Divider(
                endIndent: 30,
                indent: 30,
                thickness: 1.2,
                height: 10,
              ),
              //////////////////////////////////////////
              Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) => Text(
                    args.content,
                    textAlign: TextAlign.center,
                    style: theme.textTheme.bodySmall!.copyWith(
                      color: theme.colorScheme.onSecondary,
                    ),
                  ),
                  itemCount: 1,
                ),
              ),
              // Expanded(
              //   child: ListView.builder(itemBuilder:
              //         (context, index) =>
              //         Text(
              //           '{(${index + 1})}${allVerses[index]}',
              //       textAlign: TextAlign.center,
              //       style: theme.textTheme.bodySmall,
              //     ),
              //     itemCount: allVerses.length,
              //   ),
              //
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
