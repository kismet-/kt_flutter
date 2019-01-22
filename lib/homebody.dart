import 'package:flutter/material.dart';
import 'package:kt_flutter/homelist.dart';
import 'dart:async';
import 'package:http/http.dart' as http;

class HomeBody extends StatelessWidget{

  static const cardData = const <HomeList>[
    const HomeList(
      cardHeading: '\n    Log Audit Summary',
      subHeading: '    View Logs\n',
      date: 'JANUARY 6  -  JANUARY 20',
      radialPercentage: .9700,
      label: "Compliance",
    ),
    const HomeList(
      cardHeading: '\n    Scorecards Summary',
      subHeading: '    View Scorecards\n',
      date: 'JANUARY 6  -  JANUARY 20',
      radialPercentage: 1.00,
      label: "Safety Score",
    ),
    const HomeList(
      cardHeading: '\n    ELD Events Summary',
      subHeading: '    View ELD Events\n',
      date: 'JANUARY 6  -  JANUARY 20',
      radialPercentage: .98,
      label: "Identified",
    ),
    const HomeList(
      cardHeading: '\n    Vehicle Utilization',
      subHeading: '    View Utilization Summary\n',
      date: "JANUARY 6  -  JANUARY 20",
      radialPercentage: .63,
      label: "Utilization",
    )
  ];

  Future<http.Response> fetchPost() {
    return http.get('https://jsonplaceholder.typicode.com/posts/1');
  }

  Widget build(BuildContext context) {
    return new Scaffold(
        body: new Container(
          //color: Color(0xf6f7f8),
            child: new ListView(
              children: cardData,
            )
        )
    );
  }
}