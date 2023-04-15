import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              Expanded(
                flex: 5,
                child: Container(
                  color: Colors.yellow,
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: ElevatedButton(
                          onPressed: (){
                            Navigator.pop(context);
                          },
                          child: Icon(
                              Icons.arrow_back_ios
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 8,
                        child: Container(
                          child: Text(
                            '박민서',
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Icon(Icons.search),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 95,
                child: Container(
                  color: Colors.blue,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.all(20.0),
                          color: Colors.yellow,
                          child: Column(
                            children: [
                              Container(
                                margin: EdgeInsets.all(10.0),
                                color: Colors.white,
                                child: Row(
                                  children: [
                                    Icon(Icons.add),
                                    Text('박민서'),
                                    SizedBox(width: 10.0,),
                                    Text('오늘 뭐해?')
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.all(10.0),
                                color: Colors.white,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text('오늘 뭐해?'),
                                    SizedBox(width: 10.0,),
                                    Text('박민서'),
                                    Icon(Icons.add),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  List<Widget> renderChatScreen(){
    return [
        
    ];
  }

  loadChatDatabase(){

  }
}
