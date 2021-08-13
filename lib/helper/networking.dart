import '../helper/location.dart';

import '../models/weather_info.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<WeatherInto> fetchWeather() async {
  Location location = Location();
  await location.getCurrentLocation();
  const apiKey = '8736db98744bccfd581c86ea8a1e2614';
  const openWeaterMapURL = 'https://api.openweathermap.org/data/2.5/weather';
  final requestUrl =
      '$openWeaterMapURL?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric';

  final response = await http.get(Uri.parse(requestUrl));
  if (response.statusCode == 200) {
    return WeatherInto.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Error loading request Url info');
  }
}
