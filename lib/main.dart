import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:memory/screen/home_screen.dart';

void main() {
  runApp(MaterialApp(
    home: HomeScreen(),

    // 달력 언어 설정을 위한 설정.
    localizationsDelegates: const[
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
      GlobalCupertinoLocalizations.delegate
    ],
  ));
}

