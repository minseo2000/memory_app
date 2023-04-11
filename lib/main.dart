import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:memory/screen/home_screen.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
void main() async {


  WidgetsFlutterBinding.ensureInitialized();

  //네이버 지도 api 사용을 위한 설정
  await NaverMapSdk.instance.initialize(clientId: 'j8x23ixn8h');


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

