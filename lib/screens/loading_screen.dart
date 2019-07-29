import 'package:flutter/material.dart';
import 'package:clima/services/location.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getLocation();
  }

  void getLocation() async {
    Location here = Location();
    await here.getCurrentLocation();
    print("Position: ${here.latitude}, ${here.longitude}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
