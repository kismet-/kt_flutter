import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kt_flutter/scorecard.dart';

import 'driverscard.dart';
import 'eldcard.dart';
import 'homescreenbloc.dart';
import 'inspectionreportscard.dart';
import 'logauditcard.dart';
import 'model.dart';
import 'recentdocumentscard.dart';
import 'services.dart';
import 'utilizationcard.dart';

final String assetName = 'assets/icons/keeptruckin-logo.svg';

class HomeBody extends StatefulWidget {
  final Services service = new Services();

  @override
  State<StatefulWidget> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  HomeScreenBloc _homeScreenBloc;

  @override
  void initState() {
    _homeScreenBloc = HomeScreenBloc(widget.service);
    super.initState();
  }


  final Widget svg = new SvgPicture.asset(
      assetName,
      semanticsLabel: 'Acme Logo'
  );

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<HomeScreenState>(
      stream: _homeScreenBloc.logs,
      initialData: HomeScreenInitState(),
      builder: (context, snapshot) {
        if (snapshot.data is HomeScreenInitState) {
          return _buildInit();
        }
        if (snapshot.data is HomeScreenDataLoadedState) {
          HomeScreenDataLoadedState state = snapshot.data;
          return _buildLoaded(
              state.logs,
              state.score,
              state.eld,
              state.utilization,
              state.drivers,
              state.dvir,
              state.documents);
        }
        if (snapshot.data is HomeScreenLoadingState) {
          return _buildLoading();
        }
      },
    );
  }


  Widget _buildInit() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,

        children: <Widget>[
          svg,
          Text("Log in to your account",
            style: TextStyle(fontSize: 24),
            textAlign: TextAlign.center,),
          TextField(
            obscureText: false,
            decoration: InputDecoration(
                contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                hintText: "Email or Username",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4.0))),
          ),
          TextField(
            obscureText: true,
            decoration: InputDecoration(
                contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                hintText: "Password",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4.0))),
          ),
          RaisedButton(
            child: const Text('Log In'),
            onPressed: () {
              _homeScreenBloc.getLogsData();
//              Future initiate() async {
//                var client = http.Client();
//                http.Response response = await client.get(
//                    'https://keeptruckin.com/log-in'
//                );
//
//                var document = parse(response.body);
//
//                String links = document.querySelector('name=').toString();
//
//
//                debugPrint(links);
//
//
//              }
//              initiate();
            },
          ),
          Text("Forgot your password?"),
          Text("Don't have an account?"),
          Text("Sign Up"),


//          new TextField(
//            textAlign: TextAlign.center,
//            decoration: InputDecoration(
//                border: InputBorder.none, hintText: 'X-Web-User-Auth Key'),
//          ),
//          new TextField(
//            textAlign: TextAlign.center,
//            decoration: InputDecoration(
//                border: InputBorder.none, hintText: 'Authorization Key'),
//          ),
        ],
      ),
    );
  }

  Widget _buildLoaded(Logs logs, Scorecard score, ElDevents eld,
      Utilization utilization, Drivers drivers, Dvir dvirs,
      Documents documents) {
    return ListView(
        children: <Widget>[
          LogAuditCard(logs: logs),
          ScoreCard(score: score),
          ELDCard(eld: eld),
          UtilizationCard(utilization: utilization),
          DriversCard(drivers: drivers),
          InspectionReportsCard(dvir: dvirs),
          RecentDocumentsCard(docs: documents),
        ]
    );
  }

  Widget _buildLoading() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  @override
  void dispose() {
    _homeScreenBloc.dispose();
    super.dispose();
  }
}


//class HomeBody extends StatefulWidget {
//  @override
//  State<StatefulWidget> createState() {
//    return _HomeBodyState();
//  }
//}
//
//class _HomeBodyState extends State<HomeBody> {
//  bool _isLoading = false;
//
//  Logs logs;
//  Scorecard score;
//  ElDevents eld;
//  Utilization utilization;
//  Drivers drivers;
//  Dvir dvir;
//  Documents docs;
//
//  LogsQueryResponse logsQuery;
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      body: _isLoading ? _buildLoading() : _buildBody(),
//    );
//  }
//
//  Widget _buildBody() {
//    if (logs != null) {
//      return _buildContent();
//    } else {
//      return _buildInit();
//    }
//  }
//
//  Widget _buildInit() {
//    return Center(
//      child: Column(
//        mainAxisAlignment: MainAxisAlignment.center,
//        children: <Widget>[
//          new TextField(
//            textAlign: TextAlign.center,
//            decoration: InputDecoration(
//                border: InputBorder.none, hintText: 'X-Web-User-Auth Key'),
//          ),
//          new TextField(
//            textAlign: TextAlign.center,
//            decoration: InputDecoration(
//                border: InputBorder.none, hintText: 'Authorization Key'),
//          ),
//          RaisedButton(
//            child: const Text('Load user data'),
//            onPressed: () {
//              setState(() {
//                _isLoading = true;
//              });
//              service.getLogs().then((data0) =>
//                  service.getScore().then((data1) =>
//                      service.getELDevents().then((data2) =>
//                          service.getUtilization().then((data3) =>
//                              service.getDrivers().then((data4) =>
//                                  service.getDvirs().then((data5) =>
//                                      service.getDocuments().then((data6) =>
//                                          service.getLogsQueryResponse().then((
//                                              data7) =>
//                                              setState(() {
//                                                logs = data0;
//                                                print(logs.startDate);
//                                                score = data1;
//                                                eld = data2;
//                                                utilization = data3;
//                                                drivers = data4;
//                                                dvir = data5;
//                                                docs = data6;
//                                                logsQuery = data7;
//
//                                                _isLoading = false;
//                                              }
//                                              )
//                                          )
//                                      )
//                                  )
//                              )
//                          )
//                      )
//                  )
//              );
//            },
//          ),
//        ],
//      ),
//    );
//  }
//
//  Widget _buildContent() {
//    return ListView(
//        children: <Widget>[
//          LogAuditCard(logs: this.logs),
//          ScoreCard(score: this.score),
//          ELDCard(eld: this.eld),
//          UtilizationCard(utilization: this.utilization),
//          DriversCard(drivers: this.drivers),
//          InspectionReportsCard(dvir: dvir),
//          RecentDocumentsCard(docs: docs),
//        ]
//    );
//  }
//
//  Widget _buildTest() {
//    return LogsSearchResults(logsQuery: this.logsQuery, logs: logs,);
//  }
//
//
//  Widget _buildLoading() {
//    return const Center(
//      child: CircularProgressIndicator(),
//    );
//  }
//}

