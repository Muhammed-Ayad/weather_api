class WeatherInto {
  final String location;
  final double temp;
  final double tempMin;
  final double tempMax;
  final String weather;
  final int humidity;
  final double windSpeed;

  WeatherInto({
    required this.location,
    required this.temp,
    required this.tempMin,
    required this.tempMax,
    required this.weather,
    required this.humidity,
    required this.windSpeed,
  });

  factory WeatherInto.fromJson(Map<String, dynamic> json) {
    return WeatherInto(
      location: json['name'] ?? '',
      temp: json['main']['temp'] ?? '',
      tempMin: json['main']['temp_min'] ?? '',
      tempMax: json['main']['temp_max'] ?? '',
      weather: json['weather'][0]['description'] ?? '',
      humidity: json['main']['humidity'] ?? '',
      windSpeed: json['wind']['speed'] ?? '',
    );
  }
}