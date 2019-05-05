import 'package:flutter/material.dart';
import 'circleprogressbar.dart';

import 'model.dart';
import 'eldsearchresults.dart';
import 'services.dart';

Services service = new Services();

class HexToColor extends Color {
  static _hexToColor(String code) {
    return int.parse(code.substring(1, 7), radix: 16) + 0xFF000000;
  }

  HexToColor(final String code) : super(_hexToColor(code));
}

class ELDCard extends StatelessWidget {
  final ElDevents eld;

  ELDCard({@required this.eld});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // ---------------  Card Heading -----------------\\
        Align(
          alignment: Alignment.bottomLeft,
          heightFactor: 1,
          child: Text(
            '\n    ELD Events Summary',
            textAlign: TextAlign.left,
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w600,
                fontSize: 13.0,
                fontFamily: "openSans"),
          ),
        ),
        // ----------------  Card Subheading -----------------\\
        Align(
          alignment: Alignment.bottomLeft,
          heightFactor: 1,
          child: InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => EldSearchResults(),));
            },
            child: Text(
              '    View ELD Events\n',
              textAlign: TextAlign.left,
              style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.w400,
                  fontSize: 13.0,
                  fontFamily: "openSans"),
            ),
          ),
        ),
        // ---------------  Date  -----------------\\
        SizedBox(
          height: 45.0,
          width: 355.0,
          child: Container(
            width: 355,
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                    color: Color.fromRGBO(138, 156, 167, .4), width: 1),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(4), topRight: Radius.circular(4))),
            child: Center(
              // ---------------  Date is returned here from API via Future-----------------\\
                child: Text(
                    service.convertDate(eld.startDate) +
                              " - " +
                              service.convertDate(
                                eld.endDate,
                              ),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w200,
                              color: Colors.grey))
            ),
          ),
        ),
        Stack(
          alignment: Alignment.bottomLeft,
          children: <Widget>[
            Center(
                child: Container(
              height: 265,
              width: 355,
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                      color: Color.fromRGBO(138, 156, 167, .4), width: 1),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(4),
                      bottomRight: Radius.circular(4))),
              child: SizedBox(
                height: 70,
                width: 70,
                child: Stack(
                  children: <Widget>[
                    Positioned(
                        top: 45,
                        left: 140,
                        child: Center(
                          child: Container(
                            width: 70.0,
                            height: 70.0,
                            // ------------------  Card Radial Percentage -----------------\\
                              child: CircleProgressBar(
                                backgroundColor: HexToColor("#edf4fa"),
                                foregroundColor: HexToColor("#428cd0"),
                                      value: 1 -
                                          eld.drivingPeriodsCount.unidentified /
                                              eld.drivingPeriodsCount.all,
                              )
                          ),
                        )),
                    Positioned(
                        top: 75,
                        left: 162,
                        child: Text((100 -
                            (100 * eld.drivingPeriodsCount.unidentified /
                                eld.drivingPeriodsCount.all)).toStringAsFixed(
                            0) + "%")
                    ),
                    Align(
                        alignment: Alignment.bottomCenter,
                        child: Center(
                          child: Text("Identified",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 13.0)),
                        )),
                  ],
                ),
              ),
            )),
            Padding(
              padding: const EdgeInsets.only(bottom: 50.0, left: 30),
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(0.0),
                              child: Text("Identified Driving",
                                  style: TextStyle(
                                      fontSize: 10.5,
                                      fontWeight: FontWeight.w200),
                                  textAlign: TextAlign.left),
                            ),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(0.0),
                              child: Text("Unidentified Driving",
                                  style: TextStyle(
                                      fontSize: 10.5,
                                      fontWeight: FontWeight.w200),
                                  textAlign: TextAlign.left),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Padding(
                                    padding: const EdgeInsets.only(
                                        bottom: 0.0, right: 0),
                            child: Text(
                                ((eld.drivingPeriodsDurations.identified ~/
                                    60) ~/ 60).toString() + " hrs" +
                                    ((eld.drivingPeriodsDurations.identified ~/
                                        60) % 60).toString() + " mins",
                                        style: TextStyle(
                                            fontSize: 10,
                                            fontWeight: FontWeight.w200),
                                        textAlign: TextAlign.right),
                          )
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Padding(
                                    padding: const EdgeInsets.only(
                                        bottom: 00.0, right: 0),
                            child: Text(
                                ((eld.drivingPeriodsDurations.unidentified ~/
                                    60) ~/ 60).toString() + " hrs" +
                                    ((eld.drivingPeriodsDurations
                                        .unidentified ~/ 60) % 60).toString() +
                                    " mins",
                                        style: TextStyle(
                                            fontSize: 10,
                                            fontWeight: FontWeight.w200),
                                        textAlign: TextAlign.right),
                          )
                        ],
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Padding(
                                    padding: const EdgeInsets.only(left: 8),
                                    child: Text(
                                        (eld.drivingPeriodsCount.all -
                                            eld.drivingPeriodsCount
                                                .unidentified)
                                                .toString() +
                                            " events",
                                        style: TextStyle(
                                            fontSize: 10,
                                            fontWeight: FontWeight.w200),
                                        textAlign: TextAlign.right),
                          )
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Padding(
                                    padding: const EdgeInsets.only(bottom: 0),
                                    child: Text(
                                        eld.drivingPeriodsCount
                                                .unidentified
                                                .toString() +
                                            " events",
                                        style: TextStyle(
                                            fontSize: 10,
                                            fontWeight: FontWeight.w200),
                                        textAlign: TextAlign.right),
                          )
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(bottom: 0.0),
                  child: Text(
                              "Interrupted Driving Events: " +
                                  eld.drivingPeriodsCount.interrupted
                                      .toString(),
                              style: TextStyle(
                                  fontSize: 10, fontWeight: FontWeight.w200),
                              textAlign: TextAlign.right),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Text(
                              "ELD Disconnects: " +
                                  eld.eldDisconnectsCount.toString(),
                              style: TextStyle(
                                  fontSize: 10, fontWeight: FontWeight.w200),
                      textAlign: TextAlign.right),
                )
              ],
            ),
          ],
        ),
      ],
    );
  }
}
