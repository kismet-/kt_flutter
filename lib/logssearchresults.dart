import 'package:flutter/material.dart';

import 'logssearchresultsbloc.dart';
import 'queryresponsemodel.dart';
import 'services.dart';


class LogsSearchResults extends StatefulWidget {
  final Services _services = Services();

//  final Logs logs;

//  LogsSearchResults({@required this.logs, this.logsQuery});
  @override
  State<StatefulWidget> createState() => _LogsSearchResultsState();
}

class _LogsSearchResultsState extends State<LogsSearchResults> {
  LogsSearchResultsBloc _logsSearchResultsBloc;

  final topBar = new AppBar(
    centerTitle: true,
    elevation: 1,
    actions: <Widget>[
      Padding(
        padding: const EdgeInsets.only(right: 24.0),
        child: new Image.asset('assets/icons/dropdownicon.png', width: 23,),
      )
    ],
  );

  @override
  void initState() {
    _logsSearchResultsBloc = LogsSearchResultsBloc(widget._services);
    _logsSearchResultsBloc.getLogsQueryData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: topBar,
      body: StreamBuilder<LogsSearchResultsState>(
        stream: _logsSearchResultsBloc.logsQuery,
        initialData: LogsSearchResultsLoadingState(),
        builder: (context, snapshot) {
          if (snapshot.data is LogsSearchResultsLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.data is LogsSearchResultsLoadedState) {
            LogsSearchResultsLoadedState state = snapshot.data;
            return _buildLoaded(state.logsQuery);
          }
        },
      ),
    );
  }

  resultsDataBody(LogsQueryResponse logsQuery) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: DataTable(
            columns: [
              DataColumn(
                label: Text("DATE"),
                numeric: false,
              ),
              DataColumn(
                label: Text("DRIVER"),
                numeric: false,
              ),
              DataColumn(
                label: Text("HOURS \tWORKED"),
                numeric: false,
              ),
              DataColumn(
                label: Text("DISTANCE"),
                numeric: false,
              ),
              DataColumn(
                label: Text("HOURS OF SERVICE"),
                numeric: false,
              ),
              DataColumn(
                label: Text("FORM AND MANNER"),
                numeric: false,
              ),
              DataColumn(
                label: Text("INSPECTION REPORT"),
                numeric: false,
              ),
            ],
            rows: logsQuery.logs
                .map((listTableData) =>
                DataRow(onSelectChanged: (b) {}, cells: [
                  DataCell(
                      Text(listTableData.log.date.toIso8601String())),
                  DataCell(Text(((listTableData.log.driver.firstName)
                      .toString() +
                      " " +
                      (listTableData.log.driver.lastName.toString()))
                      .toString())),
                  DataCell(Text((listTableData.log.drivingDuration +
                      listTableData.log.onDutyDuration)
                      .toString())),
                  DataCell(Text(listTableData.log.totalMiles.toString())),
                  DataCell(Text((listTableData.log.drivingDuration +
                      listTableData.log.onDutyDuration)
                      .toString())),
                  DataCell(Text(
                      listTableData.log.formAndMannerErrors.toString())),
                  DataCell(Text(
                      listTableData.log.inspectionReports.toString())),
                ]))
                .toList(),
          )),
    );
  }

  _buildLoaded(LogsQueryResponse logsQuery) {
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
          child: resultsDataBody(logsQuery),
        ),
      ],
    );
  }
}


