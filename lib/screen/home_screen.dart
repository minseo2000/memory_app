import 'package:flutter/material.dart';
import 'package:memory/screen/splash_screen.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  String? Today_date;
  late NaverMapController mapController; // 네이버 지도 컨트롤러
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: renderHomeScreen(),
      ),
    );
  }


  renderHomeScreen(){



    NMapType _mapType = NMapType.basic;
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
              color:Colors.orange,
              child: NaverMap(
                onMapReady: onMapReady,
                onMapTapped: onMapTapped,
                onSymbolTapped: onSymbolTapped,
                onCameraChange: onCameraChange,
                onCameraIdle: onCameraIdle,
                onSelectedIndoorChanged: onSelectedIndoorChanged,
              ),
            ),
          ),
        ],
      ),
    );
  }


  /* ----- Events ----- */

  void onMapReady(NaverMapController controller) {
    mapController = controller;
  }

  void onMapTapped(NPoint point, NLatLng latLng) {
    // ...
  }

  void onSymbolTapped(NSymbolInfo symbolInfo) {
    // ...
  }

  void onCameraChange(NCameraUpdateReason reason, bool isGesture) {
    // ...
  }

  void onCameraIdle() {
    // ...
  }

  void onSelectedIndoorChanged(NSelectedIndoor? selectedIndoor) {
    // ...
  }
}
