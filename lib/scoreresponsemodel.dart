import 'dart:convert';

ScoreQueryResponse scoreQueryResponseFromJson(String str) =>
    ScoreQueryResponse.fromJson(json.decode(str));

String scoreQueryResponseToJson(ScoreQueryResponse data) =>
    json.encode(data.toJson());

class ScoreQueryResponse {
  List<DriverPerformanceSummaryElement> driverPerformanceSummaries;
  int perPage;
  int pageNo;
  int total;

  ScoreQueryResponse({
    this.driverPerformanceSummaries,
    this.perPage,
    this.pageNo,
    this.total,
  });

  factory ScoreQueryResponse.fromJson(Map<String, dynamic> json) =>
      new ScoreQueryResponse(
        driverPerformanceSummaries:
            new List<DriverPerformanceSummaryElement>.from(
                json["driver_performance_summaries"]
                    .map((x) => DriverPerformanceSummaryElement.fromJson(x))),
        perPage: json["per_page"],
        pageNo: json["page_no"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "driver_performance_summaries": new List<dynamic>.from(
            driverPerformanceSummaries.map((x) => x.toJson())),
        "per_page": perPage,
        "page_no": pageNo,
        "total": total,
      };
}

class DriverPerformanceSummaryElement {
  DriverPerformanceSummaryDriverPerformanceSummary driverPerformanceSummary;

  DriverPerformanceSummaryElement({
    this.driverPerformanceSummary,
  });

  factory DriverPerformanceSummaryElement.fromJson(Map<String, dynamic> json) =>
      new DriverPerformanceSummaryElement(
        driverPerformanceSummary:
            DriverPerformanceSummaryDriverPerformanceSummary.fromJson(
                json["driver_performance_summary"]),
      );

  Map<String, dynamic> toJson() => {
        "driver_performance_summary": driverPerformanceSummary.toJson(),
      };
}

class DriverPerformanceSummaryDriverPerformanceSummary {
  int numHardBrakes;
  int numHardAccels;
  int numHardCorners;
  int totalKilometers;
  int numCoachedEvents;
  double score;
  Driver driver;

  DriverPerformanceSummaryDriverPerformanceSummary({
    this.numHardBrakes,
    this.numHardAccels,
    this.numHardCorners,
    this.totalKilometers,
    this.numCoachedEvents,
    this.score,
    this.driver,
  });

  factory DriverPerformanceSummaryDriverPerformanceSummary.fromJson(
          Map<String, dynamic> json) =>
      new DriverPerformanceSummaryDriverPerformanceSummary(
        numHardBrakes: json["num_hard_brakes"],
        numHardAccels: json["num_hard_accels"],
        numHardCorners: json["num_hard_corners"],
        totalKilometers: json["total_kilometers"],
        numCoachedEvents: json["num_coached_events"],
        score: json["score"],
        driver: Driver.fromJson(json["driver"]),
      );

  Map<String, dynamic> toJson() => {
        "num_hard_brakes": numHardBrakes,
        "num_hard_accels": numHardAccels,
        "num_hard_corners": numHardCorners,
        "total_kilometers": totalKilometers,
        "num_coached_events": numCoachedEvents,
        "score": score,
        "driver": driver.toJson(),
      };
}

class Driver {
  int id;
  String fullName;
  String email;
  dynamic deactivatedAt;
  String driverCompanyId;

  Driver({
    this.id,
    this.fullName,
    this.email,
    this.deactivatedAt,
    this.driverCompanyId,
  });

  factory Driver.fromJson(Map<String, dynamic> json) => new Driver(
        id: json["id"],
        fullName: json["full_name"],
        email: json["email"],
        deactivatedAt: json["deactivated_at"],
        driverCompanyId: json["driver_company_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "full_name": fullName,
        "email": email,
        "deactivated_at": deactivatedAt,
        "driver_company_id": driverCompanyId,
      };
}
