
import 'package:dacs_3/Widgets/topScreen.dart';
import 'package:flutter/material.dart';

class HomeScrren extends StatefulWidget {
  @override
  MyhomeScreen createState() => MyhomeScreen();
}

class MyhomeScreen extends State<HomeScrren> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TopScrren(),
    );
  }
}
