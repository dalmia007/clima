import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  final weatherData;
  Home(this.weatherData);
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text(widget.weatherData.toString())),
    );
  }
}
