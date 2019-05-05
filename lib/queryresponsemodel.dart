// To parse this JSON data, do
//
//     final logsQueryResponse = logsQueryResponseFromJson(jsonString);

import 'dart:convert';

LogsQueryResponse logsQueryResponseFromJson(String str) =>
    LogsQueryResponse.fromJson(json.decode(str));

String logsQueryResponseToJson(LogsQueryResponse data) =>
    json.encode(data.toJson());

class LogsQueryResponse {
  List<LogElement> logs;
  Pagination pagination;

  LogsQueryResponse({
    this.logs,
    this.pagination,
  });

  factory LogsQueryResponse.fromJson(Map<String, dynamic> json) =>
      new LogsQueryResponse(
        logs: new List<LogElement>.from(
            json["logs"].map((x) => LogElement.fromJson(x))),
        pagination: Pagination.fromJson(json["pagination"]),
      );

  Map<String, dynamic> toJson() => {
        "logs": new List<dynamic>.from(logs.map((x) => x.toJson())),
        "pagination": pagination.toJson(),
      };
}

class LogElement {
  LogLog log;

  LogElement({
    this.log,
  });

  factory LogElement.fromJson(Map<String, dynamic> json) => new LogElement(
        log: LogLog.fromJson(json["log"]),
      );

  Map<String, dynamic> toJson() => {
        "log": log.toJson(),
      };
}

class LogLog {
  int id;
  DateTime date;
  int totalMiles;
  bool metricUnits;
  DateTime driverSignedAt;
  String driverSignatureUrl;
  TimeZone timeZone;
  Cycle cycle;
  FirstName driverFirstName;
  LastName driverLastName;
  CarrierName carrierName;
  CarrierStreet carrierStreet;
  CarrierCity carrierCity;
  CarrierState carrierState;
  String carrierZip;
  String terminalStreet;
  String terminalCity;
  String terminalState;
  String terminalZip;
  String notes;
  String driverCompanyId;
  String origin;
  String destination;
  bool exception24HourRestart;
  bool exception8HourBreak;
  bool exceptionWaitTime;
  bool exceptionShortHaul;
  bool shortHaul;
  EldMode eldMode;
  List<dynamic> coDriverFullNames;
  String trailerNumbers;
  VehicleNumbers vehicleNumbers;
  Driver driver;
  List<VehicleElement> vehicles;
  List<CoDriver> coDrivers;
  List<dynamic> remarks;
  List<CycleRestartElement> cycleRestarts;
  List<InspectionReportElement> inspectionReports;
  Odometers odometers;
  int offDutyDuration;
  int onDutyDuration;
  int sleeperDuration;
  int drivingDuration;
  int waitingDuration;
  ShippingDocs shippingDocs;
  List<String> formAndMannerErrors;
  List<dynamic> hosViolations;
  List<EventElement> events;

  LogLog({
    this.id,
    this.date,
    this.totalMiles,
    this.metricUnits,
    this.driverSignedAt,
    this.driverSignatureUrl,
    this.timeZone,
    this.cycle,
    this.driverFirstName,
    this.driverLastName,
    this.carrierName,
    this.carrierStreet,
    this.carrierCity,
    this.carrierState,
    this.carrierZip,
    this.terminalStreet,
    this.terminalCity,
    this.terminalState,
    this.terminalZip,
    this.notes,
    this.driverCompanyId,
    this.origin,
    this.destination,
    this.exception24HourRestart,
    this.exception8HourBreak,
    this.exceptionWaitTime,
    this.exceptionShortHaul,
    this.shortHaul,
    this.eldMode,
    this.coDriverFullNames,
    this.trailerNumbers,
    this.vehicleNumbers,
    this.driver,
    this.vehicles,
    this.coDrivers,
    this.remarks,
    this.cycleRestarts,
    this.inspectionReports,
    this.odometers,
    this.offDutyDuration,
    this.onDutyDuration,
    this.sleeperDuration,
    this.drivingDuration,
    this.waitingDuration,
    this.shippingDocs,
    this.formAndMannerErrors,
    this.hosViolations,
    this.events,
  });

