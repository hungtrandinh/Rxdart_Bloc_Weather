import 'package:dacs_3/Bloc/weather_fiveday_bloc.dart';
import 'package:dacs_3/Model/Weather_fiveday_reopnse.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class Double_chart extends StatelessWidget {
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
    final List<int> showIndexes = const [1, 2, 4, 6];
    final List<FlSpot> allSpots = [
      FlSpot(0, (data.weather_fiveday[0].main_fiveday.temp.toInt() - 273.0)),
      FlSpot(1, data.weather_fiveday[1].main_fiveday.temp.toInt() - 273.0),
      FlSpot(2, data.weather_fiveday[2].main_fiveday.temp.toInt() - 273.0),
      FlSpot(3, data.weather_fiveday[3].main_fiveday.temp.toInt() - 273.0),
      FlSpot(4, data.weather_fiveday[4].main_fiveday.temp.toInt() - 273.0),
      FlSpot(5, data.weather_fiveday[5].main_fiveday.temp.toInt() - 273.0),
      FlSpot(6, data.weather_fiveday[6].main_fiveday.temp.toInt() - 273.0),
      FlSpot(7, data.weather_fiveday[7].main_fiveday.temp.toInt() - 273.0),
    ];
    final lineBarsData = [
      LineChartBarData(
          showingIndicators: showIndexes,
          spots: allSpots,
          isCurved: true,
          barWidth: 4,
          shadow: const Shadow(
            blurRadius: 8,
            color: Colors.black,
          ),
          belowBarData: BarAreaData(
            show: true,
            colors: [
              const Color(0xff12c2e9).withOpacity(0.4),
              const Color(0xffc471ed).withOpacity(0.4),
              const Color(0xfff64f59).withOpacity(0.4),
            ],
          ),
          dotData: FlDotData(show: false),
          colors: [
            const Color(0xff12c2e9),
            const Color(0xffc471ed),
            const Color(0xfff64f59),
          ],
          colorStops: [
            0.1,
            0.4,
            0.9
          ]),
    ];

    final tooltipsOnBar = lineBarsData[0];

    return Padding(
      padding: EdgeInsets.all(20),
      child: Container(
        height: MediaQuery.of(context).size.width,
        width: MediaQuery.of(context).size.width,
        child: LineChart(
          LineChartData(
            showingTooltipIndicators: showIndexes.map((index) {
              return ShowingTooltipIndicators([
                LineBarSpot(tooltipsOnBar, lineBarsData.indexOf(tooltipsOnBar),
                    tooltipsOnBar.spots[index]),
              ]);
            }).toList(),
            lineTouchData: LineTouchData(
              enabled: false,
              getTouchedSpotIndicator:
                  (LineChartBarData barData, List<int> spotIndexes) {
                return spotIndexes.map((index) {
                  return TouchedSpotIndicatorData(
                    FlLine(
                      color: Colors.pink,
                    ),
                    FlDotData(
                      show: true,
                      getDotPainter: (spot, percent, barData, index) =>
                          FlDotCirclePainter(
                        radius: 8,
                        color: lerpGradient(
                            barData.colors, barData.colorStops, percent / 100),
                        strokeWidth: 2,
                        strokeColor: Colors.black,
                      ),
                    ),
                  );
                }).toList();
              },
              touchTooltipData: LineTouchTooltipData(
                tooltipBgColor: Colors.pink,
                tooltipRoundedRadius: 8,
                getTooltipItems: (List<LineBarSpot> lineBarsSpot) {
                  return lineBarsSpot.map((lineBarSpot) {
                    return LineTooltipItem(
                      lineBarSpot.y.toString(),
                      const TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    );
                  }).toList();
                },
              ),
            ),
            lineBarsData: lineBarsData,
            minY: 0,
            titlesData: FlTitlesData(
              leftTitles: SideTitles(
                showTitles: false,
              ),
              bottomTitles: SideTitles(
                  showTitles: true,
                  getTitles: (val) {
                    switch (val.toInt()) {
                      case 0:
                        return '03:00';
                      case 1:
                        return '06:00';
                      case 2:
                        return '12:00';
                      case 3:
                        return '15:00';
                      case 4:
                        return '18:00';
                      case 5:
                        return '21:00';
                      case 6:
                        return '0:00';
                    }
                    return '';
                  },
                  getTextStyles: (value) => const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.blueGrey,
                        fontFamily: 'Digital',
                        fontSize: 10,
                      )),
            ),
            axisTitleData: FlAxisTitleData(
              rightTitle: AxisTitle(showTitle: true, titleText: 'Temperature'),
              leftTitle: AxisTitle(showTitle: true, titleText: 'Temperature'),
              topTitle: AxisTitle(
                  showTitle: true,
                  titleText: 'Wall clock',
                  textAlign: TextAlign.left),
            ),
            gridData: FlGridData(show: false),
            borderData: FlBorderData(
              show: true,
            ),
          ),
        ),
      ),
    );
  }
}

/// Lerps between a [LinearGradient] colors, based on [t]
Color lerpGradient(List<Color> colors, List<double> stops, double t) {
  if (stops.length != colors.length) {
    stops = [];

    /// provided gradientColorStops is invalid and we calculate it here
    colors.asMap().forEach((index, color) {
      final percent = 1.0 / colors.length;
      stops.add(percent * index);
    });
  }

  for (var s = 0; s < stops.length - 1; s++) {
    final leftStop = stops[s], rightStop = stops[s + 1];
    final leftColor = colors[s], rightColor = colors[s + 1];
    if (t <= leftStop) {
      return leftColor;
    } else if (t < rightStop) {
      final sectionT = (t - leftStop) / (rightStop - leftStop);
      return Color.lerp(leftColor, rightColor, sectionT);
    }
  }
  return colors.last;
}
