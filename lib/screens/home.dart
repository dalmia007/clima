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
  int conditionId;
  String condition;
  String conditionDescription;
  String cityName;
  String countryName;

  @override
  void initState() {
    super.initState();
    updateData(widget.weatherData, widget.cityData);
  }

  void updateData(dynamic weatherData, dynamic cityData) {
    temperature = weatherData['current']['temp'] - 273.15;
    conditionId = weatherData['current']['weather'][0]['id'];
    condition = weatherData['current']['weather'][0]['main'];
    conditionDescription = weatherData['current']['weather'][0]['description'];
    cityName = cityData['name'];
    countryName = cityData['sys']['country'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
          child: Column(
        children: <Widget>[
          Text('$cityName,' + '$countryName'),
          Text('${temperature.toInt()}°' + 'C'),
          Text(condition.toString()),
          Text(conditionDescription.toString()),
          Text(conditionId.toString()),
        ],
      )),
    );
  }
}
