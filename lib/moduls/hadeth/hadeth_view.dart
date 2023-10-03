import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/moduls/hadeth/hadeth_details_view.dart';

class HadethView extends StatefulWidget {
  HadethView({super.key});

  @override
  State<HadethView> createState() => _HadethViewState();
}

class _HadethViewState extends State<HadethView> {
  List<HadethContent> allHadethContant = [];

  @override
  Widget build(BuildContext context) {
    if (allHadethContant.isEmpty) readFile();
    var theme = Theme.of(context);
    return Column(
      children: [
        Image.asset("assets/icons/hadeth_header.png"),
        Divider(
          thickness: 1.5,
          endIndent: 10,
          indent: 10,
          height: 10,
        ),
        Text(
          "الاحاديث",
          style: theme.textTheme.bodyMedium,
        ),
        Divider(
          thickness: 1.5,
          endIndent: 10,
          indent: 10,
          height: 10,
        ),
        Expanded(
          child: ListView.separated(
            itemBuilder: (context, index) => GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, HadethDetailsView.routeName,
                    arguments: HadethContent(
                        title: allHadethContant[index].title,
                        content: allHadethContant[index].content));
              },
              child: Text(
                allHadethContant[index].title,
                textAlign: TextAlign.center,
              ),
            ),
            separatorBuilder: (context, index) => Divider(
              thickness: 1.5,
              endIndent: 88,
              indent: 80,
              height: 10,
            ),
            itemCount: allHadethContant.length,
          ),
        )
      ],
    );
  }

  readFile() async {
    String text = await rootBundle.loadString("assets/files/ahadeth.txt");
    List<String> allHadeth = text.split("#");

    for (int i = 0; i < allHadeth.length; i++) {
      String singleHadeth = allHadeth[i].trim();
      int indexOfFirstLine = singleHadeth.indexOf("\n");
      String title = singleHadeth.substring(0, indexOfFirstLine);
      String content = singleHadeth.substring(indexOfFirstLine + 1);

      HadethContent hadethContent =
          HadethContent(title: title, content: content);

      setState(() {
        allHadethContant.add(hadethContent);
      });

      print(title);
    }
  }
}

class HadethContent {
  final String title;
  final String content;

  HadethContent({required this.title, required this.content});
}
