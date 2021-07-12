import 'package:dacs_3/Model/weather_fiveday.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class LineTitles {
  Weather_fiveday weather_fiveday;

  static getTitleData() => FlTitlesData(
        show: true,
        bottomTitles: SideTitles(
          showTitles: true,
          reservedSize: 35,
          getTextStyles: (value) => const TextStyle(
            color: Color(0xff67727d),
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
          getTitles: (value) {
            switch (value.toInt()) {
              case 0:
                return DateFormat()
                    .add_MMMMEEEEd()
                    .format(DateTime.now())
                    .split(",")
                    .lastWhere((element) => true);
              case 2:
                return DateFormat()
                    .add_MMMMEEEEd()
                    .format(DateTime.now().add(Duration(days: 2)))
                    .split(",")
                    .lastWhere((element) => true);
              case 4:
                return DateFormat()
                    .add_MMMMEEEEd()
                    .format(DateTime.now().add(Duration(days: 4)))
                    .split(",")
                    .lastWhere((element) => true);
            }
            return '';
          },
          margin: 8,
        ),
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
          reservedSize: 35,
          margin: 12,
        ),
      );
}
