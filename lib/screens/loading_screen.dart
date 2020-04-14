import 'package:flutter/material.dart';
import 'package:climate/services/location.dart';
import 'package:climate/services/networking.dart';
import 'location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

const API_KEY = '5b7720d550daa32502208d0163813ee2';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double latitude;
  double longitude;
  /*
    Lifecycle methods for stateful widget
      initState()-> initial state, called only once, when state is initialized
      build()-> when widget is built,called every time when image or text changes, too expensive for code called frequently
      deactivate()-> when state is destroyed
   */
  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    Location location = Location();
    await location.getCurrentLocation();
    latitude = location.latitude;
    longitude = location.longitude;
    NetworkHelper networkHelper = NetworkHelper(
        'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$API_KEY&units=metric');
    var weatherData =
        await networkHelper.getData(); //AWAIT ONLY ON FUTURE METHOD

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(
        locationWeather: weatherData,
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.white,
          size: 100.0,
        ),
      ),
    );
  }
}
