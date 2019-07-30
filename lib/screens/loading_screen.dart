import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:clima/services/location.dart';
import 'package:http/http.dart' as http;

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  Location here = Location();

  @override
  void initState() {
    super.initState();
    getLocation();
  }

  void getLocation() async {
    await here.getCurrentLocation();
    print("Position: ${here.latitude}, ${here.longitude}");
    getData();
  }

  void getData() async {
    String url =
        'http://api.openweathermap.org/data/2.5/weather?lat=${here.latitude}&lon=${here.longitude}&APPID=e89e5cfed092b56f2d7991398cd24569';
    print(url);

    http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);

      var temperature = data['main']['temp'];
      print(temperature);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
