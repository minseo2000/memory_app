import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final formKey = GlobalKey<FormState>(); // 로그인 폼 관리 키


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
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
      ),
    );
  }
}
