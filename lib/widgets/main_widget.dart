import 'package:flutter/material.dart';

import 'weather_tile.dart';

class MainWidget extends StatelessWidget {
  final String location;
  final double temp;
  final double tempMin;
  final double tempMax;
  final String weather;
  final int humidity;
  final double windSpeed;

  MainWidget({
    required this.location,
    required this.temp,
    required this.tempMin,
    required this.tempMax,
    required this.weather,
    required this.humidity,
    required this.windSpeed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.height / 2,
          width: MediaQuery.of(context).size.width,
          color: Color(0XFFF1F1F1),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                location.toString(),
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.w900,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10, bottom: 10),
                child: Text(
                  '${temp.toString()}°',
                  style: TextStyle(
                    color: Colors.purple,
                    fontSize: 40.0,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
              Text(
                'high of ${tempMin.toString()}° ,low of ${tempMax.toString()}° ',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 14.0,
                  fontWeight: FontWeight.w600,
                ),
              )
            ],
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: ListView(
              children: [
                WeatherTile(
                  icon: Icons.thermostat_outlined,
                  title: 'Temperature',
                  subtitle: '${temp.toString()}°',
                ),
                WeatherTile(
                  icon: Icons.filter_drama_outlined,
                  title: 'Weather',
                  subtitle: weather.toString(),
                ),
                WeatherTile(
                  icon: Icons.wb_sunny,
                  title: 'humidity',
                  subtitle: '${humidity.toString()}%',
                ),
                WeatherTile(
                  icon: Icons.waves_outlined,
                  title: 'wind speed',
                  subtitle: '${windSpeed.toString()}MPH',
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
