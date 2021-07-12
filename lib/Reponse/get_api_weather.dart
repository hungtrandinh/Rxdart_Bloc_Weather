import 'package:dacs_3/Model/Weather_fiveday_reopnse.dart';
import 'package:dacs_3/Model/Weather_reponse.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class GetApi {
  final Dio _dio = Dio();
  final String apiKey = "23cbc7ad00aab81ed9ed50002d129ae3";
  final String mainUrl = "https://api.openweathermap.org/data/2.5/";
  Future<WeatherReponse> getWeathermain(String name) async {
    final url = ("${mainUrl}weather?q=$name&appid=$apiKey");
    try {
      Response response = await _dio.get(url);
      if (response.statusCode == 200) {
        return WeatherReponse.fromJson(response.data);
      } else {
        print("khong laasy dc pro oi");
      }
    } catch (e) {
      return getWeathermain("");
    }
  }

  Future<Weather_fiveday_reponse> getFiveday(String name) async {
    final String url = "${mainUrl}forecast?q=$name&appid=$apiKey";
    try {
      Response response = await _dio.get(url);
      if (response.statusCode == 200) {
        return Weather_fiveday_reponse.fromJson(response.data);
      } else {
        print("khong laasy dc pro oi");
      }
    } catch (e) {
      return getFiveday("");
    }
  }
}
