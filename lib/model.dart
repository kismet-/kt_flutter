// To parse this JSON data, do
//
//     final logs = logsFromJson(jsonString);

import 'dart:convert';

class JsonData {}

Logs logsFromJson(String str) {
  final jsonData = json.decode(str);
  return Logs.fromJson(jsonData);
}

String logsToJson(Logs data) {
  final dyn = data.toJson();
  return json.encode(dyn);
}

class Logs {
  String startDate;
  String endDate;
  LogsCount logsCount;

  Logs({
    this.startDate,
    this.endDate,
    this.logsCount,
  });

  factory Logs.fromJson(Map<String, dynamic> json) => new Logs(
        startDate: json["start_date"],
        endDate: json["end_date"],
        logsCount: LogsCount.fromJson(json["logs_count"]),
      );

  Map<String, dynamic> toJson() => {
        "start_date": startDate,
        "end_date": endDate,
        "logs_count": logsCount.toJson(),
      };
}

class LogsCount {
  num all;
  num compliant;
  int hos;
  int formAndManner;
  int missingDvirs;

  LogsCount({
    this.all,
    this.compliant,
    this.hos,
    this.formAndManner,
    this.missingDvirs,
  });

  factory LogsCount.fromJson(Map<String, dynamic> json) => new LogsCount(
        all: json["all"],
        compliant: json["compliant"],
        hos: json["hos"],
        formAndManner: json["form_and_manner"],
        missingDvirs: json["missing_dvirs"],
      );

  Map<String, dynamic> toJson() => {
        "all": all,
        "compliant": compliant,
        "hos": hos,
        "form_and_manner": formAndManner,
        "missing_dvirs": missingDvirs,
      };
}

Scorecard scorecardFromJson(String str) {
  final jsonData = json.decode(str);
  return Scorecard.fromJson(jsonData);
}

String scorecardToJson(Scorecard data) {
  final dyn = data.toJson();
  return json.encode(dyn);
}

class Scorecard {
  String startDate;
  String endDate;
  DriverPerformanceSummary driverPerformanceSummary;

  Scorecard({
    this.startDate,
    this.endDate,
    this.driverPerformanceSummary,
  });

  factory Scorecard.fromJson(Map<String, dynamic> json) => new Scorecard(
        startDate: json["start_date"],
        endDate: json["end_date"],
        driverPerformanceSummary: DriverPerformanceSummary.fromJson(
            json["driver_performance_summary"]),
      );

  Map<String, dynamic> toJson() => {
        "start_date": startDate,
        "end_date": endDate,
        "driver_performance_summary": driverPerformanceSummary.toJson(),
      };
}

class DriverPerformanceSummary {
  int numHardBrakes;
  int numHardAccels;
  int numHardCorners;
  int totalKilometers;
  double totalScore;
  int numCoachedEvents;
  int totalEvents;

  DriverPerformanceSummary({
    this.numHardBrakes,
    this.numHardAccels,
    this.numHardCorners,
    this.totalKilometers,
    this.totalScore,
    this.numCoachedEvents,
    this.totalEvents,
  });

  factory DriverPerformanceSummary.fromJson(Map<String, dynamic> json) =>
      new DriverPerformanceSummary(
        numHardBrakes: json["num_hard_brakes"],
        numHardAccels: json["num_hard_accels"],
        numHardCorners: json["num_hard_corners"],
        totalKilometers: json["total_kilometers"],
        totalScore: json["total_score"],
        numCoachedEvents: json["num_coached_events"],
        totalEvents: json["total_events"],
      );

  Map<String, dynamic> toJson() => {
        "num_hard_brakes": numHardBrakes,
        "num_hard_accels": numHardAccels,
        "num_hard_corners": numHardCorners,
        "total_kilometers": totalKilometers,
        "total_score": totalScore,
        "num_coached_events": numCoachedEvents,
        "total_events": totalEvents,
      };
}

ElDevents elDeventsFromJson(String str) {
  final jsonData = json.decode(str);
  return ElDevents.fromJson(jsonData);
}

String elDeventsToJson(ElDevents data) {
  final dyn = data.toJson();
  return json.encode(dyn);
}

class ElDevents {
  String startDate;
  String endDate;
  DrivingPeriodsCount drivingPeriodsCount;
  DrivingPeriodsDurations drivingPeriodsDurations;
  int eldDisconnectsCount;

  ElDevents({
    this.startDate,
    this.endDate,
    this.drivingPeriodsCount,
    this.drivingPeriodsDurations,
    this.eldDisconnectsCount,
  });

  factory ElDevents.fromJson(Map<String, dynamic> json) => new ElDevents(
        startDate: json["start_date"],
        endDate: json["end_date"],
        drivingPeriodsCount:
            DrivingPeriodsCount.fromJson(json["driving_periods_count"]),
        drivingPeriodsDurations:
            DrivingPeriodsDurations.fromJson(json["driving_periods_durations"]),
        eldDisconnectsCount: json["eld_disconnects_count"],
      );

  Map<String, dynamic> toJson() => {
        "start_date": startDate,
        "end_date": endDate,
        "driving_periods_count": drivingPeriodsCount.toJson(),
        "driving_periods_durations": drivingPeriodsDurations.toJson(),
        "eld_disconnects_count": eldDisconnectsCount,
      };
}

class DrivingPeriodsCount {
  int all;
  int unidentified;
  int interrupted;

  DrivingPeriodsCount({
    this.all,
    this.unidentified,
    this.interrupted,
  });

  factory DrivingPeriodsCount.fromJson(Map<String, dynamic> json) =>
      new DrivingPeriodsCount(
        all: json["all"],
        unidentified: json["unidentified"],
        interrupted: json["interrupted"],
      );

