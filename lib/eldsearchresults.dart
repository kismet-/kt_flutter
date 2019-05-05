import 'package:flutter/material.dart';

import 'eldresponsemodel.dart';
import 'eldsearchresultsbloc.dart';
import 'services.dart';

class EldSearchResults extends StatefulWidget {
  final Services _services = Services();

//  final Logs logs;

//  LogsSearchResults({@required this.logs, this.logsQuery});
  @override
  State<StatefulWidget> createState() => _EldSearchResultsState();
}

class _EldSearchResultsState extends State<EldSearchResults> {
  EldSearchResultsBloc _eldSearchResultsBloc;

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
    _eldSearchResultsBloc = EldSearchResultsBloc(widget._services);
    _eldSearchResultsBloc.getEldQueryData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: topBar,
      body: StreamBuilder<EldSearchResultsState>(
        stream: _eldSearchResultsBloc.eldQuery,
        initialData: EldSearchResultsLoadingState(),
        builder: (context, snapshot) {
          if (snapshot.data is EldSearchResultsLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.data is EldSearchResultsLoadedState) {
            EldSearchResultsLoadedState state = snapshot.data;
            return _buildLoaded(state.eldQuery);
          }
        },
      ),
    );
  }

  resultsDataBody(EldQueryResponse eldQuery) {
    return ListView(
      scrollDirection: Axis.vertical,
      children: <Widget>[
        SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
              columns: [
                DataColumn(
                  label: Text("START TIME"),
                  numeric: false,
                ),
                DataColumn(
                  label: Text("VEHICLE"),
                  numeric: false,
                ),
                DataColumn(
                  label: Text("TYPE"),
                  numeric: false,
                ),
                DataColumn(
                  label: Text("STATUS"),
                  numeric: false,
                ),
                DataColumn(
                  label: Text("DRIVER"),
                  numeric: false,
                ),
                DataColumn(
                  label: Text("ORIGIN"),
                  numeric: false,
                ),
                DataColumn(
                  label: Text("DURATION"),
                  numeric: false,
                ),
                DataColumn(
                  label: Text("DISTANCE"),
                  numeric: false,
                ),
                DataColumn(
                  label: Text("NOTES"),
                  numeric: false,
                ),
              ],
              rows: eldQuery.drivingPeriods
                  .map((listTableData) =>
                      DataRow(onSelectChanged: (b) {}, cells: [
                        DataCell(Text(listTableData.drivingPeriod.startTime
                            .toIso8601String())),
                        DataCell(Text(listTableData.drivingPeriod.vehicle.number
                            .toString())),
                        DataCell(
                            Text(listTableData.drivingPeriod.type.toString())),
                        DataCell(Text(
                            listTableData.drivingPeriod.status.toString())),
                        DataCell(Text(listTableData
                                .drivingPeriod.driver.firstName
                                .toString() +
                            " " +
                            listTableData.drivingPeriod.driver.lastName
                                .toString())),
                        DataCell(
                            Text(listTableData.drivingPeriod.startDescription)),
                        DataCell(Text(listTableData.drivingPeriod.endTime
                            .difference(listTableData.drivingPeriod.startTime)
                            .inHours
                            .toString())),
                        DataCell(Text(
                            listTableData.drivingPeriod.distance.toString())),
                        DataCell(
                            Text(listTableData.drivingPeriod.notes.toString())),
                      ]))
                  .toList(),
            )),
      ],
    );
  }

  _buildLoaded(EldQueryResponse eldQuery) {
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
          child: resultsDataBody(eldQuery),
        ),
      ],
    );
  }
}
