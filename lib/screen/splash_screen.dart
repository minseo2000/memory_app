import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []); // 전체화면 모드
    return SafeArea(
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 4,
              child: Column(
                children: [
                  Expanded(
                    flex: 2,
                    child: Container(),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      child: Text('추억', style: TextStyle(fontSize: 30.0),),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      child: Column(
                        children: [
                          Text('자동으로 기억되는 삶'),
                          SizedBox(height: 20.0,),
                          CircularProgressIndicator()
                        ],
                      )
                    ),
                  )
                ],
              )
            ),
            Expanded(
              flex: 6,
              child: Container(
                child: Image.asset('asset/img/tree.png'),
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
