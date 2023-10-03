import 'dart:async';

import 'package:flutter/material.dart';
import 'package:islami/core/provider/app_provider.dart';
import 'package:islami/layout/home_layout.dart';
import 'package:provider/provider.dart';

class Splashscreen extends StatelessWidget {

  static const String routeName = "splash_screen";

  const Splashscreen({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(
      const Duration(seconds: 3),
      () {
        Navigator.pushReplacementNamed(context, HomeLayout.routeName);
      },
    );

    var mediaQuery = MediaQuery.of(context).size;
    var appProvider = Provider.of<AppProvider>(context);
    return Scaffold(
      body: Image.asset(
        appProvider.backgroundImage(),
        width: mediaQuery.width,
        height: mediaQuery.height,
        fit: BoxFit.cover,
      ),
    );
  }
}
