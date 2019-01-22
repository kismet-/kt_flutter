import 'package:flutter/material.dart';
import 'package:kt_flutter/homelist.dart';

import 'model.dart';
import 'services.dart';



class HomeBody extends StatelessWidget{

  //HomeBody({@required this.date});

  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            child: ListView(
                children: <Widget>[
                  FutureBuilder<Logs>(
                      future: getLogs(),
                      builder: (context, snapshot) {
                        return HomeList(
                          cardHeading: '\n    Log Audit Summary',
                          subHeading: '    View Logs\n',
                          radialPercentage: snapshot.data.logsCount.compliant /
                              snapshot.data.logsCount.all,
                          label: "Compliance",
                        );
                      }
                  ),
                  FutureBuilder<Scorecard>(
                      future: getScore(),
                      builder: (context, snapshot) {
                        return HomeList(
                          cardHeading: '\n    Scorecards Summary',
                          subHeading: '    View Scorecards\n',
                          radialPercentage: snapshot.data
                              .driverPerformanceSummary.totalScore,
                          label: "Safety Score",
                        );
                      }
                  ),
                  FutureBuilder<ElDevents>(
                      future: getELDevents(),
                      builder: (context, snapshot) {
                        return HomeList(
                          cardHeading: '\n    ELD Events Summary',
                          subHeading: '    View ELD Events\n',
                          radialPercentage: snapshot.data.drivingPeriodsCount
                              .interrupted /
                              snapshot.data.drivingPeriodsCount.all,
                          label: "Identified",
                        );
                      }
                  ),
                  FutureBuilder<Utilization>(
                      future: getUtilization(),
                      builder: (context, snapshot) {
                        return HomeList(
                          cardHeading: '\n    Vehicle Utilization',
                          subHeading: '    View Utilization Summary\n',
                          radialPercentage: snapshot.data.idlingSummary
                              .idleDuration /
                              snapshot.data.idlingSummary.motionDuration,
                          label: "Utilization",
                        );
                      }
                  )
                ]
            )
        )
    );
  }
}
