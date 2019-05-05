import 'package:flutter/material.dart';

import 'scoreresponsemodel.dart';
import 'scoresearchresultsbloc.dart';
import 'services.dart';

class ScoreSearchResults extends StatefulWidget {
  final Services _services = Services();

//  final Logs logs;

//  LogsSearchResults({@required this.logs, this.logsQuery});
  @override
  State<StatefulWidget> createState() => _ScoreSearchResultsState();
}

class _ScoreSearchResultsState extends State<ScoreSearchResults> {
  ScoreSearchResultsBloc _scoreSearchResultsBloc;

  final topBar = new AppBar(
    centerTitle: true,
    elevation: 1,
    actions: <Widget>[
      Padding(
        padding: const EdgeInsets.only(right: 24.0),
        child: new Image.asset(
          'assets/icons/dropdownicon.png',
          width: 23,
        ),
      )
    ],
  );

  @override
  void initState() {
    _scoreSearchResultsBloc = ScoreSearchResultsBloc(widget._services);
    _scoreSearchResultsBloc.getScoreQueryData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: topBar,
      body: StreamBuilder<ScoreSearchResultsState>(
        stream: _scoreSearchResultsBloc.scoreQuery,
        initialData: ScoreSearchResultsLoadingState(),
        builder: (context, snapshot) {
          if (snapshot.data is ScoreSearchResultsLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.data is ScoreSearchResultsLoadedState) {
            ScoreSearchResultsLoadedState state = snapshot.data;
            return _buildLoaded(state.scoreQuery);
          }
        },
      ),
    );
  }

  resultsDataBody(ScoreQueryResponse scoreQuery) {
    return ListView(
      scrollDirection: Axis.vertical,
      children: <Widget>[
        SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
              columns: [
                DataColumn(
                  label: Text("DRIVER"),
                  numeric: false,
                ),
                DataColumn(
                  label: Text("Safety Scores"),
                  numeric: false,
                ),
                DataColumn(
                  label: Text("Coached Events"),
                  numeric: false,
                ),
                DataColumn(
                  label: Text("Hard Accelerations"),
                  numeric: false,
                ),
                DataColumn(
                  label: Text("Hard Brakes"),
                  numeric: false,
                ),
                DataColumn(
                  label: Text("Hard Corners"),
                  numeric: false,
                ),
                DataColumn(
                  label: Text("Total Distance "),
                  numeric: false,
                ),
              ],
              rows: scoreQuery.driverPerformanceSummaries
                  .map((listTableData) =>
                      DataRow(onSelectChanged: (b) {}, cells: [
                        DataCell(Text(listTableData
                            .driverPerformanceSummary.driver.fullName)),
                        DataCell(Text(listTableData
                                .driverPerformanceSummary.score
                                .toStringAsFixed(0) +
                            "%")),
                        DataCell(Text(listTableData
                            .driverPerformanceSummary.numCoachedEvents
                            .toString())),
                        DataCell(Text(listTableData
                            .driverPerformanceSummary.numHardAccels
                            .toString())),
                        DataCell(Text(listTableData
                            .driverPerformanceSummary.numHardBrakes
                            .toString())),
                        DataCell(Text(listTableData
                            .driverPerformanceSummary.numHardCorners
                            .toString())),
                        DataCell(Text(listTableData
                            .driverPerformanceSummary.totalKilometers
                            .toString())),
                      ]))
                  .toList(),
            )),
      ],
    );
  }

  _buildLoaded(ScoreQueryResponse scoreQuery) {
    return Column(
      children: <Widget>[
        Container(
          width: 375,
          height: 210,
          child: Column(
            children: <Widget>[
              Container(
                height: 30,
                width: 317,
                margin: EdgeInsets.only(top: 20),
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                        color: Color.fromRGBO(138, 156, 167, .4), width: 1),
                    borderRadius: BorderRadius.all(Radius.circular(4))),
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 4.184, bottom: 4.184, left: 13, right: 25),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Text(
                            /*services.convertDate(widget.logs.startDate.toString()) +
                                " - " +
                                service.convertDate(
                                  widget.logs.endDate.toString(),
                                ),
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w200,
                                color: Colors.grey)*/
                            ""),
                      ),
                      Image.asset("assets/icons/dateicon.png"),
                    ],
                  ),
                ),
              ),
              Container(
                height: 30,
                width: 317,
                margin: EdgeInsets.only(top: 20),
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                        color: Color.fromRGBO(138, 156, 167, .4), width: 1),
                    borderRadius: BorderRadius.all(Radius.circular(4))),
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: Text("All Drivers",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w200,
                          color: Colors.grey)),
                ),
              ),
              Container(
                height: 30,
                width: 317,
                margin: EdgeInsets.all(20),
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                        color: Color.fromRGBO(138, 156, 167, .4), width: 1),
                    borderRadius: BorderRadius.all(Radius.circular(4))),
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 5.577, bottom: 5.577, left: 13, right: 25),
                  child: Text("All Logs",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w200,
                          color: Colors.grey)),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: resultsDataBody(scoreQuery),
        ),
      ],
    );
  }
}
