import 'package:flutter/material.dart';

import 'model.dart';
import 'services.dart';

Services service = new Services();

class ELDCard extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ELDCardState();
  }
}

class ELDCardState extends State<ELDCard>
    with AutomaticKeepAliveClientMixin<ELDCard> {
  bool get wantKeepAlive => true;
  double radialPercentageCache = 0;

  Future<Logs> _logs =
      service.getLogs(); // All cards must have to retreive date.
  Future<ElDevents> _eld = service.getELDevents();

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
                            child: FutureBuilder<ElDevents>(
                                future: _eld,
                                builder: (context, snapshot) {
                                  if (snapshot.hasData) {
                                    return CircularProgressIndicator(
                                      value: 1 -
                                          snapshot.data.drivingPeriodsCount
                                                  .unidentified /
                                              snapshot
                                                  .data.drivingPeriodsCount.all,
                                    );
                                  } else {
                                    print(snapshot.data);
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
                        child: FutureBuilder<ElDevents>(
                            future: _eld,
                            builder: (context, snapshot) {
                              if (snapshot.data == null) {
                                return Text("");
                              } else {
                                return Text((100 -
                                            (100 *
                                                snapshot
                                                    .data
                                                    .drivingPeriodsCount
                                                    .unidentified /
                                                snapshot.data
                                                    .drivingPeriodsCount.all))
                                        .toStringAsFixed(0) +
                                    "%");
                              }
                            })),
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
                          FutureBuilder<ElDevents>(
                              future: _eld,
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  int minutes = (snapshot
                                              .data
                                              .drivingPeriodsDurations
                                              .identified /
                                          60)
                                      .toInt();
                                  int hours = (minutes / 60).toInt();
                                  minutes = minutes % 60;
                                  return Padding(
                                    padding: const EdgeInsets.only(
                                        bottom: 0.0, right: 0),
                                    child: Text("$hours hrs $minutes mins",
                                        style: TextStyle(
                                            fontSize: 10,
                                            fontWeight: FontWeight.w200),
                                        textAlign: TextAlign.right),
                                  );
                                } else {
                                  return Padding(
                                    padding: const EdgeInsets.all(0.0),
                                    child: Text(""),
                                  );
                                }
                              })
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          FutureBuilder<ElDevents>(
                              future: _eld,
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  int minutes = (snapshot
                                              .data
                                              .drivingPeriodsDurations
                                              .unidentified
                                              .toInt() /
                                          60)
                                      .toInt();
                                  int hours = (minutes / 60).toInt();
                                  minutes = minutes % 60;
                                  return Padding(
                                    padding: const EdgeInsets.only(
                                        bottom: 00.0, right: 0),
                                    child: Text("$hours hrs $minutes mins",
                                        style: TextStyle(
                                            fontSize: 10,
                                            fontWeight: FontWeight.w200),
                                        textAlign: TextAlign.right),
                                  );
                                } else {
                                  return Padding(
                                    padding: const EdgeInsets.all(0.0),
                                    child: Text(""),
                                  );
                                }
                              })
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
                          FutureBuilder<ElDevents>(
                              future: _eld,
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  return Padding(
                                    padding: const EdgeInsets.only(left: 8),
                                    child: Text(
                                        (snapshot.data.drivingPeriodsCount.all -
                                                    snapshot
                                                        .data
                                                        .drivingPeriodsCount
                                                        .unidentified)
                                                .toString() +
                                            " events",
                                        style: TextStyle(
                                            fontSize: 10,
                                            fontWeight: FontWeight.w200),
                                        textAlign: TextAlign.right),
                                  );
                                } else {
                                  return Padding(
                                    padding: const EdgeInsets.all(0.0),
                                    child: Text(""),
                                  );
                                }
                              })
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          FutureBuilder<ElDevents>(
                              future: _eld,
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  return Padding(
                                    padding: const EdgeInsets.only(bottom: 0),
                                    child: Text(
                                        snapshot.data.drivingPeriodsCount
                                                .unidentified
                                                .toString() +
                                            " events",
                                        style: TextStyle(
                                            fontSize: 10,
                                            fontWeight: FontWeight.w200),
                                        textAlign: TextAlign.right),
                                  );
                                } else {
                                  return Padding(
                                    padding: const EdgeInsets.all(0.0),
                                    child: Text(""),
                                  );
                                }
                              }),
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
                FutureBuilder<ElDevents>(
                    future: _eld,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 0.0),
                          child: Text(
                              "Interrupted Driving Events: " +
                                  snapshot.data.drivingPeriodsCount.interrupted
                                      .toString(),
                              style: TextStyle(
                                  fontSize: 10, fontWeight: FontWeight.w200),
                              textAlign: TextAlign.right),
                        );
                      } else {
                        return Padding(
                          padding: const EdgeInsets.all(0.0),
                          child: Text(""),
                        );
                      }
                    }),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: FutureBuilder<ElDevents>(
                      future: _eld,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return Text(
                              "ELD Disconnects: " +
                                  snapshot.data.eldDisconnectsCount.toString(),
                              style: TextStyle(
                                  fontSize: 10, fontWeight: FontWeight.w200),
                              textAlign: TextAlign.right);
                        } else {
                          Text("");
                        }
                      }),
                )
              ],
            ),
          ],
        ),
      ],
    );
  }
}
