import 'package:flutter/material.dart';



class BluetoothScreen extends StatefulWidget {
  const BluetoothScreen({Key? key}) : super(key: key);

  @override
  State<BluetoothScreen> createState() => _BluetoothScreenState();
}

class _BluetoothScreenState extends State<BluetoothScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
                Expanded(
                  flex: 6,
                  child: Container(
                    margin: EdgeInsets.all(10.0),
                    color: Colors.red,
                    child: Text('블루투스 설정', style: TextStyle(fontSize: 20.0),)
                  ),
                ),
              Expanded(
                flex: 94,
                child: Container(
                  color: Colors.green,

                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
