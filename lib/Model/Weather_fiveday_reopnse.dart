import 'package:dacs_3/Model/city.dart';
import 'package:dacs_3/Model/weather_fiveday.dart';

class Weather_fiveday_reponse {
  final List<Weather_fiveday> weather_fiveday;
  final City city;
  Weather_fiveday_reponse(this.weather_fiveday, this.city);
  Weather_fiveday_reponse.fromJson(Map<String, dynamic> json)
      : weather_fiveday = (json['list'] as List)
                .map((e) => Weather_fiveday.fromJson(e))
                .toList() ??
            "",
        city = City.fromJson(json['city']);
}
