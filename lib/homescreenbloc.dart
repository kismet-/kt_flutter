import 'dart:async';

import 'model.dart';
import 'services.dart';

class HomeScreenBloc {
  HomeScreenBloc(this._services);

  final Services _services;

  final _logsStreamController = StreamController<HomeScreenState>();

  Stream<HomeScreenState> get logs => _logsStreamController.stream;

  void getLogsData() {
    _logsStreamController.sink.add(HomeScreenState._homeScreenLoading());

    _services.getLogs().then((logs) =>
        _services.getScore().then((score) =>
            _services.getELDevents().then((eld) =>
                _services.getUtilization().then((utilization) =>
                    _services.getDrivers().then((drivers) =>
                        _services.getDvirs().then((dvirs) =>
                            _services.getDocuments().then((documents) =>
                                _logsStreamController.sink.add(
                                    HomeScreenState._homeScreenDataLoaded(
                                        logs,
                                        score,
                                        eld,
                                        utilization,
                                        drivers,
                                        dvirs,
                                        documents)
                                )
                            )
                        )
                    )
                )
            )
        )
    );
  }

  void dispose() {
    _logsStreamController.close();
  }

}

class HomeScreenState {
  HomeScreenState();

  factory HomeScreenState._homeScreenDataLoaded(Logs logs, Scorecard score,
      ElDevents eld, Utilization utilization, Drivers drivers, Dvir dvir,
      Documents documents) = HomeScreenDataLoadedState;

  factory HomeScreenState._homeScreenLoading() = HomeScreenLoadingState;
}

class HomeScreenInitState extends HomeScreenState {}

class HomeScreenLoadingState extends HomeScreenState {}

class HomeScreenDataLoadedState extends HomeScreenState {
  HomeScreenDataLoadedState(this.logs, this.score, this.eld, this.utilization,
      this.drivers, this.dvir, this.documents);

  final Logs logs;
  final Scorecard score;
  final ElDevents eld;
  final Utilization utilization;
  final Drivers drivers;
  final Dvir dvir;
  final Documents documents;
}