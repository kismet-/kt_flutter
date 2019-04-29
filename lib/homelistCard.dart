import 'package:flutter/material.dart';

import 'model.dart';
import 'services.dart';

Services service = new Services();

class HomeListCard extends StatefulWidget {

  final String cardHeading;
  final String subHeading;
  final String date;
  final double radialPercentage;
  final String label;

  HomeListCard(
      {this.cardHeading, this.subHeading, this.date, this.radialPercentage, this.label});

  @override
  State<StatefulWidget> createState() {
    return HomeListCardState(cardHeading: cardHeading,
        subHeading: subHeading,
        date: date,
        radialPercentage: radialPercentage,
        label: label);
  }
}

class HomeListCardState extends State<HomeListCard>
    with AutomaticKeepAliveClientMixin<HomeListCard> {

  bool get wantKeepAlive => true;

  final String cardHeading;
  final String subHeading;
  final String date;
  final num radialPercentage;
  final String label;

  HomeListCardState(
      {this.cardHeading, this.subHeading, this.date, this.radialPercentage, this.label});

  Future<Logs> _logs = service.getLogs();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // ---------------  Card Heading -----------------\\
        Align(
          alignment: Alignment.bottomLeft,
          heightFactor: 1,
          child: Text(cardHeading,
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
          child: Text(subHeading,
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
                    topLeft: Radius.circular(4), topRight: Radius.circular(4))
            ),
            child: Center(
              // ---------------  Date is returned here from API via Future-----------------\\
              child: FutureBuilder<Logs>(
                  future: _logs,
                  builder: (context, snapshot) {
                    if (snapshot.data == null) {
                      return Text("");
                    } else {
                      return Text(
                          service.convertDate(snapshot.data.startDate) + " - " +
                              service.convertDate(snapshot.data.endDate),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 9, fontWeight: FontWeight.w200));
                    }
                  }
              ),
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
                                color: Color.fromRGBO(138, 156, 167, .4),
                                width: 1),
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(4),
                                bottomRight: Radius.circular(4))
                        ),
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
                                      child: new CircularProgressIndicator(
                                        value: radialPercentage,
                                      ),
                                    ),
                                  )
                              ),
                              Positioned(
                                  top: 75,
                                  left: 162,
                                  child: Text(
                                      (radialPercentage * 100).toStringAsFixed(
                                          0) + "%")
                              ),
                              Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Padding(
                                    padding: const EdgeInsets.all(122.0),
                                    child: Text(label, style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 13.0)),
                                  )
                              ),
                            ],
                          ),
                        ),
                      )
                  )
                ],
              )
          ),
        )
      ],
    );
  }
}