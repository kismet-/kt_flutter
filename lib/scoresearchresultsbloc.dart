import 'dart:async';

import 'scoreresponsemodel.dart';
import 'services.dart';

class ScoreSearchResultsBloc {
  ScoreSearchResultsBloc(this._services);

  final Services _services;

  final _scoreQueryStreamController =
      StreamController<ScoreSearchResultsState>();

  Stream<ScoreSearchResultsState> get scoreQuery =>
      _scoreQueryStreamController.stream;

  void getScoreQueryData() {
    _scoreQueryStreamController
        .add(ScoreSearchResultsState._scoreQueryDataLoading());
    _services.getScoreQueryResponse().then((scoreQueryData) =>
        _scoreQueryStreamController.sink.add(
            ScoreSearchResultsState._scoreQueryDataLoaded(scoreQueryData)));
  }

  void dispose() {
    _scoreQueryStreamController.close();
  }
}

class ScoreSearchResultsState {
  ScoreSearchResultsState();

  factory ScoreSearchResultsState._scoreQueryDataLoading() =
      ScoreSearchResultsLoadingState;

  factory ScoreSearchResultsState._scoreQueryDataLoaded(
      ScoreQueryResponse scoreQuery) = ScoreSearchResultsLoadedState;
}

class ScoreSearchResultsLoadingState extends ScoreSearchResultsState {}

class ScoreSearchResultsLoadedState extends ScoreSearchResultsState {
  ScoreSearchResultsLoadedState(this.scoreQuery);

  final ScoreQueryResponse scoreQuery;
}
