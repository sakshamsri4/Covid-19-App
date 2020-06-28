import 'package:corona/data/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

List<int> dataGlobal = [];

class StatsGridGlobal extends StatefulWidget {
  @override
  _StatsGridGlobalState createState() => _StatsGridGlobalState();
}

class _StatsGridGlobalState extends State<StatsGridGlobal> {
  Future<GlobalSummary> futureAlbum;
  @override
  void initState() {
    super.initState();
    futureAlbum = fetchGlobalData();
  }

  Widget build(BuildContext context) {
    return FutureBuilder<GlobalSummary>(
      future: futureAlbum,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          // print(snapshot.data.total.toString());
          return test(snapshot.data);
          // return Text('${snapshot.data}');
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }

        // By default, show a loading spinner.
        return CircularProgressIndicator();
      },
    );
  }

  Widget test(GlobalSummary globalSummary) {
    dataGlobal.add(globalSummary.totalDeaths);
    dataGlobal.add(globalSummary.totalRecovered);
    dataGlobal.add(globalSummary.totalConfirmed -
        (globalSummary.totalRecovered + globalSummary.totalDeaths));
    return Container(
      height: MediaQuery.of(context).size.height * 0.25,
      //color: Colors.yellow,
      child: Column(
        children: <Widget>[
          Flexible(
            child: Row(
              children: <Widget>[
                _buildStateCard('Total Global Cases',
                    '${globalSummary.totalConfirmed}', Colors.orange),
                _buildStateCard(
                    'Deaths', '${globalSummary.totalDeaths}', Colors.red),
              ],
            ),
          ),
          Flexible(
            child: Row(
              children: <Widget>[
                _buildStateCard('Recovered', '${globalSummary.totalRecovered}',
                    Colors.green),
                _buildStateCard(
                    'Active',
                    '${globalSummary.totalConfirmed - (globalSummary.totalRecovered + globalSummary.totalDeaths)}',
                    Colors.lightBlue),
                // _buildStateCard('Critical', '8,944', Colors.purple),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Expanded _buildStateCard(String title, String count, MaterialColor color) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(8.0),
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              title,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 15.0,
                  fontWeight: FontWeight.w600),
            ),
            Text(
              count,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
