// To parse this JSON data, do
//
//     final eldQueryResponse = eldQueryResponseFromJson(jsonString);

import 'dart:convert';

EldQueryResponse eldQueryResponseFromJson(String str) =>
    EldQueryResponse.fromJson(json.decode(str));

String eldQueryResponseToJson(EldQueryResponse data) =>
    json.encode(data.toJson());

class EldQueryResponse {
  List<DrivingPeriodElement> drivingPeriods;
  int perPage;
  int pageNo;
  int total;

  EldQueryResponse({
    this.drivingPeriods,
    this.perPage,
    this.pageNo,
    this.total,
  });

  factory EldQueryResponse.fromJson(Map<String, dynamic> json) =>
      new EldQueryResponse(
        drivingPeriods: new List<DrivingPeriodElement>.from(
            json["driving_periods"]
                .map((x) => DrivingPeriodElement.fromJson(x))),
        perPage: json["per_page"],
        pageNo: json["page_no"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "driving_periods":
            new List<dynamic>.from(drivingPeriods.map((x) => x.toJson())),
        "per_page": perPage,
        "page_no": pageNo,
        "total": total,
      };
}

class DrivingPeriodElement {
  DrivingPeriodDrivingPeriod drivingPeriod;

  DrivingPeriodElement({
    this.drivingPeriod,
  });

  factory DrivingPeriodElement.fromJson(Map<String, dynamic> json) =>
      new DrivingPeriodElement(
        drivingPeriod:
            DrivingPeriodDrivingPeriod.fromJson(json["driving_period"]),
      );

  Map<String, dynamic> toJson() => {
        "driving_period": drivingPeriod.toJson(),
      };
}

class DrivingPeriodDrivingPeriod {
  int id;
  DateTime startTime;
  DateTime endTime;
  double distance;
  Status status;
  Type type;
  Notes notes;
  Vehicle vehicle;
  Driver driver;
  dynamic dispatcher;
  String startDescription;
  ChangedAttributes changedAttributes;

  DrivingPeriodDrivingPeriod({
    this.id,
    this.startTime,
    this.endTime,
    this.distance,
    this.status,
    this.type,
    this.notes,
    this.vehicle,
    this.driver,
    this.dispatcher,
    this.startDescription,
    this.changedAttributes,
  });

  factory DrivingPeriodDrivingPeriod.fromJson(Map<String, dynamic> json) =>
      new DrivingPeriodDrivingPeriod(
        id: json["id"],
        startTime: DateTime.parse(json["start_time"]),
        endTime:
            json["end_time"] == null ? null : DateTime.parse(json["end_time"]),
        distance: json["distance"] == null ? null : json["distance"].toDouble(),
        status: statusValues.map[json["status"]],
        type: typeValues.map[json["type"]],
        notes: json["notes"] == null ? null : notesValues.map[json["notes"]],
        vehicle: Vehicle.fromJson(json["vehicle"]),
        driver: json["driver"] == null ? null : Driver.fromJson(json["driver"]),
        dispatcher: json["dispatcher"],
        startDescription: json["start_description"],
        changedAttributes:
            ChangedAttributes.fromJson(json["changed_attributes"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "start_time": startTime.toIso8601String(),
        "end_time": endTime == null ? null : endTime.toIso8601String(),
        "distance": distance == null ? null : distance,
        "status": statusValues.reverse[status],
        "type": typeValues.reverse[type],
        "notes": notes == null ? null : notesValues.reverse[notes],
        "vehicle": vehicle.toJson(),
        "driver": driver == null ? null : driver.toJson(),
        "dispatcher": dispatcher,
        "start_description": startDescription,
        "changed_attributes": changedAttributes.toJson(),
      };
}

class ChangedAttributes {
  ChangedAttributes();

  factory ChangedAttributes.fromJson(Map<String, dynamic> json) =>
      new ChangedAttributes();

  Map<String, dynamic> toJson() => {};
}

class Driver {
  int id;
  FirstName firstName;
  LastName lastName;
  List<int> groupIds;
  String driverCompanyId;

  Driver({
    this.id,
    this.firstName,
    this.lastName,
    this.groupIds,
    this.driverCompanyId,
  });

  factory Driver.fromJson(Map<String, dynamic> json) => new Driver(
        id: json["id"],
        firstName: firstNameValues.map[json["first_name"]],
        lastName: lastNameValues.map[json["last_name"]],
        groupIds: new List<int>.from(json["group_ids"].map((x) => x)),
        driverCompanyId: json["driver_company_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "first_name": firstNameValues.reverse[firstName],
        "last_name": lastNameValues.reverse[lastName],
        "group_ids": new List<dynamic>.from(groupIds.map((x) => x)),
        "driver_company_id": driverCompanyId,
      };
}

enum FirstName { SCOTT, RONALD, DWAYNE }

final firstNameValues = new EnumValues({
  "Dwayne": FirstName.DWAYNE,
  "Ronald": FirstName.RONALD,
  "Scott": FirstName.SCOTT
});

enum LastName { BLANKENSHIP, JOHNSON, COLLINS }

final lastNameValues = new EnumValues({
  "Blankenship": LastName.BLANKENSHIP,
  "Collins": LastName.COLLINS,
  "Johnson": LastName.JOHNSON
});

enum Notes { EMPTY, UNLOAD, DROP_OFF }

final notesValues = new EnumValues(
    {"Drop-off": Notes.DROP_OFF, "": Notes.EMPTY, "Unload": Notes.UNLOAD});

enum Status { IN_PROGRESS, COMPLETE }

final statusValues = new EnumValues(
    {"complete": Status.COMPLETE, "in_progress": Status.IN_PROGRESS});

enum Type { DRIVING, PC, YM }

final typeValues =
    new EnumValues({"driving": Type.DRIVING, "pc": Type.PC, "ym": Type.YM});

class Vehicle {
  int id;
  Number number;
  bool metricUnits;
  List<int> groupIds;

  Vehicle({
    this.id,
    this.number,
    this.metricUnits,
    this.groupIds,
  });

  factory Vehicle.fromJson(Map<String, dynamic> json) => new Vehicle(
        id: json["id"],
        number: numberValues.map[json["number"]],
        metricUnits: json["metric_units"],
        groupIds: new List<int>.from(json["group_ids"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "number": numberValues.reverse[number],
        "metric_units": metricUnits,
        "group_ids": new List<dynamic>.from(groupIds.map((x) => x)),
      };
}

enum Number { THE_1986_C, THE_1986_A, THE_04 }

final numberValues = new EnumValues({
  "04": Number.THE_04,
  "1986A": Number.THE_1986_A,
  "1986C": Number.THE_1986_C
});

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
