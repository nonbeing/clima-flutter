import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

const apiKey = 'e89e5cfed092b56f2d7991398cd24569';
const openWeatherMapBaseURL = 'http://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  Future<dynamic> getLocationWeather() async {
    Location here = Location();
    await here.getCurrentLocation();
    if (here != null) {
      // print("Position: ${here.latitude}, ${here.longitude}");
      String url =
          '$openWeatherMapBaseURL?lat=${here.latitude}&lon=${here.longitude}&APPID=$apiKey&units=metric';

      print('[DEBUG] URL is: $url');
      NetworkHelper nh = NetworkHelper(url);
      var weatherData = await nh.getData();
      return weatherData;
    }
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Shorts and 👕 time';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
