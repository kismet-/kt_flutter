import 'package:flutter/material.dart';

import 'model.dart';
import 'services.dart';

Services service = new Services();

class ScoreCard extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ScoreCardState();
  }
}

class ScoreCardState extends State<ScoreCard>
    with AutomaticKeepAliveClientMixin<ScoreCard> {
  bool get wantKeepAlive => true;

  Future<Logs> _logs = service.getLogs();
  Future<Scorecard> _score = service.getScore();

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
            '\n    Scorecards Summary',
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
            '    View Scorecards\n',
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
                              child: FutureBuilder<Scorecard>(
                                  future: _score,
                                  builder: (context, snapshot) {
                                    if (snapshot.data == null) {
                                      return CircularProgressIndicator(
                                        value: 0,
                                      );
                                    } else {
                                      return CircularProgressIndicator(
                                        value: (snapshot
                                                .data
                                                .driverPerformanceSummary
                                                .totalScore /
                                            100),
                                      );
                                    }
                                  }),
                            ),
                          )),
                      Positioned(
                          top: 75,
                          left: 162,
                          child: FutureBuilder<Scorecard>(
                              future: _score,
                              builder: (context, snapshot) {
                                if (snapshot.data == null) {
                                  return Text("");
                                } else {
                                  return Text((snapshot
                                              .data
                                              .driverPerformanceSummary
                                              .totalScore)
                                          .toStringAsFixed(0) +
                                      "%");
                                }
                              })),
                      Align(
                          alignment: Alignment.bottomCenter,
                          child: Padding(
                            padding: const EdgeInsets.all(122.0),
                            child: Text("Safety Score",
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: <Widget>[
                                    Row(
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.all(9.0),
                                          child: Text("Hard Accelerations",
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
                                          padding: const EdgeInsets.all(9.0),
                                          child: Text("Hard Brakes",
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
                                          padding: const EdgeInsets.all(9.0),
                                          child: Text("Hard Corners",
                                              style: TextStyle(
                                                  fontSize: 10.5,
                                                  fontWeight: FontWeight.w200),
                                              textAlign: TextAlign.left),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      FutureBuilder<Scorecard>(
                                          future: _score,
                                          builder: (context, snapshot) {
                                            if (snapshot.data == null) {
                                              return Text("");
                                            } else {
                                              return Padding(
                                                padding:
                                                    const EdgeInsets.all(0.0),
                                                child: Text(
                                                    snapshot
                                                        .data
                                                        .driverPerformanceSummary
                                                        .numHardAccels
                                                        .toString(),
                                                    style: TextStyle(
                                                        fontSize: 10,
                                                        fontWeight:
                                                            FontWeight.w200),
                                                    textAlign: TextAlign.right),
                                              );
                                            }
                                          })
                                    ],
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Text(
                                        "0.00 per 100 mi",
                                        style: TextStyle(
                                            fontSize: 10,
                                            fontWeight: FontWeight.w200,
                                            color: Colors.grey),
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: <Widget>[
                                      FutureBuilder<Scorecard>(
                                          future: _score,
                                          builder: (context, snapshot) {
                                            if (snapshot.data == null) {
                                              return Text("");
                                            } else {
                                              return Padding(
                                                padding:
                                                    const EdgeInsets.all(0.0),
                                                child: Text(
                                                    snapshot
                                                        .data
                                                        .driverPerformanceSummary
                                                        .numHardBrakes
                                                        .toString(),
                                                    style: TextStyle(
                                                        fontSize: 10,
                                                        fontWeight:
                                                            FontWeight.w200),
                                                    textAlign: TextAlign.right),
                                              );
                                            }
                                          })
                                    ],
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Text(
                                        "0.00 per 100 mi",
                                        style: TextStyle(
                                            fontSize: 10,
                                            fontWeight: FontWeight.w200,
                                            color: Colors.grey),
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: <Widget>[
                                      FutureBuilder<Scorecard>(
                                          future: _score,
                                          builder: (context, snapshot) {
                                            if (snapshot.data == null) {
                                              return Text("");
                                            } else {
                                              return Text(
                                                  snapshot
                                                      .data
                                                      .driverPerformanceSummary
                                                      .numHardCorners
                                                      .toString(),
                                                  style: TextStyle(
                                                      fontSize: 10,
                                                      fontWeight:
                                                          FontWeight.w200),
                                                  textAlign: TextAlign.right);
                                            }
                                          })
                                    ],
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 10.0),
                                        child: Text(
                                          "0.00 per 100 mi",
                                          style: TextStyle(
                                            fontSize: 10,
                                            fontWeight: FontWeight.w200,
                                            color: Colors.grey,
                                          ),
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
