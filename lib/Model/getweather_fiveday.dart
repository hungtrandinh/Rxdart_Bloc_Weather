import 'package:dacs_3/Model/description.dart';

class Getweather_fiveday {
  final int id;
  final String main;
  final DescriptionwWeather description;
  final String icon;

  Getweather_fiveday(this.id, this.main, this.description, this.icon);
  Getweather_fiveday.fromJson(Map<String, dynamic> json)
      : id = json['id'] ?? "",
        main = json['main'] ?? "",
        description = mapStringtoWeather(json['description']) ?? "",
        icon = json['icon'] ?? "";
  static DescriptionwWeather mapStringtoWeather(String input) {
    DescriptionwWeather state;
    switch (input) {
      case 'clear sky':
        state = DescriptionwWeather.clearsky;
        break;
      case 'few clouds':
        state = DescriptionwWeather.fewclouds;
        break;
      case 'snow':
        state = DescriptionwWeather.heavyCloud;
        break;
      case 'mist':
        state = DescriptionwWeather.mist;
        break;
      case 'rain':
        state = DescriptionwWeather.rain;
        break;
      case 'shower rain':
        state = DescriptionwWeather.showerrain;
        break;
      case 'scattered clouds':
        state = DescriptionwWeather.showers;
        break;
      case 'thunderstorm':
        state = DescriptionwWeather.thunderstorm;
        break;
      default:
        state = DescriptionwWeather.unknown;
    }
    return state;
  }
}
