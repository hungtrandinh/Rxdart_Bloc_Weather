import 'package:dacs_3/Model/clouds.dart';
import 'package:dacs_3/Model/getweather_fiveday.dart';
import 'package:dacs_3/Model/main_fiveday.dart';
import 'package:dacs_3/Model/wind_fiveday.dart';

class Weather_fiveday {
  final List<Getweather_fiveday> getweatherfiveday;
  final Main_fiveday main_fiveday;
  final Wind_fiveday wind_fiveday;
  final String time;
  final Clouds clouds;
  final int visibility;

  Weather_fiveday(
    this.getweatherfiveday,
    this.main_fiveday,
    this.time,
    this.wind_fiveday,
    this.clouds,
    this.visibility,
  );
  Weather_fiveday.fromJson(
    Map<String, dynamic> json,
  )   : getweatherfiveday = (json['weather'] as List)
                .map((e) => Getweather_fiveday.fromJson(e))
                .toList() ??
            "",
        main_fiveday = Main_fiveday.fromJson(json['main']),
        time = json['dt_txt'] ?? "",
        wind_fiveday = Wind_fiveday.fromJson(json['wind']) ?? "",
        clouds = Clouds.fromJson(json['clouds']) ?? "",
        visibility = json['visibility'] ?? "";
}
