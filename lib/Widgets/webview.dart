import 'dart:io';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black87,
          leading: IconButton(
            icon: IconButton(
                icon: Icon(Icons.chevron_left_sharp),
                color: Colors.white,
                onPressed: () {
                  Navigator.pop(context);
                }),
            onPressed: () {},
          ),
          title: Text("Weather Map"),
        ),
        body: Container(
          child: WebView(
            initialUrl: 'https://www.windy.com/30.000/101.950?28.140,105.996,6',
            javascriptMode: JavascriptMode.unrestricted,
          ),
        ),
      ),
    );
  }
}
