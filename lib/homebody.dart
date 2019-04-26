import 'package:flutter/material.dart';
import 'package:kt_flutter/scorecard.dart';

import 'eldcard.dart';
import 'logauditcard.dart';
import 'services.dart';
import 'utilizationcard.dart';
import 'driverscard.dart';
import 'inspectionreportscard.dart';
import 'recentdocumentscard.dart';

Services service = new Services();

class HomeBody extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeBodyState();
  }
}

class _HomeBodyState extends State<HomeBody> {

  void load() {
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            child: ListView(
                children: <Widget>[
                  LogAuditCard(),
                  ScoreCard(),
                  ELDCard(),
                  UtilizationCard(),
                  DriversCard(),
                  InspectionReportsCard(),
                  RecentDocumentsCard(),
                ]
            )
        )
    );
  }
}
