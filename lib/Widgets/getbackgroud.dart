import 'package:dacs_3/Model/description.dart';
import 'package:flutter/material.dart';

class Weatherbackgroud extends StatelessWidget {
  final DescriptionwWeather weatherCondition;

  Weatherbackgroud({Key key, @required this.weatherCondition})
      : assert(weatherCondition != null),
        super(key: key);

  @override
  Widget build(BuildContext context) => _mapConditionToImage(weatherCondition);

  Image _mapConditionToImage(DescriptionwWeather weatherCondition) {
    Image image;
    Text text;
    switch (weatherCondition) {
      case DescriptionwWeather.mist:
        image = Image.asset('assets/images/mist.jpg');
        break;
      case DescriptionwWeather.heavyCloud:
        image = Image.asset('assets/images/snow.jpg');
        break;
      case DescriptionwWeather.scatteredclouds:
      case DescriptionwWeather.showerrain:
        image = Image.asset('assets/images/showrain.jpg');
        break;
      case DescriptionwWeather.showers:
        image = Image.asset('assets/images/cattclouds.jpg');
        break;
      case DescriptionwWeather.rain:
        image = Image.asset('assets/images/rain.jpg');
        break;
      case DescriptionwWeather.thunderstorm:
        image = Image.asset('assets/images/samset.jpg');
        break;
      case DescriptionwWeather.unknown:
        image = Image.asset('assets/images/nang.jpg');
        break;
      case DescriptionwWeather.lightCloud:
      case DescriptionwWeather.fewclouds:
        image = Image.asset('assets/images/nang.jpg');

        break;

      case DescriptionwWeather.clearsky:
        image = Image.asset('assets/images/nanglon.jpg');

        break;
    }
    return image;
  }
}
