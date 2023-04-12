import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final formKey = GlobalKey<FormState>(); // 로그인 폼 관리 키

  //위치 권한 확인하는 함수 이다.
  Future<String> checkPermission() async{
    final isLocationEnabled = await Geolocator.isLocationServiceEnabled();

    if(!isLocationEnabled){
      return '위치 서비스를 활성해주세요.';
    }
    LocationPermission checkedPermission = await Geolocator.checkPermission();

    if(checkedPermission == LocationPermission.denied){
      //위치 권한이ㅣ 거절되었을 경우

      //위치 권한 요청하기
      checkedPermission = await Geolocator.requestPermission();
      if(checkedPermission== LocationPermission.denied){
        return '위치 권한을 허가해주세요.';
      }
    }
    //위치 권한이 거절되었을 경우 ( 앱에서 재 요청 불가)
    if(checkedPermission == LocationPermission.deniedForever){
      return '앱의 위치 권한을 설정에서 허가해주세요.';
    }

    return '위치 권한이 허가 되었습니다.';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<String>(
        future: checkPermission(),
        builder: (context, snapshot) {
          if(!snapshot.hasData && snapshot.connectionState == ConnectionState.waiting){
            return Center();
          }
          if(snapshot.data == '위치 권한이 허가 되었습니다.'){
            return SafeArea(
              child: Container(
                child: Column(
                  children: [
                    Expanded(
                      flex: 7,
                      child: Container(
                          color: Colors.yellow,
                          child: Column(
                            children: [
                              SizedBox(height: 50.0,),
                              Text('추억',
                                style: TextStyle(
                                  fontSize: 45.0,
                                ),
                              ),
                              SizedBox(height: 10.0,),
                              Text('자동으로 기억되는 삶'),
                              Image.asset('asset/img/tree.png'),
                            ],
                          )
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Container(
                        color: Colors.red,
                        child: Form(
                          key: this.formKey,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: Container(),
                                  ),
                                  Expanded(
                                      flex: 8,
                                      child: TextFormField()
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Container(),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10.0,),
                              Row(
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: Container(),
                                  ),
                                  Expanded(
                                      flex: 8,
                                      child: TextFormField()
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Container(),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10.0,),
                              Row(
                                children: [
                                  Expanded(
                                    flex: 5,
                                    child: Container(),
                                  ),
                                  Expanded(
                                    flex: 4,
                                    child: Container(
                                      child: ElevatedButton(
                                        onPressed: (){},
                                        child: Text('로그인'),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Container(),
                                  ),
                                  Expanded(
                                    flex: 4,
                                    child: Container(
                                      child: ElevatedButton(
                                        onPressed: (){},
                                        child: Text('회원가입'),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 5,
                                    child: Container(),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          }
          return Center(
            child: Text('위치 권한 설정을 해주세요.', style: TextStyle(fontSize: 30.0),),
          );
        },
      )
    );
  }
}
