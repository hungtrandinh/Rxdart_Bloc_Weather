import 'package:dacs_3/Bloc/weather_fiveday_bloc.dart';
import 'package:dacs_3/Model/Weather_fiveday_reopnse.dart';
import 'package:dacs_3/Model/weather_fiveday.dart';
import 'package:dacs_3/Widgets/getbackgroud.dart';
import 'package:dacs_3/Widgets/getimage.dart';
import 'package:flutter/material.dart';

class HomeScrrencon extends StatefulWidget {
  final String name;
  final Weather_fiveday fiday;

  const HomeScrrencon({Key key, this.fiday, this.name}) : super(key: key);
  @override
  MyhomeScreen createState() => MyhomeScreen(fiday, name);
}

class MyhomeScreen extends State<HomeScrrencon> {
  Weather_fiveday fiday;
  final String name;
  MyhomeScreen(this.fiday, this.name);
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
            return _widgetsErros();
          } else if (snapshot.hasError) {
            return _widgetsErros();
          } else {
            return _myhomewidget(snapshot.data);
          }
        });
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
    List<String> time = fiday.time.split(" ");
    if (data.weather_fiveday.length == 0) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text("Erros *.*")],
        ),
      );
    } else {
      return Scaffold(
        body: SingleChildScrollView(
            child: Column(
          children: [
            Container(
              height: 400,
              child: Stack(
                children: [
                  Container(
                      child: Weatherbackgroud(
                    weatherCondition: fiday.getweatherfiveday[0].description,
                  )),
                  Container(
                    child: AppBar(
                      backgroundColor: Colors.transparent,
                      elevation: 0,
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
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: 250,
                      width: 400,
                      child: Card(
                        color: Colors.white,
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Center(
                              child: Text(
                                  "${data.city.name},${data.city.country.toUpperCase()}",
                                  style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.w800,
                                      color: Colors.black45)),
                            ),
                            Center(
                              child: Text("${time[0]}",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black45)),
                            ),
                            Divider(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.only(left: 50),
                                  child: Column(
                                    children: <Widget>[
                                      Text(
                                        (fiday.getweatherfiveday[0].main !=
                                                null)
                                            ? '${fiday.getweatherfiveday[0].main}'
                                            : '',
                                        style: Theme.of(context)
                                            .textTheme
                                            .caption
                                            .copyWith(
                                              color: Colors.black45,
                                              fontSize: 22,
                                              fontFamily: 'flutterfonts',
                                            ),
                                      ),
                                      SizedBox(height: 10),
                                      Text(
                                        (fiday != null)
                                            ? '${(fiday.main_fiveday.temp - 273.15).round().toString()}\u2103'
                                            : '',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline2
                                            .copyWith(
                                                color: Colors.black45,
                                                fontFamily: 'flutterfonts'),
                                      ),
                                      Text(
                                        (fiday != null)
                                            ? 'min: ${(fiday.main_fiveday.temp_min - 273.15).round().toString()}\u2103 / max: ${(fiday.main_fiveday.temp_max - 273.15).round().toString()}\u2103'
                                            : '',
                                        style: Theme.of(context)
                                            .textTheme
                                            .caption
                                            .copyWith(
                                              color: Colors.black45,
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: 'flutterfonts',
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.only(right: 20),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Container(
                                        width: 100,
                                        height: 100,
                                        child: GestureDetector(
                                          onTap: () {},
                                          child: Hero(
                                            tag: "heroa",
                                            child: WeatherConditions(
                                              weatherCondition: fiday
                                                  .getweatherfiveday[0]
                                                  .description,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        child: Text(
                                          (fiday != null)
                                              ? 'wind ${fiday.wind_fiveday.speed} m/s'
                                              : '',
                                          style: Theme.of(context)
                                              .textTheme
                                              .caption
                                              .copyWith(
                                                color: Colors.black45,
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold,
                                                fontFamily: 'flutterfonts',
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Divider(),
            Center(
                child: Text(
              time[1],
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.black45,
                  fontWeight: FontWeight.bold),
            )),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      ListTile(
                        subtitle: Text(
                          "${fiday.main_fiveday.pressure} hPa",
                          style: TextStyle(fontSize: 20, color: Colors.black45),
                        ),
                        title: Text("Pressure",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black45)),
                      ),
                      Divider(
                        height: 1,
                      ),
                      ListTile(
                        title: Text("Foresight",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black45)),
                        subtitle: Text(
                            "${fiday.visibility / 1000.toDouble()} Km ",
                            style:
                                TextStyle(fontSize: 20, color: Colors.black45)),
                      ),
                      Divider(
                        height: 1,
                      ),
                      ListTile(
                        title: Text("Cloud Coverage",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black45)),
                        subtitle: Text("${fiday.clouds.colouds} %",
                            style:
                                TextStyle(fontSize: 20, color: Colors.black45)),
                      ),
                      Divider(
                        height: 1,
                      ),
                      ListTile(
                        title: Text("Chance of Rain ",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black45)),
                        subtitle: Text("15 %",
                            style:
                                TextStyle(fontSize: 20, color: Colors.black45)),
                      ),
                      Divider(
                        height: 1,
                      ),
                      ListTile(
                        title: Text("Wind Speed ",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black45)),
                        subtitle: Text("${fiday.wind_fiveday.speed} m/s ",
                            style:
                                TextStyle(fontSize: 20, color: Colors.black45)),
                      ),
                      Divider(
                        height: 1,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      SizedBox(height: 10),
                      ListTile(
                        title: Text("Humidity ",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black45)),
                        subtitle: Text("${fiday.main_fiveday.humidity} % ",
                            style:
                                TextStyle(fontSize: 20, color: Colors.black45)),
                      ),
                      Divider(
                        height: 1,
                      ),
                      ListTile(
                        title: Text("Perceived Temperature",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black45)),
                        subtitle: Text(
                            "${(fiday.main_fiveday.feels_like - 273.15).round()}\u2103 ",
                            style:
                                TextStyle(fontSize: 20, color: Colors.black45)),
                      ),
                      Divider(
                        height: 1,
                      ),
                      ListTile(
                        title: Text("UV Index ",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black45)),
                        subtitle: Text(" 3.5", style: TextStyle(fontSize: 20)),
                      ),
                      Divider(
                        height: 1,
                      ),
                      ListTile(
                        title: Text("Sunset",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black45)),
                        subtitle: Text("6:13 CH ",
                            style:
                                TextStyle(fontSize: 20, color: Colors.black45)),
                      ),
                      Divider(
                        height: 1,
                      ),
                      ListTile(
                        title: Text("Sunrise ",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black45)),
                        subtitle: Text("5:14 SA  ",
                            style:
                                TextStyle(fontSize: 20, color: Colors.black45)),
                      ),
                      Divider(
                        height: 1,
                      )
                    ],
                  ),
                )
              ],
            )
          ],
        )),
      );
    }
  }
}
