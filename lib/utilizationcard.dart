import 'package:flutter/material.dart';

import 'model.dart';
import 'services.dart';

Services service = new Services();

class UtilizationCard extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return UtilizationCardState();
  }
}

class UtilizationCardState extends State<UtilizationCard>
    with AutomaticKeepAliveClientMixin<UtilizationCard> {
  bool get wantKeepAlive => true;

  Future<Logs> _logs = service.getLogs();
  Future<Utilization> _utilization = service.getUtilization();

  void load() {
    setState(() {});
  }

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
              child: FutureBuilder<Logs>(
                  future: _logs,
                  builder: (context, snapshot) {
                    if (snapshot.data == null) {
                      return Text("");
                    } else {
                      return Text(
                          service.convertDate(snapshot.data.startDate) +
                              " - " +
                              service.convertDate(
                                snapshot.data.endDate,
                              ),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w200,
                              color: Colors.grey));
                    }
                  }),
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
                              child: FutureBuilder<Utilization>(
                                  future: _utilization,
                                  builder: (context, snapshot) {
                                    if (snapshot.hasData) {
                                      print((snapshot.data.idlingSummary
                                          .idleDuration /
                                          snapshot.data.idlingSummary
                                              .idleDuration));
                                      return CircularProgressIndicator(
                                        value: (snapshot.data.idlingSummary
                                            .idleDuration /
                                            snapshot.data.idlingSummary
                                                .motionDuration),
                                      );
                                    } else {
                                      return CircularProgressIndicator(
                                        value: 0,
                                      );
                                    }
                                  }),
                            ),
                          )),
                      Positioned(
                          top: 75,
                          left: 162,
                          child: FutureBuilder<Utilization>(
                              future: _utilization,
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  return Text((100 *
                                              (snapshot.data.idlingSummary
                                                      .idleDuration /
                                                  snapshot.data.idlingSummary
                                                      .motionDuration))
                                          .toStringAsFixed(0) +
                                      "%");
                                } else {
                                  return Text(" ");
                                }
                              })),
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
                                      FutureBuilder<Utilization>(
                                          future: _utilization,
                                          builder: (context, snapshot) {
                                            if (snapshot.hasData) {
                                              num minutes = (snapshot
                                                  .data
                                                  .idlingSummary
                                                  .idleDuration / 60).toInt();
                                              num hours = (minutes / 60)
                                                  .toInt();
                                              minutes = minutes % 60;
                                              return Padding(
                                                  padding:
                                                  const EdgeInsets.all(0.0),
                                                  child: Text(
                                                      "$hours hrs $minutes mins",
                                                      style: TextStyle(
                                                          fontSize: 10,
                                                          fontWeight:
                                                          FontWeight.w200),
                                                      textAlign:
                                                      TextAlign.right));
                                            } else {
                                              return Padding(
                                                padding:
                                                    const EdgeInsets.all(0.0),
                                                child: Text(" "),
                                              );
                                            }
                                          })
                                    ],
                                  ),
                                  Row(
                                    children: <Widget>[
                                      FutureBuilder<Utilization>(
                                          future: _utilization,
                                          builder: (context, snapshot) {
                                            if (snapshot.hasData) {
                                              return Padding(
                                                  padding:
                                                  const EdgeInsets.only(
                                                      bottom: 15.0),
                                                  child: Text(
                                                    (snapshot.data.idlingSummary
                                                        .idleFuel / 3.785411784)
                                                        .toStringAsFixed(2) +
                                                        " gal",
                                                    style: TextStyle(
                                                        fontSize: 10,
                                                        fontWeight:
                                                            FontWeight.w200,
                                                        color: Colors.grey),
                                                  ));
                                            } else {
                                              return Padding(
                                                padding:
                                                    const EdgeInsets.all(0.0),
                                                child: Text(" "),
                                              );
                                            }
                                          })
                                    ],
                                  ),
                                  Row(
                                    children: <Widget>[
                                      FutureBuilder<Utilization>(
                                          future: _utilization,
                                          builder: (context, snapshot) {
                                            num minutes = (snapshot
                                                .data
                                                .idlingSummary
                                                .motionDuration / 60).toInt();
                                            num hours = (minutes / 60).toInt();
                                            minutes = minutes % 60;
                                            if (snapshot.hasData) {
                                              return Padding(
                                                padding: const EdgeInsets.all(
                                                    0.0),
                                                child: Text(
                                                    "$hours hrs $minutes mins",
                                                    style: TextStyle(
                                                        fontSize: 10,
                                                        fontWeight:
                                                        FontWeight.w200),
                                                    textAlign: TextAlign.right),
                                              );
                                            } else {
                                              return Padding(
                                                padding:
                                                const EdgeInsets.all(0.0),
                                                child: Text(" "),
                                              );
                                            }
                                          })
                                    ],
                                  ),
                                  Row(
                                    children: <Widget>[
                                      FutureBuilder<Utilization>(
                                          future: _utilization,
                                          builder: (context, snapshot) {
                                            if (snapshot.hasData) {
                                              return Padding(
                                                padding: const EdgeInsets.only(
                                                    bottom: 20.0),
                                                child: Text(
                                                  (snapshot.data.idlingSummary
                                                      .motionFuel / 3.785411784)
                                                      .toStringAsFixed(2) +
                                                      " gal",
                                                  style: TextStyle(
                                                      fontSize: 10,
                                                      fontWeight: FontWeight
                                                          .w200,
                                                      color: Colors.grey),
                                                ),
                                              );
                                            } else {
                                              return Padding(
                                                padding:
                                                    const EdgeInsets.all(0.0),
                                                child: Text(" "),
                                              );
                                            }
                                          })
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
