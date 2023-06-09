import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:memory/screen/bluetooth_screen.dart';
import 'package:memory/screen/chat_list_screen.dart';
import 'package:memory/screen/chat_screen.dart';
import 'package:memory/screen/home_screen.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:memory/firebase_options.dart';
import 'package:memory/screen/login_screen.dart';
import 'package:geolocator/geolocator.dart';
import 'package:firebase_auth/firebase_auth.dart';
void main() async {


  WidgetsFlutterBinding.ensureInitialized();

  //네이버 지도 api 사용을 위한 설정
  await NaverMapSdk.instance.initialize(clientId: 'j8x23ixn8h');

  //firebase api 사용을 위한 설정
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseAuth.instance.useAuthEmulator('localhost', 9099);

  runApp(MaterialApp(
    home: LoginScreen(),

    // 달력 언어 설정을 위한 설정.
    localizationsDelegates: const[
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
      GlobalCupertinoLocalizations.delegate
    ],
  ));
}



