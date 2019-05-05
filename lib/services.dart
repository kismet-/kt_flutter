import 'dart:async';

import 'package:http/http.dart' as http;

import 'eldresponsemodel.dart';
import 'model.dart';
import 'queryresponsemodel.dart';
import 'scoreresponsemodel.dart';

class Services {
  static final Services _services = new Services._internal();

  factory Services() {
    return _services;
  }

  Services._internal();

  Future<Logs> getLogs() async {
    final responseLogs = await http
        .get('https://api.keeptruckin.com/api/w2/overview/logs', headers: {
      'X-Web-User-Auth':
      'P6n4a8jy0SxzR2p6ji0V9ft4kcIyUD869kxVfG7UiCI1zSnL+ACwYhhvMAHPMaZZ',
      'Authorization':
      'Basic a3RfZGFzaGJvYXJkX2F1dGg6RFQyOUp6c3JDY3V3MVh1MVg4TEg='
    });
    print("---------getLogs fired");
    return logsFromJson(responseLogs.body);
  }

  Future<Scorecard> getScore() async {
    final responseScore = await http
        .get(
        'https://api.keeptruckin.com/api/w2/overview/scorecards', headers: {
      'X-Web-User-Auth':
      'P6n4a8jy0SxzR2p6ji0V9ft4kcIyUD869kxVfG7UiCI1zSnL+ACwYhhvMAHPMaZZ',
      'Authorization':
      'Basic a3RfZGFzaGJvYXJkX2F1dGg6RFQyOUp6c3JDY3V3MVh1MVg4TEg='
    });
    print("---------getScore fired");
    return scorecardFromJson(responseScore.body);
  }

  Future<ElDevents> getELDevents() async {
    final responseELDevents = await http.get(
        'https://api.keeptruckin.com/api/w2/overview/driving_periods',
        headers: {
          'X-Web-User-Auth':
          'P6n4a8jy0SxzR2p6ji0V9ft4kcIyUD869kxVfG7UiCI1zSnL+ACwYhhvMAHPMaZZ',
          'Authorization':
          'Basic a3RfZGFzaGJvYXJkX2F1dGg6RFQyOUp6c3JDY3V3MVh1MVg4TEg='
        });
    print("---------getELD fired");
    return elDeventsFromJson(responseELDevents.body);
  }

  Future<Utilization> getUtilization() async {
    final responseUtilization = await http
        .get('https://api.keeptruckin.com/api/w2/overview/idling', headers: {
      'X-Web-User-Auth':
      'P6n4a8jy0SxzR2p6ji0V9ft4kcIyUD869kxVfG7UiCI1zSnL+ACwYhhvMAHPMaZZ',
      'Authorization':
      'Basic a3RfZGFzaGJvYXJkX2F1dGg6RFQyOUp6c3JDY3V3MVh1MVg4TEg='
    });
    print("---------getUtilization fired");
    return utilizationFromJson(responseUtilization.body);
  }

  Future<Drivers> getDrivers() async {
    final responseDrivers = await http
        .get('https://api.keeptruckin.com/api/w2/overview/drivers', headers: {
      'X-Web-User-Auth':
      'P6n4a8jy0SxzR2p6ji0V9ft4kcIyUD869kxVfG7UiCI1zSnL+ACwYhhvMAHPMaZZ',
      'Authorization':
      'Basic a3RfZGFzaGJvYXJkX2F1dGg6RFQyOUp6c3JDY3V3MVh1MVg4TEg='
    });
    print("---------getDrivers fired");
    return driversFromJson(responseDrivers.body);
  }

  Future<Dvir> getDvirs() async {
    final responseDvirs = await http.get(
        'https://api.keeptruckin.com/api/w2/overview/dvirs', headers: {
      'X-Web-User-Auth':
      'P6n4a8jy0SxzR2p6ji0V9ft4kcIyUD869kxVfG7UiCI1zSnL+ACwYhhvMAHPMaZZ',
      'Authorization':
      'Basic a3RfZGFzaGJvYXJkX2F1dGg6RFQyOUp6c3JDY3V3MVh1MVg4TEg='
    });
    print("---------getDVIR fired");
    return dvirFromJson(responseDvirs.body);
  }

