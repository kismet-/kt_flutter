import 'package:flutter/material.dart';
import 'package:kt_flutter/loginscreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      title: 'KEEPTRUCKIN',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: Color(0xFFf6f7f8),
          primaryIconTheme: IconThemeData(color: Colors.black),
          primaryTextTheme: TextTheme(title: TextStyle(color: Colors.black, /*fontFamily: "OpenSans",*/ fontWeight: FontWeight.normal  ))

      ),
      home: new LoginScreen(),
    );
  }
}