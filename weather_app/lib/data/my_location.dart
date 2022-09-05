import 'package:geolocator/geolocator.dart';

class MyLocation{
  double latitude2;
  double longitude2;

  Future<void> getMyCurrentLocation() async{
    try {
      Position position = await Geolocator. //위도와 경도를 position 변수에 넣음
      getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      latitude2 = position.latitude;
      longitude2 = position.longitude;
      print(latitude2);
      print(longitude2);
    }catch(e){
      print('인터넷 연결에 문제가 생겼습니다.');
    }
  }
}