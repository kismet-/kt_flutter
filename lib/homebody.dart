import 'package:flutter/material.dart';
import 'package:kt_flutter/homelist.dart';

class HomeBody extends StatelessWidget{

  const cardData = const <HomeList>[
    const HomeList(
      cardHeading: '\n    Log Audit Summary',
      subHeading: '    View Logs\n',
      date: 'JANUARY 6  -  JANUARY 20',
      radialPercentage: 100.00,
    ),
    const HomeList(
      cardHeading: '\n    Scorecards Summary',
      subHeading: '    View Scorecards\n',
      date: 'JANUARY 6  -  JANUARY 20',
      radialPercentage: 100.00,
    ),
    const HomeList(
      cardHeading: '\n    ELD Events Summary',
      subHeading: '    View ELD Events\n',
      date: 'JANUARY 6  -  JANUARY 20',
      radialPercentage: 98.00,
    ),
    const HomeList(
      cardHeading: '\n    Vehicle Utilization',
      subHeading: '    View Utilization Summary\n',
      date: "JANUARY 6  -  JANUARY 20",
      radialPercentage: 63.00,
    )
  ];

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

