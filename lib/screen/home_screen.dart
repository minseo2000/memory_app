import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  var currentPostion;
  final latLng = NLatLng(37.5666, 126.979);
  late NCameraPosition curPostion = NCameraPosition(target: latLng, zoom: 15);

  String? Today_date;
  late NaverMapController mapController; // 네이버 지도 컨트롤러

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
        child: renderHomeScreen(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          mapController.updateCamera(NCameraUpdate.withParams(
              target: NLatLng(currentPostion.latitude, currentPostion.longitude)
          ));
        },
        child: Icon(Icons.location_on),
      ),
    );
  }
  @override
  void initState(){
    checkPermission();
    load_my_Current_pos();
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
                options: NaverMapViewOptions(
                  initialCameraPosition: curPostion
                ),
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

  void onMapReady(NaverMapController controller){
    mapController = controller;
    mapController.updateCamera(NCameraUpdate.withParams(
        target: NLatLng(currentPostion.latitude, currentPostion.longitude)
    ));
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

  void load_my_Current_pos() async {
    currentPostion = await Geolocator.getCurrentPosition();
    print(currentPostion.latitude);
    print(currentPostion.longitude);
  }
}