  factory LogLog.fromJson(Map<String, dynamic> json) => new LogLog(
        id: json["id"],
        date: DateTime.parse(json["date"]),
        totalMiles: json["total_miles"] == null ? null : json["total_miles"],
        metricUnits: json["metric_units"],
        driverSignedAt: json["driver_signed_at"] == null
            ? null
            : DateTime.parse(json["driver_signed_at"]),
        driverSignatureUrl: json["driver_signature_url"] == null
            ? null
            : json["driver_signature_url"],
        timeZone: timeZoneValues.map[json["time_zone"]],
        cycle: cycleValues.map[json["cycle"]],
        driverFirstName: firstNameValues.map[json["driver_first_name"]],
        driverLastName: lastNameValues.map[json["driver_last_name"]],
        carrierName: carrierNameValues.map[json["carrier_name"]],
        carrierStreet: carrierStreetValues.map[json["carrier_street"]],
        carrierCity: carrierCityValues.map[json["carrier_city"]],
        carrierState: carrierStateValues.map[json["carrier_state"]],
        carrierZip: json["carrier_zip"],
        terminalStreet: json["terminal_street"],
        terminalCity: json["terminal_city"],
        terminalState: json["terminal_state"],
        terminalZip: json["terminal_zip"],
        notes: json["notes"] == null ? null : json["notes"],
        driverCompanyId: json["driver_company_id"],
        origin: json["origin"] == null ? null : json["origin"],
        destination: json["destination"] == null ? null : json["destination"],
        exception24HourRestart: json["exception_24_hour_restart"],
        exception8HourBreak: json["exception_8_hour_break"],
        exceptionWaitTime: json["exception_wait_time"],
        exceptionShortHaul: json["exception_short_haul"],
        shortHaul: json["short_haul"],
        eldMode: eldModeValues.map[json["eld_mode"]],
        coDriverFullNames:
            new List<dynamic>.from(json["co_driver_full_names"].map((x) => x)),
        trailerNumbers: json["trailer_numbers"],
        vehicleNumbers: vehicleNumbersValues.map[json["vehicle_numbers"]],
        driver: Driver.fromJson(json["driver"]),
        vehicles: new List<VehicleElement>.from(
            json["vehicles"].map((x) => VehicleElement.fromJson(x))),
        coDrivers: new List<CoDriver>.from(
            json["co_drivers"].map((x) => CoDriver.fromJson(x))),
        remarks: new List<dynamic>.from(json["remarks"].map((x) => x)),
        cycleRestarts: new List<CycleRestartElement>.from(
            json["cycle_restarts"].map((x) => CycleRestartElement.fromJson(x))),
        inspectionReports: new List<InspectionReportElement>.from(
            json["inspection_reports"]
                .map((x) => InspectionReportElement.fromJson(x))),
        odometers: Odometers.fromJson(json["odometers"]),
        offDutyDuration: json["off_duty_duration"],
        onDutyDuration: json["on_duty_duration"],
        sleeperDuration: json["sleeper_duration"],
        drivingDuration: json["driving_duration"],
        waitingDuration: json["waiting_duration"],
        shippingDocs: shippingDocsValues.map[json["shipping_docs"]],
        formAndMannerErrors:
            new List<String>.from(json["form_and_manner_errors"].map((x) => x)),
        hosViolations:
            new List<dynamic>.from(json["hos_violations"].map((x) => x)),
        events: new List<EventElement>.from(
            json["events"].map((x) => EventElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "date":
            "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        "total_miles": totalMiles == null ? null : totalMiles,
        "metric_units": metricUnits,
        "driver_signed_at":
            driverSignedAt == null ? null : driverSignedAt.toIso8601String(),
        "driver_signature_url":
            driverSignatureUrl == null ? null : driverSignatureUrl,
        "time_zone": timeZoneValues.reverse[timeZone],
        "cycle": cycleValues.reverse[cycle],
        "driver_first_name": firstNameValues.reverse[driverFirstName],
        "driver_last_name": lastNameValues.reverse[driverLastName],
        "carrier_name": carrierNameValues.reverse[carrierName],
        "carrier_street": carrierStreetValues.reverse[carrierStreet],
        "carrier_city": carrierCityValues.reverse[carrierCity],
        "carrier_state": carrierStateValues.reverse[carrierState],
        "carrier_zip": carrierZip,
        "terminal_street": terminalStreet,
        "terminal_city": terminalCity,
        "terminal_state": terminalState,
        "terminal_zip": terminalZip,
        "notes": notes == null ? null : notes,
        "driver_company_id": driverCompanyId,
        "origin": origin == null ? null : origin,
        "destination": destination == null ? null : destination,
        "exception_24_hour_restart": exception24HourRestart,
        "exception_8_hour_break": exception8HourBreak,
        "exception_wait_time": exceptionWaitTime,
        "exception_short_haul": exceptionShortHaul,
        "short_haul": shortHaul,
        "eld_mode": eldModeValues.reverse[eldMode],
        "co_driver_full_names":
            new List<dynamic>.from(coDriverFullNames.map((x) => x)),
        "trailer_numbers": trailerNumbers,
        "vehicle_numbers": vehicleNumbersValues.reverse[vehicleNumbers],
        "driver": driver.toJson(),
        "vehicles": new List<dynamic>.from(vehicles.map((x) => x.toJson())),
        "co_drivers": new List<dynamic>.from(coDrivers.map((x) => x.toJson())),
        "remarks": new List<dynamic>.from(remarks.map((x) => x)),
        "cycle_restarts":
            new List<dynamic>.from(cycleRestarts.map((x) => x.toJson())),
        "inspection_reports":
            new List<dynamic>.from(inspectionReports.map((x) => x.toJson())),
        "odometers": odometers.toJson(),
        "off_duty_duration": offDutyDuration,
        "on_duty_duration": onDutyDuration,
        "sleeper_duration": sleeperDuration,
        "driving_duration": drivingDuration,
        "waiting_duration": waitingDuration,
        "shipping_docs": shippingDocsValues.reverse[shippingDocs],
        "form_and_manner_errors":
            new List<dynamic>.from(formAndMannerErrors.map((x) => x)),
        "hos_violations": new List<dynamic>.from(hosViolations.map((x) => x)),
        "events": new List<dynamic>.from(events.map((x) => x.toJson())),
      };
}

enum CarrierCity { STONE_MOUNTAIN, LITHONIA }

final carrierCityValues = new EnumValues({
  "LITHONIA": CarrierCity.LITHONIA,
  "STONE MOUNTAIN": CarrierCity.STONE_MOUNTAIN
});

enum CarrierName { BAROS_LOGISTICS_LLC }

final carrierNameValues =
    new EnumValues({"BAROS LOGISTICS LLC": CarrierName.BAROS_LOGISTICS_LLC});

enum CarrierState { GA }

final carrierStateValues = new EnumValues({"GA": CarrierState.GA});

enum CarrierStreet { THE_609_GRANITE_TRACE, THE_4519_RED_TAIL_DR }

final carrierStreetValues = new EnumValues({
  "4519 RED TAIL DR": CarrierStreet.THE_4519_RED_TAIL_DR,
  "609 GRANITE TRACE": CarrierStreet.THE_609_GRANITE_TRACE
});

class CoDriver {
  Driver coDriver;

  CoDriver({
    this.coDriver,
  });

  factory CoDriver.fromJson(Map<String, dynamic> json) => new CoDriver(
        coDriver: Driver.fromJson(json["co_driver"]),
      );

  Map<String, dynamic> toJson() => {
        "co_driver": coDriver.toJson(),
      };
}

class Driver {
  int id;
  String firstName;
  String lastName;
  dynamic username;
  Email email;
  DriverCompanyId driverCompanyId;
  DriverStatus status;
  Role role;

  Driver({
    this.id,
    this.firstName,
    this.lastName,
    this.username,
    this.email,
    this.driverCompanyId,
    this.status,
    this.role,
  });

  factory Driver.fromJson(Map<String, dynamic> json) => new Driver(
        id: json["id"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        username: json["username"],
        email: json["email"] == null ? null : emailValues.map[json["email"]],
        driverCompanyId: driverCompanyIdValues.map[json["driver_company_id"]],
        status: driverStatusValues.map[json["status"]],
        role: roleValues.map[json["role"]],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "first_name": firstNameValues.reverse[firstName],
        "last_name": lastNameValues.reverse[lastName],
        "username": username,
        "email": email == null ? null : emailValues.reverse[email],
        "driver_company_id": driverCompanyIdValues.reverse[driverCompanyId],
        "status": driverStatusValues.reverse[status],
        "role": roleValues.reverse[role],
      };
}

enum DriverCompanyId { BLANKENSHIP, EMPTY }

final driverCompanyIdValues = new EnumValues(
    {"Blankenship": DriverCompanyId.BLANKENSHIP, "": DriverCompanyId.EMPTY});

enum Email {
  KYELE08_GMAIL_COM,
  MAJORTRUCKINGLLC_GMAIL_COM,
  BLANKENSHIPS434_GMAIL_COM
}

final emailValues = new EnumValues({
  "blankenships434@gmail.com": Email.BLANKENSHIPS434_GMAIL_COM,
  "kyele08@gmail.com": Email.KYELE08_GMAIL_COM,
  "majortruckingllc@gmail.com": Email.MAJORTRUCKINGLLC_GMAIL_COM
});

enum FirstName { SCOTTIE, RONALD, DWAYNE, SCOTT }

final firstNameValues = new EnumValues({
  "Dwayne": FirstName.DWAYNE,
  "Ronald": FirstName.RONALD,
  "Scott": FirstName.SCOTT,
  "Scottie": FirstName.SCOTTIE
});

enum LastName { BLANKENSHIP, JOHNSON, COLLINS }

final lastNameValues = new EnumValues({
  "Blankenship": LastName.BLANKENSHIP,
  "Collins": LastName.COLLINS,
  "Johnson": LastName.JOHNSON
});

enum Role { DRIVER }

final roleValues = new EnumValues({"driver": Role.DRIVER});

enum DriverStatus { DEACTIVATED, ACTIVE }

final driverStatusValues = new EnumValues(
    {"active": DriverStatus.ACTIVE, "deactivated": DriverStatus.DEACTIVATED});

enum Cycle { THE_708 }

final cycleValues = new EnumValues({"70_8": Cycle.THE_708});

class CycleRestartElement {
  CycleRestartCycleRestart cycleRestart;

  CycleRestartElement({
    this.cycleRestart,
  });

  factory CycleRestartElement.fromJson(Map<String, dynamic> json) =>
      new CycleRestartElement(
        cycleRestart: CycleRestartCycleRestart.fromJson(json["cycle_restart"]),
      );

  Map<String, dynamic> toJson() => {
        "cycle_restart": cycleRestart.toJson(),
      };
}

class CycleRestartCycleRestart {
  int id;
  DateTime startTime;
  DateTime endTime;
  String type;
  String name;

  CycleRestartCycleRestart({
    this.id,
    this.startTime,
    this.endTime,
    this.type,
    this.name,
  });

  factory CycleRestartCycleRestart.fromJson(Map<String, dynamic> json) =>
      new CycleRestartCycleRestart(
        id: json["id"],
        startTime: DateTime.parse(json["start_time"]),
        endTime: DateTime.parse(json["end_time"]),
        type: json["type"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "start_time": startTime.toIso8601String(),
        "end_time": endTime.toIso8601String(),
        "type": type,
        "name": name,
      };
}

enum EldMode { LOGS }

final eldModeValues = new EnumValues({"logs": EldMode.LOGS});

class EventElement {
  EventEvent event;

  EventElement({
    this.event,
  });

  factory EventElement.fromJson(Map<String, dynamic> json) => new EventElement(
        event: EventEvent.fromJson(json["event"]),
      );

  Map<String, dynamic> toJson() => {
        "event": event.toJson(),
      };
}

class EventEvent {
  int id;
  Type type;
  String notes;
  String location;
  SdsType sdsType;
  DateTime startTime;
  DateTime endTime;

  EventEvent({
    this.id,
    this.type,
    this.notes,
    this.location,
    this.sdsType,
    this.startTime,
    this.endTime,
  });

  factory EventEvent.fromJson(Map<String, dynamic> json) => new EventEvent(
        id: json["id"],
        type: typeValues.map[json["type"]],
        notes: json["notes"] == null ? null : json["notes"],
        location: json["location"] == null ? null : json["location"],
        sdsType: json["sds_type"] == null
            ? null
            : sdsTypeValues.map[json["sds_type"]],
        startTime: DateTime.parse(json["start_time"]),
        endTime:
            json["end_time"] == null ? null : DateTime.parse(json["end_time"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "type": typeValues.reverse[type],
        "notes": notes == null ? null : notes,
        "location": location == null ? null : location,
        "sds_type": sdsType == null ? null : sdsTypeValues.reverse[sdsType],
        "start_time": startTime.toIso8601String(),
        "end_time": endTime == null ? null : endTime.toIso8601String(),
      };
}

enum SdsType { PC, YM }

final sdsTypeValues = new EnumValues({"pc": SdsType.PC, "ym": SdsType.YM});

enum Type { DRIVING, OFF_DUTY, ON_DUTY, SLEEPER }

final typeValues = new EnumValues({
  "driving": Type.DRIVING,
  "off_duty": Type.OFF_DUTY,
  "on_duty": Type.ON_DUTY,
  "sleeper": Type.SLEEPER
});

class InspectionReportElement {
  InspectionReportInspectionReport inspectionReport;

  InspectionReportElement({
    this.inspectionReport,
  });

  factory InspectionReportElement.fromJson(Map<String, dynamic> json) =>
      new InspectionReportElement(
        inspectionReport: InspectionReportInspectionReport.fromJson(
            json["inspection_report"]),
      );

  Map<String, dynamic> toJson() => {
        "inspection_report": inspectionReport.toJson(),
      };
}

class InspectionReportInspectionReport {
  int id;
  DateTime date;
  DateTime time;
  int odometer;
  CarrierName carrierName;
  VehicleNumbers vehicleNumber;
  List<String> trailerNums;
  String location;
  dynamic city;
  dynamic state;
  InspectionReportStatus status;
  dynamic mechanicSignedAt;
  dynamic mechanicSignatureUrl;
  DateTime driverSignedAt;
  String driverSignatureUrl;
  dynamic reviewerSignedAt;
  dynamic reviewerSignatureUrl;
  List<dynamic> defects;
  InspectionReportVehicle vehicle;
  dynamic mechanic;
  Driver driver;
  dynamic reviewer;

  InspectionReportInspectionReport({
    this.id,
    this.date,
    this.time,
    this.odometer,
    this.carrierName,
    this.vehicleNumber,
    this.trailerNums,
    this.location,
    this.city,
    this.state,
    this.status,
    this.mechanicSignedAt,
    this.mechanicSignatureUrl,
    this.driverSignedAt,
    this.driverSignatureUrl,
    this.reviewerSignedAt,
    this.reviewerSignatureUrl,
    this.defects,
    this.vehicle,
    this.mechanic,
    this.driver,
    this.reviewer,
  });

  factory InspectionReportInspectionReport.fromJson(
          Map<String, dynamic> json) =>
      new InspectionReportInspectionReport(
        id: json["id"],
        date: DateTime.parse(json["date"]),
        time: DateTime.parse(json["time"]),
        odometer: json["odometer"] == null ? null : json["odometer"],
        carrierName: carrierNameValues.map[json["carrier_name"]],
        vehicleNumber: vehicleNumbersValues.map[json["vehicle_number"]],
        trailerNums: new List<String>.from(json["trailer_nums"].map((x) => x)),
        location: json["location"] == null ? null : json["location"],
        city: json["city"],
        state: json["state"],
        status: inspectionReportStatusValues.map[json["status"]],
        mechanicSignedAt: json["mechanic_signed_at"],
        mechanicSignatureUrl: json["mechanic_signature_url"],
        driverSignedAt: DateTime.parse(json["driver_signed_at"]),
        driverSignatureUrl: json["driver_signature_url"],
        reviewerSignedAt: json["reviewer_signed_at"],
        reviewerSignatureUrl: json["reviewer_signature_url"],
        defects: new List<dynamic>.from(json["defects"].map((x) => x)),
        vehicle: InspectionReportVehicle.fromJson(json["vehicle"]),
        mechanic: json["mechanic"],
        driver: Driver.fromJson(json["driver"]),
        reviewer: json["reviewer"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "date":
            "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        "time": time.toIso8601String(),
        "odometer": odometer == null ? null : odometer,
        "carrier_name": carrierNameValues.reverse[carrierName],
        "vehicle_number": vehicleNumbersValues.reverse[vehicleNumber],
        "trailer_nums": new List<dynamic>.from(trailerNums.map((x) => x)),
        "location": location == null ? null : location,
        "city": city,
        "state": state,
        "status": inspectionReportStatusValues.reverse[status],
        "mechanic_signed_at": mechanicSignedAt,
        "mechanic_signature_url": mechanicSignatureUrl,
        "driver_signed_at": driverSignedAt.toIso8601String(),
        "driver_signature_url": driverSignatureUrl,
        "reviewer_signed_at": reviewerSignedAt,
        "reviewer_signature_url": reviewerSignatureUrl,
        "defects": new List<dynamic>.from(defects.map((x) => x)),
        "vehicle": vehicle.toJson(),
        "mechanic": mechanic,
        "driver": driver.toJson(),
        "reviewer": reviewer,
      };
}

enum InspectionReportStatus { SATISFACTORY }

final inspectionReportStatusValues =
    new EnumValues({"satisfactory": InspectionReportStatus.SATISFACTORY});

class InspectionReportVehicle {
  int id;
  VehicleNumbers number;
  String year;
  Make make;
  Model model;
  Vin vin;
  bool metricUnits;

  InspectionReportVehicle({
    this.id,
    this.number,
    this.year,
    this.make,
    this.model,
    this.vin,
    this.metricUnits,
  });

  factory InspectionReportVehicle.fromJson(Map<String, dynamic> json) =>
      new InspectionReportVehicle(
        id: json["id"],
        number: vehicleNumbersValues.map[json["number"]],
        year: json["year"],
        make: makeValues.map[json["make"]],
        model: modelValues.map[json["model"]],
        vin: vinValues.map[json["vin"]],
        metricUnits: json["metric_units"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "number": vehicleNumbersValues.reverse[number],
        "year": year,
        "make": makeValues.reverse[make],
        "model": modelValues.reverse[model],
        "vin": vinValues.reverse[vin],
        "metric_units": metricUnits,
      };
}

enum Make { KENWORTH, FREIGHTLINER }

final makeValues = new EnumValues(
    {"Freightliner": Make.FREIGHTLINER, "Kenworth": Make.KENWORTH});

enum Model { T2000, CENTURY, COLUMBIA }

final modelValues = new EnumValues({
  "Century": Model.CENTURY,
  "Columbia": Model.COLUMBIA,
  "T2000": Model.T2000
});

enum VehicleNumbers { THE_04, THE_1986_C, THE_1986_A }

final vehicleNumbersValues = new EnumValues({
  "04": VehicleNumbers.THE_04,
  "1986A": VehicleNumbers.THE_1986_A,
  "1986C": VehicleNumbers.THE_1986_C
});

enum Vin {
  THE_1_XKTDU9_X41_J876031,
  THE_1_FUJA6_CK26_LW71719,
  THE_1_FUJA6_CK87_LY89052
}

final vinValues = new EnumValues({
  "1FUJA6CK26LW71719": Vin.THE_1_FUJA6_CK26_LW71719,
  "1FUJA6CK87LY89052": Vin.THE_1_FUJA6_CK87_LY89052,
  "1xktdu9x41j876031": Vin.THE_1_XKTDU9_X41_J876031
});

class Odometers {
  List<The04> the1986A;
  List<The04> the04;
  List<The04> the1986C;

  Odometers({
    this.the1986A,
    this.the04,
    this.the1986C,
  });

  factory Odometers.fromJson(Map<String, dynamic> json) => new Odometers(
        the1986A: json["1986A"] == null
            ? null
            : new List<The04>.from(json["1986A"].map((x) => The04.fromJson(x))),
        the04: json["04"] == null
            ? null
            : new List<The04>.from(json["04"].map((x) => The04.fromJson(x))),
        the1986C: json["1986C"] == null
            ? null
            : new List<The04>.from(json["1986C"].map((x) => The04.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "1986A": the1986A == null
            ? null
            : new List<dynamic>.from(the1986A.map((x) => x.toJson())),
        "04": the04 == null
            ? null
            : new List<dynamic>.from(the04.map((x) => x.toJson())),
        "1986C": the1986C == null
            ? null
            : new List<dynamic>.from(the1986C.map((x) => x.toJson())),
      };
}

class The04 {
  int end;
  int start;
  bool metricUnits;

  The04({
    this.end,
    this.start,
    this.metricUnits,
  });

  factory The04.fromJson(Map<String, dynamic> json) => new The04(
        end: json["end"],
        start: json["start"],
        metricUnits: json["metric_units"],
      );

  Map<String, dynamic> toJson() => {
        "end": end,
        "start": start,
        "metric_units": metricUnits,
      };
}

enum ShippingDocs { FLOWERS, EMPTY, NONE }

final shippingDocsValues = new EnumValues({
  "": ShippingDocs.EMPTY,
  "Flowers": ShippingDocs.FLOWERS,
  "None": ShippingDocs.NONE
});

enum TimeZone { EASTERN_TIME_US_CANADA }

final timeZoneValues = new EnumValues(
    {"Eastern Time (US & Canada)": TimeZone.EASTERN_TIME_US_CANADA});

class VehicleElement {
  InspectionReportVehicle vehicle;

  VehicleElement({
    this.vehicle,
  });

  factory VehicleElement.fromJson(Map<String, dynamic> json) =>
      new VehicleElement(
        vehicle: InspectionReportVehicle.fromJson(json["vehicle"]),
      );

  Map<String, dynamic> toJson() => {
        "vehicle": vehicle.toJson(),
      };
}

class Pagination {
  int perPage;
  int pageNo;
  int total;

  Pagination({
    this.perPage,
    this.pageNo,
    this.total,
  });

  factory Pagination.fromJson(Map<String, dynamic> json) => new Pagination(
        perPage: json["per_page"],
        pageNo: json["page_no"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "per_page": perPage,
        "page_no": pageNo,
        "total": total,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
