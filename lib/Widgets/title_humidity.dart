import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class LineTitles_Humidity {
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
                return '1%';
              case 5:
                return '50%';
              case 10:
                return '100%';
            }
            return '';
          },
          reservedSize: 35,
          margin: 12,
        ),
      );
}
