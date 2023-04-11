import 'package:flutter/material.dart';
import 'package:memory/screen/splash_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  String? Today_date;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: renderHomeScreen(),
      ),
    );
  }


  renderHomeScreen(){
    return Container(
      child: Column(
        children: [
          Expanded(
            flex: 1,
            child: Column(
              children: [
                SizedBox(height: 20.0,),
                ElevatedButton(
                  onPressed: () async{
                      await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1900),
                          lastDate: DateTime(2300),
                          locale: const Locale('ko','KR') ,
                      );
                  },
                  child: Text(''),
                ),
              ],
            )
          ),
          Expanded(
            flex: 9,
            child: Container(
              color:Colors.orange
            ),
          ),
        ],
      ),
    );
  }
}
