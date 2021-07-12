import 'package:dacs_3/Model/Weather_reponse.dart';
import 'package:dacs_3/Model/weather.dart';

class WeatherMainreponse {
  final List<Weather> weather;
  final WeatherReponse reponse;

  WeatherMainreponse(this.weather, this.reponse);
  WeatherMainreponse.fromJson(Map<String, dynamic> json)
      : weather =
            (json['weather'] as List).map((e) => Weather.fromJson(e)).toList(),
        reponse = WeatherReponse.fromJson(json);

  WeatherMainreponse.withErros(String valuerros)
      : weather = List(),
        reponse = null;
}
