import 'package:flutter/material.dart';
import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';
import 'package:clima/screens/location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

const apiKey = 'e89e5cfed092b56f2d7991398cd24569';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  Location here = Location();

  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    await here.getCurrentLocation();
    if (here != null) {
      print("Position: ${here.latitude}, ${here.longitude}");
      String url =
          'http://api.openweathermap.org/data/2.5/weather?lat=${here.latitude}&lon=${here.longitude}&APPID=$apiKey&units=metric';

      print(url);
      NetworkHelper nh = NetworkHelper(url);

      var weatherData = await nh.getData();

      // double temperature = weatherData['main']['temp'];
      // print(temperature);
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return LocationScreen(locationWeather: weatherData);
      }));
    } else {
      print("ERROR: couldn't get location!");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: SpinKitDoubleBounce(
      size: 100.0,
      color: Colors.white,
    )));
  }
}
