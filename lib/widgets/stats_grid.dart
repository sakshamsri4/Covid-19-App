import 'package:corona/data/idata.dart';
import 'package:flutter/material.dart';

class StatsGrid extends StatefulWidget {
  @override
  _StatsGridState createState() => _StatsGridState();
}

class _StatsGridState extends State<StatsGrid> {
  @override
  Widget build(BuildContext context) {
    //IndiaData.setIndiaData(summary.deaths, summary.discharged,
    //  summary.total - (summary.deaths + summary.discharged));
    /* dataIndia.add(summary.deaths);
    dataIndia.add(summary.discharged);
    dataIndia.add(summary.total - (summary.deaths + summary.discharged));*/
    List<int> indiaDataVariable = IData.getObject().getIData();
    return Container(
      height: MediaQuery.of(context).size.height * 0.25,
      child: Column(
        children: <Widget>[
          Flexible(
            child: Row(
              children: <Widget>[
                _buildStatCard('Total Cases India', '${indiaDataVariable[0]}',
                    Colors.orange),
                _buildStatCard('Deaths', '${indiaDataVariable[1]}', Colors.red),
              ],
            ),
          ),
          Flexible(
            child: Row(
              children: <Widget>[
                _buildStatCard(
                    'Recovered', '${indiaDataVariable[2]}', Colors.green),
                _buildStatCard(
                    'Active', '${indiaDataVariable[3]}', Colors.lightBlue),
                // _buildStatCard('Critical', 'N/A', Colors.purple),
              ],
            ),
          ),
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
