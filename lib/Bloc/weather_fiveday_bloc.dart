import 'package:dacs_3/Model/Weather_fiveday_reopnse.dart';
import 'package:dacs_3/Reponse/get_api_weather.dart';
import 'package:rxdart/rxdart.dart';

class Weather_five_bloc {
  final GetApi _getApi = GetApi();
  final BehaviorSubject<Weather_fiveday_reponse> _subject =
      BehaviorSubject<Weather_fiveday_reponse>();
  BehaviorSubject<Weather_fiveday_reponse> get behaviorSubjectblocfiveday =>
      _subject;
  getFiveday(String name) async {
    Weather_fiveday_reponse weatherReponse = await _getApi.getFiveday(name);
    _subject.sink.add(weatherReponse);
  }

  void discope() {
    _subject.close();
  }
}

final Weather_five_bloc weather_five_bloc = Weather_five_bloc();
