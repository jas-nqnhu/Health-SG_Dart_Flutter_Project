import 'dart:convert';

Hospital hospitalFromJson(String str) => Hospital.fromJson(json.decode(str));

String hospitalToJson(Hospital data) => json.encode(data.toJson());

class Hospital {
    Hospital({
        this.found,
        this.totalNumPages,
        this.pageNum,
        this.results,
    });

    int found;
    int totalNumPages;
    int pageNum;
    List<Result> results;

    factory Hospital.fromJson(Map<String, dynamic> json) => Hospital(
        found: json["found"],
        totalNumPages: json["totalNumPages"],
        pageNum: json["pageNum"],
        results: List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "found": found,
        "totalNumPages": totalNumPages,
        "pageNum": pageNum,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
    };
}

class Result {
    Result({
        this.searchval,
        this.x,
        this.y,
        this.latitude,
        this.longitude,
        this.longtitude,
    });

    String searchval;
    String x;
    String y;
    String latitude;
    String longitude;
    String longtitude;

    factory Result.fromJson(Map<String, dynamic> json) => Result(
        searchval: json["SEARCHVAL"],
        x: json["X"],
        y: json["Y"],
        latitude: json["LATITUDE"],
        longitude: json["LONGITUDE"],
        longtitude: json["LONGTITUDE"],
    );

    Map<String, dynamic> toJson() => {
        "SEARCHVAL": searchval,
        "X": x,
        "Y": y,
        "LATITUDE": latitude,
        "LONGITUDE": longitude,
        "LONGTITUDE": longtitude,
    };
}
