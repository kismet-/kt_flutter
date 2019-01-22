import 'package:flutter/material.dart';
import 'package:kt_flutter/homescreen.dart';

var date;

navigateToHomeScreen(context) async {
  Navigator.push(
      context, MaterialPageRoute(builder: (context) => HomeScreen()));
}

// loadJson() async {
//
//  Logs logs = await getLogs();
//  num logsRadialPercentage = 100 * (logs.logsCount.compliant / logs.logsCount.all);
//  //print(logsRadialPercentage);
//
//  Scorecard score = await getScore();
//  num scoreCardRadialPercentage = score.driverPerformanceSummary.totalScore;
//  //print(scoreCardRadialPercentage);
//
//  ElDevents eld = await getELDevents();
//  //print(eld.eldDisconnectsCount);
//
//  Utilization idle = await getUtilization();
//  ///print(idle.idlingSummary.idleDuration);
//
//  Drivers drivers = await getDrivers();
//  //print(drivers.driverLocations.first.driverLocation.lat);
//  //print(drivers.driverLocations.first.driverLocation.lon);
//
//  num dates = new Logs.fromJson(logsRadialPercentage);
//
//  return dates;
//}

//print(dates);

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Screen'),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new TextField(
            textAlign: TextAlign.center,
            decoration: InputDecoration(
                border: InputBorder.none, hintText: 'X-Web-User-Auth Key'),
          ),
          new TextField(
            textAlign: TextAlign.center,
            decoration: InputDecoration(
                border: InputBorder.none, hintText: 'Authorization Key'),
          ),
          RaisedButton(
            textColor: Colors.blue,
            child: Text('Login'),
            onPressed: () {
              navigateToHomeScreen(context);
            },
          )
        ],
      )),
    );
  }
}
