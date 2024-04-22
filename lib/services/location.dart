import 'package:geolocator/geolocator.dart';

// this class is used to get the location of the user by uisng geolocator package
class Location {
  double latitude = 0.0;
  double longitude = 0.0;

  Future<void> getCurrentLocation() async {
    try {
      //while getting the location from the user there may be some possibility that the user denied for permission or network not available
      //that's why we have used the try and catch method to check the uncaught exceptions
      await Geolocator.requestPermission();
      //the accuracy can be set to high,low or anything as per the requirement
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
      latitude = position.latitude;
      longitude = position.longitude;
    } catch (e) {
      // e is the short hand for exception
      print(e);
    }
  }
}