  Map<String, dynamic> toJson() => {
        "all": all,
        "unidentified": unidentified,
        "interrupted": interrupted,
      };
}

class DrivingPeriodsDurations {
  double identified;
  double unidentified;

  DrivingPeriodsDurations({
    this.identified,
    this.unidentified,
  });

  factory DrivingPeriodsDurations.fromJson(Map<String, dynamic> json) =>
      new DrivingPeriodsDurations(
        identified: json["identified"],
        unidentified: json["unidentified"],
      );

  Map<String, dynamic> toJson() => {
        "identified": identified,
        "unidentified": unidentified,
      };
}

Utilization utilizationFromJson(String str) {
  final jsonData = json.decode(str);
  return Utilization.fromJson(jsonData);
}

String utilizationToJson(Utilization data) {
  final dyn = data.toJson();
  return json.encode(dyn);
}

class Utilization {
  String startDate;
  String endDate;
  IdlingSummary idlingSummary;

  Utilization({
    this.startDate,
    this.endDate,
    this.idlingSummary,
  });

  factory Utilization.fromJson(Map<String, dynamic> json) => new Utilization(
        startDate: json["start_date"],
        endDate: json["end_date"],
        idlingSummary: IdlingSummary.fromJson(json["idling_summary"]),
      );

  Map<String, dynamic> toJson() => {
        "start_date": startDate,
        "end_date": endDate,
        "idling_summary": idlingSummary.toJson(),
      };
}

class IdlingSummary {
  int idleDuration;
  double idleFuel;
  int motionDuration;
  double motionFuel;
  String startDate;
  String endDate;

  IdlingSummary({
    this.idleDuration,
    this.idleFuel,
    this.motionDuration,
    this.motionFuel,
    this.startDate,
    this.endDate,
  });

  factory IdlingSummary.fromJson(Map<String, dynamic> json) =>
      new IdlingSummary(
        idleDuration: json["idle_duration"],
        idleFuel: json["idle_fuel"].toDouble(),
        motionDuration: json["motion_duration"],
        motionFuel: json["motion_fuel"].toDouble(),
        startDate: json["start_date"],
        endDate: json["end_date"],
      );

  Map<String, dynamic> toJson() => {
        "idle_duration": idleDuration,
        "idle_fuel": idleFuel,
        "motion_duration": motionDuration,
        "motion_fuel": motionFuel,
        "start_date": startDate,
        "end_date": endDate,
      };
}

Drivers driversFromJson(String str) {
  final jsonData = json.decode(str);
  return Drivers.fromJson(jsonData);
}

String driversToJson(Drivers data) {
  final dyn = data.toJson();
  return json.encode(dyn);
}

class Drivers {
  List<DriverLocationElement> driverLocations;
  DutyStatusCount dutyStatusCount;

  Drivers({
    this.driverLocations,
    this.dutyStatusCount,
  });

  factory Drivers.fromJson(Map<String, dynamic> json) => new Drivers(
        driverLocations: new List<DriverLocationElement>.from(
            json["driver_locations"]
                .map((x) => DriverLocationElement.fromJson(x))),
        dutyStatusCount: DutyStatusCount.fromJson(json["duty_status_count"]),
      );

  Map<String, dynamic> toJson() => {
        "driver_locations":
            new List<dynamic>.from(driverLocations.map((x) => x.toJson())),
        "duty_status_count": dutyStatusCount.toJson(),
      };
}

class DriverLocationElement {
  DriverLocationDriverLocation driverLocation;

  DriverLocationElement({
    this.driverLocation,
  });

  factory DriverLocationElement.fromJson(Map<String, dynamic> json) =>
      new DriverLocationElement(
        driverLocation:
            DriverLocationDriverLocation.fromJson(json["driver_location"]),
      );

  Map<String, dynamic> toJson() => {
        "driver_location": driverLocation.toJson(),
      };
}

class DriverLocationDriverLocation {
  int id;
  double lat;
  double lon;
  Driver driver;

  DriverLocationDriverLocation({
    this.id,
    this.lat,
    this.lon,
    this.driver,
  });

  factory DriverLocationDriverLocation.fromJson(Map<String, dynamic> json) =>
      new DriverLocationDriverLocation(
        id: json["id"],
        lat: json["lat"].toDouble(),
        lon: json["lon"].toDouble(),
        driver: Driver.fromJson(json["driver"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "lat": lat,
        "lon": lon,
        "driver": driver.toJson(),
      };
}

class Driver {
  int id;
  String firstName;
  String lastName;
  String currentLogState;

  Driver({
    this.id,
    this.firstName,
    this.lastName,
    this.currentLogState,
  });

  factory Driver.fromJson(Map<String, dynamic> json) => new Driver(
        id: json["id"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        currentLogState: json["current_log_state"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "first_name": firstName,
        "last_name": lastName,
        "current_log_state": currentLogState,
      };
}

class DutyStatusCount {
  int sleeper;
  int offDuty;
  int onDuty;
  int driving;
  int waiting;

  DutyStatusCount({
    this.sleeper,
    this.offDuty,
    this.onDuty,
    this.driving,
    this.waiting,
  });

  factory DutyStatusCount.fromJson(Map<String, dynamic> json) =>
      new DutyStatusCount(
        sleeper: json["sleeper"],
        offDuty: json["off_duty"],
        onDuty: json["on_duty"],
        driving: json["driving"],
        waiting: json["waiting"],
      );

  Map<String, dynamic> toJson() => {
        "sleeper": sleeper,
        "off_duty": offDuty,
        "on_duty": onDuty,
        "driving": driving,
        "waiting": waiting,
      };
}
