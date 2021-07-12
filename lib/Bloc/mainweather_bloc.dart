import 'package:dacs_3/Model/Weather_reponse.dart';
import 'package:dacs_3/Reponse/get_api_weather.dart';
import 'package:rxdart/subjects.dart';

class MainWeatherbloc {
  final GetApi _getApi = GetApi();
  final BehaviorSubject<WeatherReponse> _subject =
      BehaviorSubject<WeatherReponse>();
  BehaviorSubject<WeatherReponse> get behaviorSubjectbloc => _subject;
  getMainweather(String name) async {
    WeatherReponse weatherReponse = await _getApi.getWeathermain(name);
    _subject.sink.add(weatherReponse);
  }

  void discope() {
    _subject.close();
  }
}

final MainWeatherbloc mainWeatherbloc = MainWeatherbloc();
