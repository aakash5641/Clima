import 'package:clima/services/networking.dart';
import 'package:flutter/material.dart';
import 'package:clima/services/location.dart';

const apiKey = 'b5b35cc724bf35f0ae3ce2d132b46d4f';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double latitude = 0.0;
  double longitude = 0.0;

  @override
  //it's called when program starts
  void initState() {
    // implement initState
    super.initState();
    // we have called the get location method here beacuse we want to get location of the user as soon as the screen loads
    getLocationData();
  }

// this will get the location from location file
  void getLocationData() async {
    Location location = Location();
    await location.getCurrentLocation();
    latitude = (location.latitude);
    longitude = (location.longitude);

    NetworkHelper networkHelper = NetworkHelper(
        url:
            'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey');
    var weatherData = networkHelper.getData();
  }

  @override
  Widget build(BuildContext context) {
    // we have called get data here beacuse we want to get the location everytime we refreshes the app
    getLocationData();
    return Scaffold();
  }
}
