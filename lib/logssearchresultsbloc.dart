import 'dart:async';

import 'queryresponsemodel.dart';
import 'services.dart';

class LogsSearchResultsBloc {
  LogsSearchResultsBloc(this._services);

  final Services _services;

  final _logsQueryStreamController = StreamController<LogsSearchResultsState>();

  Stream<LogsSearchResultsState> get logsQuery =>
      _logsQueryStreamController.stream;

  void getLogsQueryData() {
    _logsQueryStreamController.add(
        LogsSearchResultsState._logsQueryDataLoading());
    _services.getLogsQueryResponse().then((logsQueryData) =>
        _logsQueryStreamController.sink.add(
            LogsSearchResultsState._logsQueryDataLoaded(logsQueryData)));
  }

  void dispose() {
    _logsQueryStreamController.close();
  }
}

class LogsSearchResultsState {
  LogsSearchResultsState();

  factory LogsSearchResultsState._logsQueryDataLoading() = LogsSearchResultsLoadingState;

  factory LogsSearchResultsState._logsQueryDataLoaded(
      LogsQueryResponse logsQuery) = LogsSearchResultsLoadedState;
}

class LogsSearchResultsLoadingState extends LogsSearchResultsState {}

class LogsSearchResultsLoadedState extends LogsSearchResultsState {
  LogsSearchResultsLoadedState(this.logsQuery);

  final LogsQueryResponse logsQuery;
}