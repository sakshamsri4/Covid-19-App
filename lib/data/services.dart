import 'dart:convert';

import 'package:corona/data/data2.dart';
import 'package:flutter/material.dart';
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
    return Summary.fromJson(rest["summary"]);
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

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }

  Future<Summary> futureAlbum;

  @override
  void initState() {
    super.initState();
    futureAlbum = fetchNationalData();
  }


  FutureBuilder<Summary>(
  future: futureAlbum,
  builder: (context, snapshot) {
  if (snapshot.hasData) {
  print(snapshot.data.total.toString());
  return DataTwo(snapshot.data);
  // return Text('${snapshot.data}');
  } else if (snapshot.hasError) {
  return Text("${snapshot.error}");
  }

  // By default, show a loading spinner.
  return CircularProgressIndicator();
  },
  );


}