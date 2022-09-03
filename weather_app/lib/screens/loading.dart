import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert'; //jsonDecode를 사용할 수 있게 해줌

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  @override
  void initState(){
    super.initState();
    getLocation();
    feachData();
  }

  void getLocation() async {
    try {
      Position position = await Geolocator.
      getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      print(position);
    }catch(e){
      print('인터넷 연결에 문제가 생겼습니다.');
    }
  }

  void feachData() async{
    http.Response response = await http.get(Uri.parse('https://samples.openweathermap.org/data/2.5/weather?'
        'q=London&appid=b1b15e88fa797225412429c1c50c122a1'));
    if(response.statusCode == 200){
      String jsonData = response.body;
      var myJson = jsonDecode(jsonData)['weather'][0]['description'];
      print(myJson);
    }
  }

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
