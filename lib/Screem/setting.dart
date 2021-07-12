import 'package:dacs_3/Bloc/weather_fiveday_bloc.dart';
import 'package:dacs_3/Model/Weather_fiveday_reopnse.dart';
import 'package:dacs_3/Widgets/double_chart.dart';
import 'package:dacs_3/Widgets/title_char.dart';
import 'package:dacs_3/Widgets/tonghop_Chart.dart';
import 'package:fl_chart/fl_chart.dart';

import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class OKE extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.black87,
              leading: IconButton(
                icon: Icon(
                  Icons.chevron_left_sharp,
                  color: Colors.white,
                  size: 30,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              title: Text("Temp Chart"),
            ),
            body: SingleChildScrollView(
              child: Card(
                child: Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.width,
                      child: Swiper(
                        //viewportFraction: 0.8,
                        // scale: 0.9,
                        itemCount: 2,
                        index: 0,
                        itemBuilder: (context, index) {
                          if (index == 0) {
                            return Stack(children: [
                              Padding(
                                padding: EdgeInsets.only(left: 90, top: 20),
                                child: Text(
                                    "temperature chart for the next 6 days",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                              ),
                              Center(
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      top: 80, left: 20, right: 40, bottom: 40),
                                  child: Container(
                                    child: Stack(
                                      children: [
                                        LineChartWidget(),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ]);
                          } else if (index == 1) {
                            return Stack(children: [
                              Padding(
                                padding: EdgeInsets.only(left: 80, top: 30),
                                child: Text(
                                  "Temperature observation chart by day",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 80, left: 20, right: 40, bottom: 40),
                                child: Container(
                                  child: Stack(
                                    children: [
                                      Teamp_th_Chart(),
                                    ],
                                  ),
                                ),
                              ),
                            ]);
                          }
                          return Center(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 20, left: 20, right: 40, bottom: 40),
                              child: Container(
                                child: Stack(
                                  children: [
                                    LineChartWidget(),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                        pagination: new SwiperPagination(
                          margin: new EdgeInsets.all(5.0),
                          builder: new DotSwiperPaginationBuilder(
                            size: 5,
                            activeSize: 5,
                          ),
                        ),
                      ),
                    ),
                    Divider(
                      height: 5,
                    ),
                    Center(
                      child: Padding(
                        padding: EdgeInsets.only(top: 20, bottom: 10),
                        child: Text(
                          "temperature by time today",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Double_chart()
                  ],
                ),
              ),
            )));
  }
}

class LineChartWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return Statelinchar();
  }
}

class Statelinchar extends State<LineChartWidget> {
  final List<Color> gradientColors = [
    const Color(0xff23b6e6),
    const Color(0xff02d39a),
  ];
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
      return LineChart(
        LineChartData(
          minX: 0,
          maxX: 5,
          minY: 0,
          maxY: 40,
          titlesData: LineTitles.getTitleData(),
          gridData: FlGridData(
            show: true,
            getDrawingHorizontalLine: (value) {
              return FlLine(
                color: const Color(0xff37434d),
                strokeWidth: 1,
              );
            },
            drawVerticalLine: true,
            getDrawingVerticalLine: (value) {
              return FlLine(
                color: const Color(0xff37434d),
                strokeWidth: 1,
              );
            },
          ),
          borderData: FlBorderData(
            show: true,
            border: Border.all(color: const Color(0xff37434d), width: 1),
          ),
          lineBarsData: [
            LineChartBarData(
              spots: [
                FlSpot(0, (data.weather_fiveday[0].main_fiveday.temp - 273.15)),
                FlSpot(1, data.weather_fiveday[5].main_fiveday.temp - 273.15),
                FlSpot(2, data.weather_fiveday[15].main_fiveday.temp - 273.15),
                FlSpot(3, data.weather_fiveday[20].main_fiveday.temp - 273.15),
                FlSpot(4, data.weather_fiveday[25].main_fiveday.temp - 273.15),
                FlSpot(5, data.weather_fiveday[30].main_fiveday.temp - 273.15),
              ],
              isCurved: true,
              colors: gradientColors,
              barWidth: 5,
              // dotData: FlDotData(show: false),
              belowBarData: BarAreaData(
                show: true,
                colors: gradientColors
                    .map((color) => color.withOpacity(0.3))
                    .toList(),
              ),
            ),
          ],
        ),
      );
    }
  }
}
