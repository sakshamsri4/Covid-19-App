import 'package:corona/data/data.dart';
import 'package:corona/data/services.dart';
import 'package:corona/widgets/covid_bar_chart.dart';
import 'package:flutter/material.dart';

class Bridge extends StatefulWidget {
  @override
  _BridgeState createState() => _BridgeState();
}

class _BridgeState extends State<Bridge> {
  Future<Summary> futureAlbum;

  @override
  void initState() {
    super.initState();
    futureAlbum = fetchNationalData();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Summary>(
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

  Widget test(Summary summary) {
    //IndiaData.setIndiaData(summary.deaths, summary.discharged,
    //  summary.total - (summary.deaths + summary.discharged));
    /* dataIndia.add(summary.deaths);
    dataIndia.add(summary.discharged);
    dataIndia.add(summary.total - (summary.deaths + summary.discharged));*/
    IndiaData.setIndiaData(summary.total, summary.deaths, summary.discharged,
        summary.total - (summary.deaths + summary.discharged));
    return Container(
      height: MediaQuery.of(context).size.height * 0.25,
      child: Column(
        children: <Widget>[
          Column(
            children: <Widget>[
              Flexible(
                child: Row(
                  children: <Widget>[
                    _buildStatCard(
                        'Total Cases India', '${summary.total}', Colors.orange),
                    _buildStatCard('Deaths', '${summary.deaths}', Colors.red),
                  ],
                ),
              ),
              Flexible(
                child: Row(
                  children: <Widget>[
                    _buildStatCard(
                        'Recovered', '${summary.discharged}', Colors.green),
                    _buildStatCard(
                        'Active',
                        '${summary.total - (summary.deaths + summary.discharged)}',
                        Colors.lightBlue),
                    // _buildStatCard('Critical', 'N/A', Colors.purple),
                  ],
                ),
              ),
            ],
          ),
          SliverPadding(
            padding: const EdgeInsets.only(top: 20.0),
            sliver: SliverToBoxAdapter(
              child: CovidBarState(),
            ),
          )
        ],
      ),
    );
  }

  Expanded _buildStatCard(String title, String count, MaterialColor color) {
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
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              count,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}