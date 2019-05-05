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

class RecentDocumentsCard extends StatelessWidget {
  final Documents docs;

  RecentDocumentsCard({@required this.docs});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // ---------------  Card Heading -----------------\\
        Align(
          alignment: Alignment.bottomLeft,
          heightFactor: 1,
          child: Text(
            '\n    Recent Documents',
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
            '    View Documents\n',
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
                child: Text(service.convertDate(docs.startDate) + " - " +
                    service.convertDate(docs.endDate),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w200,
                            color: Colors.grey
                        ),
                )
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
                                  value: (100),
                                )
                            ),
                          )),
                      Positioned(
                          top: 75,
                          left: 162,
                          child: Text(((0) * 100).toStringAsFixed(0) + "%")
                      ),
                      Align(
                          alignment: Alignment.bottomCenter,
                          child: Padding(
                            padding: const EdgeInsets.all(122.0),
                            child: Text("Bill Of Lading",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 13.0)),
                          )),
                      Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              Row(children: <Widget>[
                                Container(
                                  height: 25,
                                  width: 337 / 2,
                                  child: Text("Fuel Receipt",
                                      style: TextStyle(
                                          fontSize: 10.5,
                                          fontWeight: FontWeight.w200)),
                                ),
                                Container(
                                          height: 25,
                                          width: 337 / 2,
                                  child: Text(docs.docsCount.billOfLading
                                                  .toString(),
                                              style: TextStyle(
                                                  fontSize: 10.5,
                                                  fontWeight: FontWeight.w200),
                                              textAlign: TextAlign.right),
                                ),
                              ]),
                              Row(
                                children: <Widget>[
                                  Container(
                                      height: 25,
                                      width: 337 / 2,
                                      child: Text(
                                        "Fuel Receipt",
                                        style: TextStyle(
                                            fontSize: 10.5,
                                            fontWeight: FontWeight.w200),
                                      )),
                                  Container(
                                    height: 25,
                                    width: 337 / 2,
                                    child: Text(
                                        docs.docsCount.fuelReceipt.toString(),
                                        style: TextStyle(
                                            fontSize: 10.5,
                                            fontWeight:
                                            FontWeight.w200),
                                        textAlign: TextAlign.right),
                                  )
                                ],
                              ),
                              Row(
                                children: <Widget>[
                                  Container(
                                      height: 25,
                                      width: 170,
                                      child: Text(
                                        "Accident Photo",
                                        style: TextStyle(
                                            fontSize: 10.5,
                                            fontWeight: FontWeight.w200),
                                      )),
                                  Container(
                                    height: 25,
                                    width: 167,
                                    child: Text(
                                        docs.docsCount.accidentPhoto.toString(),
                                        style: TextStyle(
                                            fontSize: 10.5,
                                            fontWeight:
                                            FontWeight.w200),
                                        textAlign: TextAlign.right),
                                  )
                                ],
                              ),
                              Row(
                                children: <Widget>[
                                  Container(
                                      height: 25,
                                      width: 170,
                                      child: Text(
                                        "Citation",
                                        style: TextStyle(
                                            fontSize: 10.5,
                                            fontWeight: FontWeight.w200),
                                      )),
                                  Container(
                                    height: 25,
                                    width: 167,
                                    child: Text(
                                        docs.docsCount.citation.toString(),
                                        style: TextStyle(
                                            fontSize: 10.5,
                                            fontWeight:
                                            FontWeight.w200),
                                        textAlign: TextAlign.right),
                                  )
                                ],
                              ),
                              Row(
                                children: <Widget>[
                                  Container(
                                      height: 25,
                                      width: 170,
                                      child: Text(
                                        "Scale Ticket",
                                        style: TextStyle(
                                            fontSize: 10.5,
                                            fontWeight: FontWeight.w200),
                                      )),
                                  Container(
                                    height: 25,
                                    width: 167,
                                    child: Text(
                                        docs.docsCount.scaleTicket.toString(),
                                        style: TextStyle(
                                            fontSize: 10.5,
                                            fontWeight: FontWeight.w200),
                                        textAlign: TextAlign.right),
                                  )
                                ],
                              ),
                              Row(
                                children: <Widget>[
                                  Container(
                                      height: 25,
                                      width: 170,
                                      child: Text(
                                        "Other",
                                        style: TextStyle(
                                            fontSize: 10.5,
                                            fontWeight: FontWeight.w200),
                                      )),
                                  Container(
                                    height: 25,
                                    width: 167,
                                    child: Text(docs.docsCount.other.toString(),
                                        style: TextStyle(
                                            fontSize: 10.5,
                                            fontWeight: FontWeight.w200),
                                        textAlign: TextAlign.right),
                                  )
                                ],
                              ),
                            ],
                          )
                      )
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