  Future<Documents> getDocuments() async {
    final responseDocuments = await http.get(
        'https://api.keeptruckin.com/api/w2/overview/docs', headers: {
      'X-Web-User-Auth':
      'P6n4a8jy0SxzR2p6ji0V9ft4kcIyUD869kxVfG7UiCI1zSnL+ACwYhhvMAHPMaZZ',
      'Authorization':
      'Basic a3RfZGFzaGJvYXJkX2F1dGg6RFQyOUp6c3JDY3V3MVh1MVg4TEg='
    });
    print("---------getDocuments fired");
    return documentsFromJson(responseDocuments.body);
  }

  //--------- Results Search methods

  Future<LogsQueryResponse> getLogsQueryResponse() async {
    final logsQueryresponse = await http.get(
        'https://api.keeptruckin.com/v1/logs;start_date=2019-04-15;end_date=2019-04-29;log_status=all',
        headers: {
          'X-Api-Key': 'fc02954d-cfa3-4579-959a-a1abd6b8d494',
          'X-Time-Zone': 'Central Time (US & Canada)'
        });
    print(logsQueryresponse.body);
    return logsQueryResponseFromJson(logsQueryresponse.body);
  }

  Future<ScoreQueryResponse> getScoreQueryResponse() async {
    final scoreQueryresponse = await http.get(
        'https://api.keeptruckin.com/api/w2/driver_performance/summary?page_no=1&start_date=2019-04-20&end_date=2019-05-04&sort_field=driver_name&sort_direction=asc&p',
        headers: {
          'X-Web-User-Auth': 'AwUyrEKCW6t4ybLdrh0Wqq9Q+iSH5msAi+XuYQDvTzBscaTGNCJGgOsWHyQ7elxM',
          //'X-Time-Zone': 'Central Time (US & Canada)'
        });
    print(scoreQueryresponse.body);
    return scoreQueryResponseFromJson(scoreQueryresponse.body);
  }

  Future<EldQueryResponse> getEldQueryResponse() async {
    final eldQueryresponse = await http.get(
        'https://api.keeptruckin.com/api/w2/driving_periods?page_no=2&start_date=2019-04-20&end_date=2019-05-04&sort_field=start_time&sort_direction=desc&per_page=50',
        headers: {
          'X-Web-User-Auth': 'AwUyrEKCW6t4ybLdrh0Wqq9Q+iSH5msAi+XuYQDvTzBscaTGNCJGgOsWHyQ7elxM',
          //'X-Time-Zone': 'Central Time (US & Canada)'
        });
    print(eldQueryresponse.body);
    return eldQueryResponseFromJson(eldQueryresponse.body);
  }

  Future getAuthToken() async {

  }

  String convertDate(String date) {
    List splits = date.split("-");

    String day = splits[2];
    String monthDay;

    if (splits[1] == "01") {
      monthDay = "JANUARY " + day;
    } else if ((splits[1] == "02")) {
      monthDay = "FEBRUARY " + day;
    } else if ((splits[1] == "03")) {
      monthDay = "MARCH " + day;
    } else if ((splits[1] == "04")) {
      monthDay = "APRIL " + day;
    } else if ((splits[1] == "05")) {
      monthDay = "MAY " + day;
    } else if ((splits[1] == "06")) {
      monthDay = "JUNE " + day;
    } else if ((splits[1] == "07")) {
      monthDay = "JULY " + day;
    } else if ((splits[1] == "08")) {
      monthDay = "AUGUST " + day;
    } else if ((splits[1] == "09")) {
      monthDay = "SEPTEMBER " + day;
    } else if ((splits[1] == "10")) {
      monthDay = "OCTOBER " + day;
    } else if ((splits[1] == "11")) {
      monthDay = "NOVEMBER " + day;
    } else if ((splits[1] == "12")) {
      monthDay = "DECEMBER " + day;
    }
    return monthDay;
  }
}

