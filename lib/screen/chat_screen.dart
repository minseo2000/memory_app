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
                      SizedBox(width: 10.0,),
                      ElevatedButton(
                        onPressed: (){},
                        child: Icon(
                            Icons.arrow_back_ios
                        ),
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
                      children: renderChatScreen(),
                    ),
                  )
                ),
              )
            ],
          ),
        ),
      )
    );
  }
  List<Widget> renderChatScreen(){
    return [

    ];
  }
}
