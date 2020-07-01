import 'dart:convert';

import 'package:http/http.dart' as http;

Future<Summary> fetchNationalData() async {
  final response =
      await http.get('https://api.rootnet.in/covid19-in/stats/latest');
  // print(response.body);
  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    var myData = json.decode(response.body);
    // print(myData);
    var rest = myData["data"];
    // print(rest);

    Summary ob = Summary.fromJson(rest["summary"]);
    // IndiaData.setIndiaData(
    //    ob.deaths, ob.discharged, ob.total - (ob.deaths + ob.discharged));
    // print(ob.deaths);
    // IndiaData.setIndiaData(ob.total, ob.deaths, ob.discharged,
    //   ob.total - (ob.deaths + ob.discharged));
    // IndiaData.getIndiaData();
    //List<int> abc = IndiaData.getIndiaData();

    return ob;
    // return Summary.fromJson(rest["summary"]);
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

class Summary {
  final int total;
  final int confirmedCasesIndian;
  final int confirmedCasesForeign;
  final int discharged;
  final int deaths;
  final int confirmedUnidentifiedLocation;

  Summary(
      {this.total,
      this.confirmedCasesIndian,
      this.confirmedCasesForeign,
      this.discharged,
      this.deaths,
      this.confirmedUnidentifiedLocation});

  factory Summary.fromJson(Map<String, dynamic> json) {
    return Summary(
      total: json["total"],
      confirmedCasesIndian: json["confirmedCasesIndian"],
      confirmedCasesForeign: json["confirmedCasesForeign"],
      discharged: json["discharged"],
      deaths: json["deaths"],
      confirmedUnidentifiedLocation: json["confirmedUnidentifiedLocation"],
    );
  }
}

Future<GlobalSummary> fetchGlobalData() async {
  final response = await http.get('https://api.covid19api.com/summary');
  // print(response.body);
  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    var myData = json.decode(response.body);
    // print(myData);
    var rest = myData["Global"];
    // print(rest);
    GlobalSummary ob = GlobalSummary.fromJson(myData["Global"]);
    /* GlobalData.setGlobalData(
        ob.totalConfirmed,
        ob.totalDeaths,
        ob.totalRecovered,
        ob.totalConfirmed - (ob.totalRecovered + ob.totalDeaths));*/
    //  List<int> abc = GlobalData.getGlobalData();
    //  print(abc[0]);
    // print(ob.totalConfirmed);
    //  print(ob.totalDeaths);

    // print(ob.totalRecovered);
    // print(ob.totalConfirmed - (ob.totalRecovered + ob.totalDeaths));
    return ob;
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

class GlobalSummary {
  final int newConfirmed;
  final int totalConfirmed;
  final int newDeaths;
  final int totalDeaths;
  final int newRecovered;
  final int totalRecovered;

  GlobalSummary(
      {this.newConfirmed,
      this.totalConfirmed,
      this.newDeaths,
      this.totalDeaths,
      this.newRecovered,
      this.totalRecovered});

  factory GlobalSummary.fromJson(Map<String, dynamic> json) {
    return GlobalSummary(
      newConfirmed: json["NewConfirmed"],
      totalConfirmed: json["TotalConfirmed"],
      newDeaths: json["NewDeaths"],
      totalDeaths: json["TotalDeaths"],
      newRecovered: json["NewRecovered"],
      totalRecovered: json["TotalRecovered"],
    );
  }
}

Future<List<Regional>> fetchRegionalData() async {
  List<Regional> list;
  final response = await http.get(
      'https://api.apify.com/v2/key-value-stores/toDWvRj1JpTXiM8FF/records/LATEST?disableRedirect=true');
  // print(response.body);
  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    var myData = json.decode(response.body);
    // print(myData);
    var rest = myData["regionData"] as List;
    // print(rest);
    list = rest.map<Regional>((json) => Regional.fromJson(json)).toList();
    return list;
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

class Regional {
  final int totalInfected;
  final int recovered;
  final int deceased;
  final String region;
  final int totalCases;

  Regional(
      {this.totalInfected,
      this.recovered,
      this.deceased,
      this.region,
      this.totalCases});
  factory Regional.fromJson(Map<String, dynamic> json) {
    return Regional(
      totalInfected: json["totalInfected"],
      recovered: json["recovered"],
      deceased: json["deceased"],
      region: json["region"],
      totalCases: json["totalCases"],
    );
  }
}
