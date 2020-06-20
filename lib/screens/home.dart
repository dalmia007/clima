import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  final weatherData;
  final cityData;
  Home(this.weatherData, this.cityData);
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  double temperature;
  int condition;
  String cityName;

  @override
  void initState() {
    super.initState();
    updateData(widget.weatherData, widget.cityData);
  }

  void updateData(dynamic weatherData, dynamic cityData) {
    temperature = weatherData['current']['temp'] - 273.15;
    // condition = weatherData['weather'][0]['id'];
    cityName = cityData['name'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Row(
        children: <Widget>[
          Text(temperature.toString()),
          Text(cityName.toString()),
        ],
      )),
    );
  }
}
