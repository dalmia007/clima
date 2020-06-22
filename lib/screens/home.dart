import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  final weatherData;
  final currentData;
  Home(this.weatherData, this.currentData);
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
  int humidity;
  double windSpeed;
  double feelsLike;
  double maxTemp;
  double minTemp;
  String iconID;

  @override
  void initState() {
    super.initState();
    updateData(widget.weatherData, widget.currentData);
  }

  void updateData(dynamic weatherData, dynamic currentData) {
    temperature = weatherData['current']['temp'] - 273.15;
    conditionId = weatherData['current']['weather'][0]['id'];
    condition = weatherData['current']['weather'][0]['main'];
    conditionDescription = weatherData['current']['weather'][0]['description'];
    cityName = currentData['name'];
    countryName = currentData['sys']['country'];
    humidity = currentData['main']['humidity'];
    windSpeed = currentData['wind']['speed'] * 3.6;
    feelsLike = weatherData['current']['weather'][0]['feels_like'];
    maxTemp = currentData['main']['temp_max'] - 273.15;
    minTemp = currentData['main']['temp_min'] - 273.15;
    iconID = currentData['weather'][0]['icon'];
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
          Text(windSpeed.toInt().toString() + ' km/h'),
          Text(humidity.toString() + ' %'),
          Text('${maxTemp.toInt()}°' + 'C'),
          Text('${minTemp.toInt()}°' + 'C'),
          Image.network(
            'http://openweathermap.org/img/wn/$iconID@2x.png',
            scale: .9,
          ),
        ],
      )),
    );
  }
}
