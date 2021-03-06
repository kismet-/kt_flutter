import 'package:flutter/material.dart';

import 'circleprogressbar.dart';
import 'model.dart';
import 'services.dart';

Services service = new Services();

class HexToColor extends Color {
  static _hexToColor(String code) {
    return int.parse(code.substring(1, 7), radix: 16) + 0xFF000000;
  }

  HexToColor(final String code) : super(_hexToColor(code));
}

class UtilizationCard extends StatelessWidget {
  final Utilization utilization;

  UtilizationCard({@required this.utilization});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // ---------------  Card Heading -----------------\\
        Align(
          alignment: Alignment.bottomLeft,
          heightFactor: 1,
          child: Text(
            '\n    Vehicle Utilization',
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
          child: Text(
            '    View Utilization Summary\n',
            textAlign: TextAlign.left,
            style: TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.w400,
                fontSize: 13.0,
                fontFamily: "openSans"),
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
                    service.convertDate(utilization.startDate) +
                              " - " +
                              service.convertDate(
                                utilization.endDate,
                              ),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w200,
                              color: Colors.grey))
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 0, top: 0, right: 0, bottom: 0),
          child: SizedBox(
              child: Stack(
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
                                  value: (utilization.idlingSummary
                                      .idleDuration /
                                      utilization.idlingSummary.motionDuration),
                                )
                            ),
                          )),
                      Positioned(
                          top: 75,
                          left: 162,
                          child: Text((100 *
                              (utilization.idlingSummary.idleDuration /
                                  utilization.idlingSummary.motionDuration))
                              .toStringAsFixed(0) + "%")
                      ),
                      Align(
                          alignment: Alignment.bottomCenter,
                          child: Padding(
                            padding: const EdgeInsets.all(122.0),
                            child: Text("Utilization",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 13.0)),
                          )),
                      Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: <Widget>[
                                    Row(
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.all(0.0),
                                          child: Text("Idle Time",
                                              style: TextStyle(
                                                  fontSize: 10.5,
                                                  fontWeight: FontWeight.w200),
                                              textAlign: TextAlign.left),
                                        )
                                      ],
                                    ),
                                    Row(
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              bottom: 15.0),
                                          child: Text(
                                            "Idle Fuel",
                                            style: TextStyle(
                                                fontSize: 10,
                                                fontWeight: FontWeight.w200,
                                                color: Colors.grey),
                                          ),
                                        )
                                      ],
                                    ),
                                    Row(
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.all(0.0),
                                          child: Text("Driving Time",
                                              style: TextStyle(
                                                  fontSize: 10.5,
                                                  fontWeight: FontWeight.w200),
                                              textAlign: TextAlign.left),
                                        )
                                      ],
                                    ),
                                    Row(
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              bottom: 20.0),
                                          child: Text(
                                            "Drivng Fuel",
                                            style: TextStyle(
                                                fontSize: 10,
                                                fontWeight: FontWeight.w200,
                                                color: Colors.grey),
                                          ),
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
                                          padding: const EdgeInsets.all(0.0),
                                          child: Text(
                                              ((utilization.idlingSummary
                                                  .idleDuration ~/ 60) ~/ 60)
                                                  .toString() + " hrs" +
                                                  ((utilization.idlingSummary
                                                      .idleDuration ~/ 60) % 60)
                                                      .toString() + " mins",
                                              style: TextStyle(
                                                  fontSize: 10,
                                                  fontWeight:
                                                  FontWeight.w200),
                                              textAlign:
                                              TextAlign.right))
                                    ],
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Padding(
                                          padding: const EdgeInsets.only(
                                              bottom: 15.0),
                                          child: Text((utilization.idlingSummary
                                              .idleFuel / 3.785411784)
                                              .toStringAsFixed(2) + " gal",
                                                    style: TextStyle(
                                                        fontSize: 10,
                                                        fontWeight:
                                                        FontWeight.w200,
                                                        color: Colors.grey),
                                          ))
                                    ],
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Padding(
                                                padding: const EdgeInsets.all(
                                                    0.0),
                                        child: Text(((utilization.idlingSummary
                                            .motionDuration ~/ 60) ~/ 60)
                                            .toString() + " hrs" +
                                            ((utilization.idlingSummary
                                                .motionDuration ~/ 60) % 60)
                                                .toString() + " mins",
                                                    style: TextStyle(
                                                        fontSize: 10,
                                                        fontWeight:
                                                        FontWeight.w200),
                                                    textAlign: TextAlign.right),
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            bottom: 20.0),
                                        child: Text(
                                          (utilization.idlingSummary
                                              .motionFuel / 3.785411784)
                                              .toStringAsFixed(2) + " gal",
                                                  style: TextStyle(
                                                      fontSize: 10,
                                                      fontWeight: FontWeight
                                                          .w200,
                                                      color: Colors.grey),
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              )
                            ],
                          ))
                    ],
                  ),
                ),
              ))
            ],
          )),
        )
      ],
    );
  }
}
