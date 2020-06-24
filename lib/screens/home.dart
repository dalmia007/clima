import 'package:clima/services/weather.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  final futureData;
  final currentData;
  Home(this.futureData, this.currentData);
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  WeatherModel weatherModel = WeatherModel();
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
  String inputCity;
  TextEditingController inputController;

  @override
  void initState() {
    super.initState();
    updateData(widget.futureData, widget.currentData);
    inputController = TextEditingController();
  }

  void updateData(dynamic futureData, dynamic currentData) {
    setState(() {
      if (currentData == null || futureData == null) {
        return;
      }
      temperature = futureData['current']['temp'] - 273.15;
      conditionId = futureData['current']['weather'][0]['id'];
      condition = futureData['current']['weather'][0]['main'];
      conditionDescription = futureData['current']['weather'][0]['description'];
      cityName = currentData['name'];
      countryName = currentData['sys']['country'];
      humidity = currentData['main']['humidity'];
      windSpeed = currentData['wind']['speed'] * 3.6;
      feelsLike = futureData['current']['weather'][0]['feels_like'];
      maxTemp = currentData['main']['temp_max'] - 273.15;
      minTemp = currentData['main']['temp_min'] - 273.15;
      iconID = currentData['weather'][0]['icon'];
    });
  }

  @override
  Widget build(BuildContext context) {
    if (widget.currentData == null || widget.futureData == null) {
      return Scaffold(
        body: Center(
          child: Text('Check location permission and internet connection'),
        ),
      );
    } else
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
              FlatButton(
                child: Icon(Icons.my_location),
                onPressed: () async {
                  var futureData = await weatherModel.getFutureWeather();
                  var currentData = await weatherModel.getCurrentWeather();
                  updateData(futureData, currentData);
                },
              ),
              TextField(
                controller: inputController,
                onChanged: (value) {
                  inputCity = value;
                },
                textAlign: TextAlign.center,
                decoration: InputDecoration(hintText: 'Enter City Name'),
              ),
              FlatButton(
                child: Text('Get Weather'),
                onPressed: () async {
                  var currentData =
                      await weatherModel.getCityCurrentWeather(inputCity);
                  var futureData = await weatherModel.getCityFutureWeather();
                  updateData(futureData, currentData);
                  inputController.clear();
                },
              )
            ],
          ),
        ),
      );
  }
}
