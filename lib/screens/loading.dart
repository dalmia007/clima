import 'package:clima/screens/home.dart';
import 'package:clima/services/weather.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    WeatherModel weathermodel = WeatherModel();
    var weatherData = await weathermodel.getFutureWeather();
    var currentData = await weathermodel.getCurrentWeather();

    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
      return Home(weatherData, currentData);
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: SpinKitCircle(
        color: Colors.white,
        size: 50,
      )),
    );
  }
}
