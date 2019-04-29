import 'package:flutter/material.dart';
import 'package:kt_flutter/scorecard.dart';

import 'driverscard.dart';
import 'eldcard.dart';
import 'inspectionreportscard.dart';
import 'logauditcard.dart';
import 'model.dart';
import 'recentdocumentscard.dart';
import 'services.dart';
import 'utilizationcard.dart';

Services service = new Services();


class HomeBody extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeBodyState();
  }
}

class _HomeBodyState extends State<HomeBody> {
  bool _isLoading = false;

  Logs logs;
  Scorecard score;
  ElDevents eld;
  Utilization utilization;
  Drivers drivers;
  Dvir dvir;
  Documents docs;

  void initState() {
    super.initState();
    var state = "loading";
    print(state);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          child: _isLoading ? _buildLoading() : _buildBody(),
        )
    );
  }

  Widget _buildBody() {
    if (logs != null) {
      return _buildContent();
    } else {
      return _buildInit();
    }
  }

  Widget _buildInit() {
    return Center(
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
            child: const Text('Load user data'),
            onPressed: () {
              setState(() {
                _isLoading = true;
              });
              service.getLogs().then((data0) =>
                  service.getScore().then((data1) =>
                      service.getELDevents().then((data2) =>
                          service.getUtilization().then((data3) =>
                              service.getDrivers().then((data4) =>
                                  service.getDvirs().then((data5) =>
                                      service.getDocuments().then((data6) =>
                                          setState(() {
                                            logs = data0;
                                            score = data1;
                                            eld = data2;
                                            utilization = data3;
                                            drivers = data4;
                                            dvir = data5;
                                            docs = data6;

                                            _isLoading = false;
                                          }
                                          )
                                      )
                                  )
                              )
                          )
                      )
                  )
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildContent() {
    return ListView(
        children: <Widget>[
          LogAuditCard(logs: this.logs),
          ScoreCard(score: this.score),
          ELDCard(eld: this.eld),
          UtilizationCard(utilization: this.utilization),
          DriversCard(drivers: this.drivers),
          InspectionReportsCard(dvir: dvir),
          RecentDocumentsCard(docs: docs),
        ]
    );
  }

  Widget _buildLoading() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}

