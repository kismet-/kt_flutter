import 'dart:async';

import 'eldresponsemodel.dart';
import 'services.dart';

class EldSearchResultsBloc {
  EldSearchResultsBloc(this._services);

  final Services _services;

  final _eldQueryStreamController = StreamController<EldSearchResultsState>();

  Stream<EldSearchResultsState> get eldQuery =>
      _eldQueryStreamController.stream;

  void getEldQueryData() {
    _eldQueryStreamController.add(EldSearchResultsState._eldQueryDataLoading());
    _services.getEldQueryResponse().then((eldQueryData) =>
        _eldQueryStreamController.sink
            .add(EldSearchResultsState._eldQueryDataLoaded(eldQueryData)));
  }

  void dispose() {
    _eldQueryStreamController.close();
  }
}

class EldSearchResultsState {
  EldSearchResultsState();

  factory EldSearchResultsState._eldQueryDataLoading() =
      EldSearchResultsLoadingState;

  factory EldSearchResultsState._eldQueryDataLoaded(EldQueryResponse eldQuery) =
      EldSearchResultsLoadedState;
}

class EldSearchResultsLoadingState extends EldSearchResultsState {}

class EldSearchResultsLoadedState extends EldSearchResultsState {
  EldSearchResultsLoadedState(this.eldQuery);

  final EldQueryResponse eldQuery;
}
