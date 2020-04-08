import 'package:flutter/material.dart';
import 'package:climate/services/location.dart';
import 'package:http/http.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  /*
    Lifecycle methods for stateful widget
      initState()-> initial state, called only once, when state is initialized
      build()-> when widget is built,called every time when image or text changes, too expensive for code called frequently
      deactivate()-> when state is destroyed
   */
  @override
  void initState() {
    super.initState();
    getLocation();
  }

  void getLocation() async {
    Location location = Location();
    await location.getCurrentLocation();
    print(location.latitude);
    print(location.longitude);
  }

  void getData() async {
    Response response = await get(
        'https://samples.openweathermap.org/data/2.5/weather?lat=35&lon=139&appid=b6907d289e10d714a6e88b30761fae22');
    print(response.body);
  }

  @override
  Widget build(BuildContext context) {
    getData();
    return Scaffold(
      body: Container(margin: EdgeInsets.all(30.0), color: Colors.indigo),
    );
  }
}
