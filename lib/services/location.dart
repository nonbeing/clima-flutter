import 'package:geolocator/geolocator.dart';

class Location {
  double latitude;
  double longitude;

  Location({this.latitude, this.longitude});

  Future<void> getCurrentLocation() async {
    Position position;

    try {
      position = await Geolocator()
          .getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
      print('[DEBUG] position is: $position');
      latitude = position.latitude;
      longitude = position.longitude;
    } catch (e) {
      print("ERROR: $e");
    }
  }
}
