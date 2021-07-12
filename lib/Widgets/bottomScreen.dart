import 'dart:ui';
import 'package:dacs_3/Bloc/weather_fiveday_bloc.dart';
import 'package:dacs_3/Model/Weather_fiveday_reopnse.dart';
import 'package:dacs_3/Model/description.dart';
import 'package:dacs_3/Model/getweather_fiveday.dart';
import 'package:dacs_3/Model/weather_fiveday.dart';
import 'package:dacs_3/Screem/chart_humidity.dart';
import 'package:dacs_3/Screem/chart_presur.dart';
import 'package:dacs_3/Screem/creencon.dart';
import 'package:dacs_3/Screem/speed_chart.dart';
import 'package:dacs_3/Widgets/getimage.dart';

import 'package:flutter/material.dart';

class BottomScreen extends StatefulWidget {
  @override
  MyBottomScreen createState() => MyBottomScreen();
}

class MyBottomScreen extends State<BottomScreen> {
  @override
  void initState() {
    weather_five_bloc..getFiveday("Hanoi");
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
    List<Weather_fiveday> weather_fivedaya = data.weather_fiveday;

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
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => HomeScrrencon(
                                        fiday: weather_fivedaya[index],
                                      ),
                                    ));
                              },
                              child: Container(
                                width: 140,
                                height: 150,
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Container(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
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
                                          child: GestureDetector(
                                            onTap: () {
                                              print("A");
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        HomeScrrencon(
                                                      fiday: weather_fivedaya[
                                                          index],
                                                    ),
                                                  ));
                                            },
                                            child: Hero(
                                              tag: "heroa",
                                              child: WeatherConditions(
                                                  weatherCondition: data
                                                      .weather_fiveday[index]
                                                      .getweatherfiveday[0]
                                                      .description),
                                            ),
                                          ),
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
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 10),
                        child: Column(
                          children: [
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    'Status'.toUpperCase(),
                                    style: Theme.of(context)
                                        .textTheme
                                        .caption
                                        .copyWith(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black45,
                                        ),
                                  ),
                                  Icon(
                                    Icons.next_plan_outlined,
                                    color: Colors.black45,
                                  ),
                                ]),
                            SizedBox(
                              height: 20,
                            ),
                            GestureDetector(
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border(
                                    top: BorderSide(
                                        color: Colors.grey[200], width: 1.0),
                                  ),
                                  color: Colors.white,
                                ),
                                height: 192,
                                child: Row(
                                  children: <Widget>[
                                    Container(
                                      padding: EdgeInsets.only(
                                        left: 30,
                                        top: 20.0,
                                        bottom: 10.0,
                                      ),
                                      width: MediaQuery.of(context).size.width *
                                          1.5 /
                                          5,
                                      child: InkWell(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      Humidity_Chart()));
                                        },
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Center(
                                              child: Text("Humidity",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.grey,
                                                      fontSize: 20.0)),
                                            ),
                                            SizedBox(
                                              height: 20,
                                            ),
                                            Container(
                                              height: 50,
                                              width: 70,
                                              child: Center(
                                                child: Image.asset(
                                                    'assets/images/humidity.png'),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 20,
                                            ),
                                            Center(
                                              child: Text(
                                                "${data.weather_fiveday[0].main_fiveday.humidity} %",
                                                style: TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(
                                        left: 35,
                                        top: 20.0,
                                        bottom: 10.0,
                                      ),
                                      width: MediaQuery.of(context).size.width *
                                          1.6 /
                                          5,
                                      child: InkWell(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      Pressure_Chart()));
                                        },
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Center(
                                              child: Text("Pressure",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.grey,
                                                      fontSize: 20.0)),
                                            ),
                                            SizedBox(
                                              height: 20,
                                            ),
                                            Container(
                                              height: 50,
                                              width: 80,
                                              child: Center(
                                                child: Image.asset(
                                                    'assets/images/gauge.png'),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 20,
                                            ),
                                            Center(
                                              child: Text(
                                                "${data.weather_fiveday[0].main_fiveday.pressure} P",
                                                style: TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(
                                        left: 55,
                                        top: 20.0,
                                        bottom: 10.0,
                                      ),
                                      width: MediaQuery.of(context).size.width *
                                          1.5 /
                                          5,
                                      child: InkWell(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      Speed_Chart()));
                                        },
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Center(
                                              child: Text("Speed",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.grey,
                                                      fontSize: 20.0)),
                                            ),
                                            SizedBox(
                                              height: 20,
                                            ),
                                            Container(
                                              height: 50,
                                              width: 80,
                                              child: Center(
                                                child: Image.asset(
                                                    'assets/images/wind.png'),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 20,
                                            ),
                                            Center(
                                              child: Text(
                                                "${data.weather_fiveday[0].wind_fiveday.speed} m/s",
                                                style: TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
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
