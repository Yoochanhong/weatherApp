import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:weather_app/data/my_location.dart';
import 'package:weather_app/data/network.dart';
import 'package:weather_app/screens/weather_screen.dart';
const apiKey = '9f79e9db0d0d1d2a13edc476acebfcc6';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  double? latitude3;
  double? longitude3;

  @override
  void initState(){ //initState로 한번 초기화 하면서 두 함수를 실행
    super.initState();
    getLocation();
  }

  void getLocation() async {
    MyLocation myLocation = MyLocation();
    await myLocation.getMyCurrentLocation();
    latitude3 = myLocation.latitude2;
    longitude3 = myLocation.longitude2;
    print(latitude3);
    print(longitude3);
    
    Network network = Network('https://api.openweathermap.org/data/2.5/weather?'
        'lat=$latitude3&lon=$longitude3&appid=$apiKey&units=metric',
        'https://api.openweathermap.org/data/2.5/air_pollution?'
        'lat=$latitude3&lon=$longitude3&appid=$apiKey');
    var weatherData = await network.getJsonData(); //api 정보들을 weatherData에 저장
    print(weatherData);

    var airData = await network.getAirData();
    print(airData);

    Navigator.push(context, MaterialPageRoute(builder: (context){
      return WeatherScreen(
        parseWeatherData: weatherData,
        parseAirPollutionData: airData); //api로 받아온 정보들을 넘겨줌
    }));
  }

  /*void feachData() async{
      var myJson = parsingData['weather'][0]['description'];
      print(myJson);
    }else{
      print(response.statusCode);
    }
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CupertinoButton(
          onPressed: (){
          },
          child: Text(
            '내 위치',
            style: TextStyle(
                color: Colors.white,
              fontSize: 25.0
            ),
          ),
          color: Colors.blue,
        ),
      ),
    );
  }
}
