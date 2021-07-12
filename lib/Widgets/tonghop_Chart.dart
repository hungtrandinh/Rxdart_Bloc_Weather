import 'package:dacs_3/Bloc/weather_fiveday_bloc.dart';
import 'package:dacs_3/Model/Weather_fiveday_reopnse.dart';
import 'package:dacs_3/Widgets/title_pressure.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Teamp_th_Chart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LineChartWidget();
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
      return SizedBox(
        child: LineChart(
          LineChartData(
            lineTouchData: LineTouchData(enabled: true),
            lineBarsData: [
              LineChartBarData(
                spots: [
                  FlSpot(
                      0,
                      (data.weather_fiveday[0].main_fiveday.temp.toInt() -
                          273.0)),
                  FlSpot(
                      1,
                      data.weather_fiveday[1].main_fiveday.temp.toInt() -
                          273.0),
                  FlSpot(
                      2,
                      data.weather_fiveday[2].main_fiveday.temp.toInt() -
                          273.0),
                  FlSpot(
                      3,
                      data.weather_fiveday[3].main_fiveday.temp.toInt() -
                          273.0),
                  FlSpot(
                      4,
                      data.weather_fiveday[4].main_fiveday.temp.toInt() -
                          273.0),
                  FlSpot(
                      5,
                      data.weather_fiveday[5].main_fiveday.temp.toInt() -
                          273.0),
                  FlSpot(
                      6,
                      data.weather_fiveday[6].main_fiveday.temp.toInt() -
                          273.0),
                  FlSpot(
                      7,
                      data.weather_fiveday[7].main_fiveday.temp.toInt() -
                          273.0),
                ],
                isCurved: true,
                barWidth: 2,
                colors: [
                  Colors.green,
                ],
                dotData: FlDotData(
                  show: false,
                ),
              ),
              LineChartBarData(
                spots: [
                  FlSpot(
                      0,
                      (data.weather_fiveday[8].main_fiveday.temp.toInt() -
                          273.0)),
                  FlSpot(
                      1,
                      data.weather_fiveday[9].main_fiveday.temp.toInt() -
                          273.0),
                  FlSpot(
                      2,
                      data.weather_fiveday[10].main_fiveday.temp.toInt() -
                          273.0),
                  FlSpot(
                      3,
                      data.weather_fiveday[11].main_fiveday.temp.toInt() -
                          273.0),
                  FlSpot(
                      4,
                      data.weather_fiveday[12].main_fiveday.temp.toInt() -
                          273.0),
                  FlSpot(
                      5,
                      data.weather_fiveday[13].main_fiveday.temp.toInt() -
                          273.0),
                  FlSpot(
                      6,
                      data.weather_fiveday[14].main_fiveday.temp.toInt() -
                          273.0),
                  FlSpot(
                      7,
                      data.weather_fiveday[15].main_fiveday.temp.toInt() -
                          273.0),
                ],
                isCurved: true,
                barWidth: 2,
                colors: [
                  Colors.black,
                ],
                dotData: FlDotData(
                  show: false,
                ),
              ),
              LineChartBarData(
                spots: [
                  FlSpot(
                      0,
                      (data.weather_fiveday[16].main_fiveday.temp.toInt() -
                          273.0)),
                  FlSpot(
                      1,
                      data.weather_fiveday[17].main_fiveday.temp.toInt() -
                          273.0),
                  FlSpot(
                      2,
                      data.weather_fiveday[18].main_fiveday.temp.toInt() -
                          273.0),
                  FlSpot(
                      3,
                      data.weather_fiveday[19].main_fiveday.temp.toInt() -
                          273.0),
                  FlSpot(
                      4,
                      data.weather_fiveday[20].main_fiveday.temp.toInt() -
                          273.0),
                  FlSpot(
                      5,
                      data.weather_fiveday[21].main_fiveday.temp.toInt() -
                          273.0),
                  FlSpot(
                      6,
                      data.weather_fiveday[22].main_fiveday.temp.toInt() -
                          273.0),
                  FlSpot(
                      7,
                      data.weather_fiveday[23].main_fiveday.temp.toInt() -
                          273.0),
                ],
                isCurved: false,
                barWidth: 2,
                colors: [
                  Colors.red,
                ],
                dotData: FlDotData(
                  show: false,
                ),
              ),
            ],
            betweenBarsData: [
              BetweenBarsData(
                fromIndex: 0,
                toIndex: 2,
                colors: [Colors.red.withOpacity(0.3)],
              )
            ],
            minY: 0,
            titlesData: FlTitlesData(
              bottomTitles: SideTitles(
                  showTitles: true,
                  getTextStyles: (value) => const TextStyle(
                      fontSize: 16,
                      color: Color(0xff67727d),
                      fontWeight: FontWeight.bold),
                  getTitles: (value) {
                    switch (value.toInt()) {
                      case 0:
                        return "03:00 h";
                      case 2:
                        return "09:00 h";
                      case 4:
                        return "15:00 h";
                      case 6:
                        return "21:00 h";
                    }
                    return '';
                  }),
              leftTitles: SideTitles(
                showTitles: true,
                getTextStyles: (value) => const TextStyle(
                  color: Color(0xff67727d),
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
                getTitles: (value) {
                  switch (value.toInt()) {
                    case 1:
                      return '1\u2103';
                    case 20:
                      return '20\u2103';
                    case 35:
                      return '35\u2103';
                  }
                  return '';
                },
              ),
            ),
            gridData: FlGridData(
              show: true,
              checkToShowHorizontalLine: (double value) {
                return value == 1 ||
                    value == 20 ||
                    value == 30 ||
                    value == 35 ||
                    value == 40;
              },
            ),
          ),
        ),
      );
    }
  }
}
