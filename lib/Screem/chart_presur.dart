import 'package:dacs_3/Bloc/weather_fiveday_bloc.dart';
import 'package:dacs_3/Model/Weather_fiveday_reopnse.dart';
import 'package:dacs_3/Widgets/title_char.dart';
import 'package:dacs_3/Widgets/title_humidity.dart';
import 'package:dacs_3/Widgets/title_pressure.dart';
import 'package:fl_chart/fl_chart.dart';

import 'package:flutter/material.dart';

class Pressure_Chart extends StatelessWidget {
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
        title: Text("Pressure Chart"),
      ),
      body: Card(
        child: Center(
          child: Padding(
            padding:
                const EdgeInsets.only(top: 20, left: 20, right: 40, bottom: 40),
            child: Container(
              child: Stack(
                children: [
                  LineChartWidget(),
                ],
              ),
            ),
          ),
        ),
      ),
    ));
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
          maxY: 11,
          titlesData: LineTitles_Pessure.getTitleData(),
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
                FlSpot(
                    0,
                    (data.weather_fiveday[1].main_fiveday.pressure.toDouble() /
                        100)),
                FlSpot(
                    1,
                    data.weather_fiveday[8].main_fiveday.pressure.toDouble() /
                        100),
                FlSpot(
                    2,
                    data.weather_fiveday[16].main_fiveday.pressure.toDouble() /
                        100),
                FlSpot(
                    3,
                    data.weather_fiveday[24].main_fiveday.pressure.toDouble() /
                        100),
                FlSpot(
                    4,
                    data.weather_fiveday[32].main_fiveday.pressure.toDouble() /
                        100),
                FlSpot(
                    5,
                    data.weather_fiveday[39].main_fiveday.pressure.toDouble() /
                        100),
              ],
              isCurved: true,
              colors: gradientColors,
              barWidth: 5,
              // dotData: FlDotData(show: false),
              belowBarData: BarAreaData(
                show: true,
                colors: gradientColors
                    .map((color) => color.withOpacity(0.1))
                    .toList(),
              ),
            ),
          ],
        ),
      );
    }
  }
}
