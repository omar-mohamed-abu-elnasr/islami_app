import 'package:flutter/material.dart';
import 'package:islami/moduls/quran/quran_details_view.dart';
import 'package:islami/moduls/quran/widget/quran_item.dart';

class QuranView extends StatelessWidget {
  QuranView({super.key});

  List<String> suraNames = [
    "الفاتحه",
    "البقرة",
    "آل عمران",
    "النساء",
    "المائدة",
    "الأنعام",
    "الأعراف",
    "الأنفال",
    "التوبة",
    "يونس",
    "هود",
    "يوسف",
    "الرعد",
    "إبراهيم",
    "الحجر",
    "النحل",
    "الإسراء",
    "الكهف",
    "مريم",
    "طه",
    "الأنبياء",
    "الحج",
    "المؤمنون",
    "النّور",
    "الفرقان",
    "الشعراء",
    "النّمل",
    "القصص",
    "العنكبوت",
    "الرّوم",
    "لقمان",
    "السجدة",
    "الأحزاب",
    "سبأ",
    "فاطر",
    "يس",
    "الصافات",
    "ص",
    "الزمر",
    "غافر",
    "فصّلت",
    "الشورى",
    "الزخرف",
    "الدّخان",
    "الجاثية",
    "الأحقاف",
    "محمد",
    "الفتح",
    "الحجرات",
    "ق",
    "الذاريات",
    "الطور",
    "النجم",
    "القمر",
    "الرحمن",
    "الواقعة",
    "الحديد",
    "المجادلة",
    "الحشر",
    "الممتحنة",
    "الصف",
    "الجمعة",
    "المنافقون",
    "التغابن",
    "الطلاق",
    "التحريم",
    "الملك",
    "القلم",
    "الحاقة",
    "المعارج",
    "نوح",
    "الجن",
    "المزّمّل",
    "المدّثر",
    "القيامة",
    "الإنسان",
    "المرسلات",
    "النبأ",
    "النازعات",
    "عبس",
    "التكوير",
    "الإنفطار",
    "المطفّفين",
    "الإنشقاق",
    "البروج",
    "الطارق",
    "الأعلى",
    "الغاشية",
    "الفجر",
    "البلد",
    "الشمس",
    "الليل",
    "الضحى",
    "الشرح",
    "التين",
    "العلق",
    "القدر",
    "البينة",
    "الزلزلة",
    "العاديات",
    "القارعة",
    "التكاثر",
    "العصر",
    "الهمزة",
    "الفيل",
    "قريش",
    "الماعون",
    "الكوثر",
    "الكافرون",
    "النصر",
    "المسد",
    "الإخلاص",
    "الفلق",
    "الناس"
  ];

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Column(
      children: [
        Image.asset("assets/icons/qruan_header.png"),
        Divider(
          thickness: 2.2,
          indent: 10,
          endIndent: 10,
          height: 5,
        ),
        Row(
          children: [
            Expanded(
              child: Text(
                "رقم السورة",
                textAlign: TextAlign.center,
                style: theme.textTheme.bodyMedium,
              ),
            ),
            Container(
              width: 1.5,
              height: 45,
              color: theme.colorScheme.onPrimary,
            ),
            Expanded(
              child: Text(
                "اسم السورة",
                textAlign: TextAlign.center,
                style: theme.textTheme.bodyMedium,
              ),
            ),
          ],
        ),
        Divider(
          thickness: 2.2,
          indent: 10,
          endIndent: 10,
          height: 5,
        ),
        Expanded(
          child: ListView.builder(
              itemBuilder: (context, index) => GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, QuranDetailsView.routeName,
                          arguments:
                              SuraDetails(suraNames[index], "${index + 1}"));
                    },
                    child: QuranItem(
                      suraName: suraNames[index],
                      suraNumber: "${index + 1}",
                    ),
                  ),
              itemCount: suraNames.length),
        )
      ],
    );
  }
}

class SuraDetails {
  final String suraName;
  final String suraNumber;

  SuraDetails(this.suraName, this.suraNumber);
}
