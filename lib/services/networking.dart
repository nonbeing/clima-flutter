import 'dart:convert';
import 'package:http/http.dart' as http;

class NetworkHelper {
  NetworkHelper(this.url);

  final String url;

  Future getData() async {
    var decodedWeatherData;
    http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      decodedWeatherData = jsonDecode(response.body);
      return decodedWeatherData;
    } else {
      print(response.statusCode);
    }
  }
}
