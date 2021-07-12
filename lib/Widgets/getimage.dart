import 'package:dacs_3/Model/description.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

class WeatherConditions extends StatelessWidget {
  final DescriptionwWeather weatherCondition;

  WeatherConditions({Key key, @required this.weatherCondition})
      : assert(weatherCondition != null),
        super(key: key);

  @override
  Widget build(BuildContext context) => _mapConditionToImage(weatherCondition);

  Image _mapConditionToImage(DescriptionwWeather weatherCondition) {
    Image image;
    Text text;
    switch (weatherCondition) {
      case DescriptionwWeather.fewclouds:
        image = Image.asset("assets/images/fewclouds.png");
        break;
      case DescriptionwWeather.lightCloud:
        image = Image.asset("assets/images/brokencloud.png");
        break;
      case DescriptionwWeather.mist:
        image = Image.asset('assets/images/wind.png');
        break;
      case DescriptionwWeather.heavyCloud:
        image = Image.asset('assets/images/snow.png');
        break;
      case DescriptionwWeather.scatteredclouds:
        image = Image.asset('assets/images/scatteredclouds.png');
        break;
      case DescriptionwWeather.showerrain:
      case DescriptionwWeather.showers:
      case DescriptionwWeather.rain:
        image = Image.asset('assets/images/ran.png');
        break;
      case DescriptionwWeather.thunderstorm:
        image = Image.asset('assets/images/storm.png');
        break;
      case DescriptionwWeather.unknown:
        image = Image.asset('assets/images/ran.png');
        break;

      case DescriptionwWeather.clearsky:
        image = Image.asset('assets/images/sun.png');

        break;
    }
    return image;
  }
}
