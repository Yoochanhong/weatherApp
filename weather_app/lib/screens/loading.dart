import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter/cupertino.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void getLocation() async {
    LocationPermission permission = await Geolocator.requestPermission();//위치정보 동의
    Position position = await Geolocator.
    getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    print(position);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CupertinoButton(
          onPressed: (){
            getLocation();
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
