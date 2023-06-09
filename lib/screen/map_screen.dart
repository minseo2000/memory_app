import 'package:flutter/material.dart';
import 'dart:io';
import 'package:geolocator/geolocator.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:image_picker/image_picker.dart';
import 'package:native_exif/native_exif.dart';
import 'package:path_provider/path_provider.dart';


class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {

  var currentPostion;
  final latLng = NLatLng(37.5666, 126.979);
  late NCameraPosition curPostion = NCameraPosition(target: latLng, zoom: 15);




  String? Today_date;
  late NaverMapController mapController; // 네이버 지도 컨트롤러



  XFile? pickedFile;
  Exif? exif;

  NMapType _mapType = NMapType.basic;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async{
          mapController.updateCamera(NCameraUpdate.withParams(
              target: NLatLng(currentPostion.latitude, currentPostion.longitude)
          ));


          //exif 정보 추출
          final picker = ImagePicker();
          pickedFile = await picker.pickImage(source: ImageSource.gallery);

          exif = await Exif.fromPath(pickedFile!.path);
          print('내용 출력');
          var info = await exif?.getAttributes();
          print(info!['GPSLongitude']);
          print(info!['GPSLatitude']);
          print(info!['DateTimeOriginal']);
          print(pickedFile!.path);
          print('내용 출력');

          File f1 = File(pickedFile!.path);


          final marker = NMarker(
            id: "test",
            position: NLatLng(double.parse(info!['GPSLatitude'].toString()), double.parse(info!['GPSLongitude'].toString())),
            icon: NOverlayImage.fromFile(f1),
            size: Size(100,100),

          );
          mapController.addOverlay(marker);

          var path = NArrowheadPathOverlay(color:Colors.black,id: "test", coords: <NLatLng>[NLatLng(double.parse(info!['GPSLatitude'].toString()), double.parse(info!['GPSLongitude'].toString())),
            NLatLng(37.5666, 126.979), NLatLng(27.5666, 126.979)]);
          mapController.addOverlay(path);

        },
        child: Icon(Icons.location_on),
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
    print('맵클릭');
    // ...
  }

  void onSymbolTapped(NSymbolInfo symbolInfo) {
    print(symbolInfo.position);
    print(symbolInfo.caption);
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
  @override
  void initState(){
    checkPermission();
    load_my_Current_pos();
  }
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
}
