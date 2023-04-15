import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:memory/screen/map_screen.dart';


import 'chat_list_screen.dart';
import 'chat_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  //bottomNavigationBar
  int _selectedIndex = 0;
  final List<Widget> _widgetOptions = <Widget>[
    //renderHomeScreen(),
    MapScreen(),
    ChatListScreen(),
    ChatScreen(),


  ]; // 3개의 페이지를 연결할 예정이므로 3개의 페이지를 여기서 지정해준다. 탭 레이아웃은 3개.

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
      body: SafeArea(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),

      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.abc), label: '지도'),
          BottomNavigationBarItem(icon: Icon(Icons.abc), label: '채팅목록'),
          BottomNavigationBarItem(icon: Icon(Icons.abc), label: '채팅목록'),
        ],
        currentIndex: _selectedIndex, // 지정 인덱스로 이동
        selectedItemColor: Colors.lightGreen,
        onTap: _onItemTapped, // 선언했던 onItemTapped
      ),

    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }








}
