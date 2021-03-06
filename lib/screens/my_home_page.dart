import 'package:flutter/material.dart';
import '../helper/networking.dart';
import '../models/weather_info.dart';
import '../widgets/main_widget.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<WeatherInto>? futureWeather;

  @override
  void initState() {
    super.initState();
    futureWeather = fetchWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: fetchWeather(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if (snapshot.hasData) {
              return MainWidget(
                humidity: snapshot.data.humidity,
                location: snapshot.data.location,
                temp: snapshot.data.temp,
                tempMax: snapshot.data.tempMax,
                tempMin: snapshot.data.tempMin,
                weather: snapshot.data.weather,
                windSpeed: snapshot.data.windSpeed,
              );
            }
            if (snapshot.hasError) {
               return MainWidget(
                humidity:0,
                location: 'Error',
                temp: 0.0,
                tempMax: 0.0,
                tempMin: 0.0,
                weather: 'You Have Error',
                windSpeed: 0.0,
              );
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }
}
