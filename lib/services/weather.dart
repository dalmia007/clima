import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

String apiKey = DotEnv().env['API_KEY'];

class WeatherModel {
  Future<dynamic> getCurrentWeather() async {
    double latitude;
    double longitude;

    Location location = Location();
    await location.getCurrentLocation();
    latitude = location.latitude;
    longitude = location.longitude;

    NetworkHelper networkHelper1 = NetworkHelper(
        'http://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey');

    var currentData = await networkHelper1.getData();
    return currentData;
  }

  Future<dynamic> getFutureWeather() async {
    double latitude;
    double longitude;

    Location location = Location();
    await location.getCurrentLocation();
    latitude = location.latitude;
    longitude = location.longitude;

    NetworkHelper networkHelper2 = NetworkHelper(
        'http://api.openweathermap.org/data/2.5/onecall?lat=$latitude&lon=$longitude&exclude=minutely&appid=$apiKey');

    var futureData = await networkHelper2.getData();
    return futureData;
  }
}
