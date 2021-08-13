
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
          builder: (context, AsyncSnapshot snapshot) =>
              snapshot.connectionState == ConnectionState.waiting
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : MainWidget(
                      humidity: snapshot.data.humidity,
                      location: snapshot.data.location,
                      temp: snapshot.data.temp,
                      tempMax: snapshot.data.tempMax,
                      tempMin: snapshot.data.tempMin,
                      weather: snapshot.data.weather,
                      windSpeed: snapshot.data.windSpeed,
                    )),
    );
  }
}
