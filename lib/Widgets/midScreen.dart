import 'package:dacs_3/Bloc/weather_fiveday_bloc.dart';
import 'package:dacs_3/Model/Weather_fiveday_reopnse.dart';
import 'package:dacs_3/Model/getweather_fiveday.dart';
import 'package:dacs_3/Model/weather_fiveday.dart';
import 'package:dacs_3/Widgets/getimage.dart';

import 'package:flutter/material.dart';

class MidScreen extends StatefulWidget {
  @override
  MyBottomScreen createState() => MyBottomScreen();
}

class MyBottomScreen extends State<MidScreen> {
  @override
  void initState() {
    weather_five_bloc..getFiveday("");
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Weather_fiveday_reponse>(
        stream: weather_five_bloc.behaviorSubjectblocfiveday.stream,
        builder: (context, AsyncSnapshot<Weather_fiveday_reponse> snapshot) {
          if (snapshot.hasData == null) {
            return _myhomewidget(snapshot.data);
          } else if (snapshot.hasError) {
            return _widgetsErros();
          } else {
            return _myhomewidget(snapshot.data);
          }
        });
  }

  Widget _widgetsLoading() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          CircularProgressIndicator(
            valueColor: new AlwaysStoppedAnimation<Color>(Colors.black),
            strokeWidth: 4.0,
          ),
        ],
      ),
    );
  }

  Widget _widgetsErros() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Text("Erros *.*")],
      ),
    );
  }

  Widget _myhomewidget(Weather_fiveday_reponse data) {
    if (data.weather_fiveday.length == 0) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text("Erros *.*")],
        ),
      );
    } else {
      return Expanded(
        flex: 2,
        child: Stack(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Container(
                padding: EdgeInsets.only(top: 120),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        child: Text(
                          'forcast next 5 days'.toUpperCase(),
                          style: Theme.of(context).textTheme.caption.copyWith(
                                fontSize: 16,
                                fontFamily: 'flutterfonts',
                                color: Colors.black45,
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                      ),
                      Container(
                        height: 150,
                        child: ListView.builder(
                          physics: BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemCount: data.weather_fiveday.length,
                          itemBuilder: (context, index) {
                            return Container(
                              width: 140,
                              height: 150,
                              child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Container(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        (data != null)
                                            ? '${data.weather_fiveday[index].getweatherfiveday[0].main}'
                                            : '',
                                        style: Theme.of(context)
                                            .textTheme
                                            .caption
                                            .copyWith(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black45,
                                              fontFamily: 'flutterfonts',
                                            ),
                                      ),
                                      Text(
                                        (data != null)
                                            ? '${(data.weather_fiveday[index].main_fiveday.temp - 273.15).round().toString()}\u2103'
                                            : '',
                                        style: Theme.of(context)
                                            .textTheme
                                            .caption
                                            .copyWith(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black45,
                                              fontFamily: 'flutterfonts',
                                            ),
                                      ),
                                      Container(
                                        width: 50,
                                        height: 50,
                                        child: WeatherConditions(
                                            weatherCondition: data
                                                .weather_fiveday[index]
                                                .getweatherfiveday[0]
                                                .description),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        (data != null)
                                            ? '${data.weather_fiveday[index].time}'
                                            : '',
                                        style: Theme.of(context)
                                            .textTheme
                                            .caption
                                            .copyWith(
                                              color: Colors.black45,
                                              fontFamily: 'flutterfonts',
                                              fontSize: 12,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }
  }
}
