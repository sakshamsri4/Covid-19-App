import 'dart:async';
import 'dart:convert';

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

class NetworkData extends StatefulWidget {
  NetworkData({Key key}) : super(key: key);

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<NetworkData> {
  Future<Summary> futureAlbum;

  @override
  void initState() {
    super.initState();
    futureAlbum = fetchNationalData();
  }

  Widget listViewWidget(Summary summary) {
    return Container(
      child: ListView(
        padding: EdgeInsets.all(10),
        children: <Widget>[
          Card(
            child: ListTile(
              title: Text(
                "Total Cases: " + '${summary.total}',
                style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Card(
            child: ListTile(
              title: Text(
                "Confirmed Cases Indian:" + '${summary.confirmedCasesIndian}',
                style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Card(
            child: ListTile(
              title: Text(
                "Confirmed Cases Foreign: " +
                    '${summary.confirmedCasesForeign}',
                style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Card(
            child: ListTile(
              title: Text(
                "Total deaths: " + '${summary.deaths}',
                style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Card(
            child: ListTile(
              title: Text(
                "Discharged: " + '${summary.discharged}',
                style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Covid-19 India Fetch Data',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Covid-19 India Fetch Data'),
        ),
        body: Center(
          child: FutureBuilder<Summary>(
            future: futureAlbum,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                print(snapshot.data.total.toString());
                return listViewWidget(snapshot.data);
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }

              // By default, show a loading spinner.
              return CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}
