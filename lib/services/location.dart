import 'package:geolocator/geolocator.dart';

class Location {
  double latitude;
  double longitude;

  //DECLARE AN ASYNC FUNCTION IN DART
  //Future is a promise in dart
  Future<void> getCurrentLocation() async {
    try {
      Position position = await Geolocator().getCurrentPosition(
          desiredAccuracy: LocationAccuracy.bestForNavigation);
      latitude = position.latitude;
      longitude = position.longitude;
    } catch (exception) {
      print(exception);
    }
  }
}
