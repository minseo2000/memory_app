import 'package:flutter/material.dart';


class ChatListScreen extends StatefulWidget {
  const ChatListScreen({Key? key}) : super(key: key);

  @override
  State<ChatListScreen> createState() => _ChatListScreenState();
}

class _ChatListScreenState extends State<ChatListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.yellow,
          child: Column(
            children: [
              Expanded(
                flex: 6,
                child: Container(
                  color: Colors.blue,
                  child: Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Container(
                          child: Text('채팅 목록'),
                        )
                      ),
                      Expanded(
                        flex: 8,
                        child: Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              ElevatedButton(
                                onPressed: (){},
                                child: Icon(Icons.search),
                              ),
                            ],
                          )
                        )
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 94,
                child: Container(
                  color: Colors.red,
                  child: SingleChildScrollView(
                    child: Container(
                      margin: EdgeInsets.all(10.0),
                      color: Colors.white,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Container(
                                  color: Colors.blue,
                                  child: Icon(Icons.add),
                                ),
                              ),
                              Expanded(
                                flex: 9,
                                child: Container(
                                  color: Colors.grey,
                                  child: Text('이름'),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      )
    );
  }



  
}
