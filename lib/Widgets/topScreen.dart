import 'package:dacs_3/Bloc/mainweather_bloc.dart';
import 'package:dacs_3/Bloc/weather_fiveday_bloc.dart';
import 'package:dacs_3/Model/Weather_reponse.dart';
import 'package:dacs_3/Screem/setting.dart';
import 'package:dacs_3/Widgets/bottomScreen.dart';
import 'package:dacs_3/Widgets/getbackgroud.dart';
import 'package:dacs_3/Widgets/getimage.dart';
import 'package:dacs_3/Widgets/webview.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TopScrren extends StatefulWidget {
  @override
  MyhomeScreen createState() => MyhomeScreen();
}

class MyhomeScreen extends State<TopScrren> {
  final _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    mainWeatherbloc..getMainweather("Hanoi");
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

  Widget _widgetsMyhome(WeatherReponse data) {
    if (data.weather.length == 0) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text("Erros *.*")],
        ),
      );
    } else {
      return Container(
        child: Column(
          children: [
            Expanded(
                flex: 1,
                child: Container(
                    child: Stack(children: <Widget>[
                  Container(
                    child: Weatherbackgroud(
                      weatherCondition: data.weather[0].description,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(25),
                        bottomRight: Radius.circular(25),
                      ),
                    ),
                  ),
                  Container(
                    child: AppBar(
                      backgroundColor: Colors.transparent,
                      elevation: 0,
                      leading: IconButton(
                        icon: IconButton(
                            icon: Icon(Icons.map),
                            color: Colors.white,
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => WebViewExample()));
                            }),
                        onPressed: () {},
                      ),
                      actions: [
                        IconButton(
                            icon: Icon(Icons.equalizer_rounded),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => OKE()));
                            })
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 90, left: 20, right: 20),
                    child: TextField(
                      controller: _searchController,
                      style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                      decoration: InputDecoration(
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        fillColor: Colors.grey[100],
                        suffix: IconButton(
                          icon: Icon(Icons.search),
                          onPressed: () {
                            mainWeatherbloc
                              ..getMainweather(_searchController.text);
                            weather_five_bloc
                              ..getFiveday(_searchController.text);
                          },
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderSide: new BorderSide(
                                color: Colors.grey[100].withOpacity(0.3)),
                            borderRadius: BorderRadius.circular(10)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: new BorderSide(
                                color: Colors.grey[100].withOpacity(0.3)),
                            borderRadius: BorderRadius.circular(10)),
                        contentPadding: EdgeInsets.only(left: 20, bottom: 30),
                        labelText: "Search...",
                        hintStyle: TextStyle(
                            fontSize: 14.0,
                            color: Colors.grey,
                            fontWeight: FontWeight.w500),
                        labelStyle: TextStyle(
                            fontSize: 14.0,
                            color: Colors.grey,
                            fontWeight: FontWeight.w500),
                      ),
                      autocorrect: false,
                    ),
                  ),
                  Align(
                    alignment: Alignment(0.0, 1.0),
                    child: SizedBox(
                      height: 10,
                      width: 10,
                      child: OverflowBox(
                        minWidth: 0.0,
                        maxWidth: MediaQuery.of(context).size.width,
                        minHeight: 0.0,
                        maxHeight: (MediaQuery.of(context).size.height / 4),
                        child: Stack(
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 15),
                              width: double.infinity,
                              height: double.infinity,
                              child: Card(
                                color: Colors.white,
                                elevation: 5,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Container(
                                      padding: EdgeInsets.only(
                                          top: 5, left: 20, right: 20),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Center(
                                            child: Text(
                                              (data.name != null)
                                                  ? '${data.name}'.toUpperCase()
                                                  : '',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .caption
                                                  .copyWith(
                                                    color: Colors.black45,
                                                    fontSize: 24,
                                                    fontWeight: FontWeight.bold,
                                                    fontFamily: 'flutterfonts',
                                                  ),
                                            ),
                                          ),
                                          Center(
                                            child: Text(
                                              DateFormat()
                                                  .add_MMMMEEEEd()
                                                  .format(DateTime.now()),
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .caption
                                                  .copyWith(
                                                    color: Colors.black45,
                                                    fontSize: 16,
                                                    fontFamily: 'flutterfonts',
                                                  ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Divider(),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Container(
                                          padding: EdgeInsets.only(left: 50),
                                          child: Column(
                                            children: <Widget>[
                                              Text(
                                                (data.weather[0].description !=
                                                        null)
                                                    ? '${data.weather[0].main}'
                                                    : '',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .caption
                                                    .copyWith(
                                                      color: Colors.black45,
                                                      fontSize: 22,
                                                      fontFamily:
                                                          'flutterfonts',
                                                    ),
                                              ),
                                              SizedBox(height: 10),
                                              Text(
                                                (data.main != null)
                                                    ? '${(data.main.temp - 273.15).round().toString()}\u2103'
                                                    : '',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headline2
                                                    .copyWith(
                                                        color: Colors.black45,
                                                        fontFamily:
                                                            'flutterfonts'),
                                              ),
                                              Text(
                                                (data.main != null)
                                                    ? 'min: ${(data.main.temp_min - 273.15).round().toString()}\u2103 / max: ${(data.main.temp_max - 273.15).round().toString()}\u2103'
                                                    : '',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .caption
                                                    .copyWith(
                                                      color: Colors.black45,
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontFamily:
                                                          'flutterfonts',
                                                    ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          padding: EdgeInsets.only(right: 20),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: <Widget>[
                                              Container(
                                                width: 100,
                                                height: 100,
                                                child: WeatherConditions(
                                                  weatherCondition: data
                                                      .weather[0].description,
                                                ),
                                              ),
                                              Container(
                                                child: Text(
                                                  (data.wind != null)
                                                      ? 'wind ${data.wind.speed} m/s'
                                                      : '',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .caption
                                                      .copyWith(
                                                        color: Colors.black45,
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontFamily:
                                                            'flutterfonts',
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
                          ],
                        ),
                      ),
                    ),
                  ),
                ]))),
            BottomScreen(),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: StreamBuilder(
        stream: mainWeatherbloc.behaviorSubjectbloc.stream,
        builder: (context, AsyncSnapshot<WeatherReponse> snapshot) {
          if (snapshot.hasData == null) {
            if (snapshot.data == null) {
              return _widgetsErros();
            }
            return _widgetsMyhome(snapshot.data);
          } else if (snapshot.hasError) {
            return _widgetsErros();
          } else {
            return _widgetsMyhome(snapshot.data);
          }
        },
      ),
    );
  }
}
