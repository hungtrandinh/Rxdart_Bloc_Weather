import 'package:dacs_3/Model/mainweather.dart';
import 'package:dacs_3/Model/sys.dart';
import 'package:dacs_3/Model/weather.dart';
import 'package:dacs_3/Model/wind.dart';

class WeatherReponse {
  final List<Weather> weather;
  final Sys sys;
  final MainWeather main;
  final Wind wind;
  final String name;
  final String stations;

  WeatherReponse(
      this.weather, this.sys, this.main, this.wind, this.name, this.stations);
  WeatherReponse.fromJson(Map<String, dynamic> json)
      : weather = (json['weather'] as List)
                .map((e) => Weather.fromJson(e))
                .toList() ??
            "",
        main = MainWeather.fromJson(json['main']) ?? "",
        sys = Sys.fromJson(json['sys']) ?? "",
        wind = Wind.fromJson(json['wind']) ?? "",
        name = json['name'] ?? "",
        stations = json['stations'] ?? "";
}
