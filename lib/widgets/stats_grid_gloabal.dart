import 'package:corona/data/data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StatsGridGlobal extends StatefulWidget {
  @override
  _StatsGridGlobalState createState() => _StatsGridGlobalState();
}

class _StatsGridGlobalState extends State<StatsGridGlobal> {
  Widget build(BuildContext context) {
    /* globalData.add(globalSummary.totalDeaths);
    globalData.add(globalSummary.totalRecovered);
    globalData.add(globalSummary.totalConfirmed -
        (globalSummary.totalRecovered + globalSummary.totalDeaths));*/

    /*  GlobalData.setGlobalData(
        globalSummary.totalDeaths,
        globalSummary.totalRecovered,
        globalSummary.totalConfirmed -
            (globalSummary.totalRecovered + globalSummary.totalDeaths));
*/

    List<int> globalSummaryData = GlobalData.getGlobalData();
    return Container(
      height: MediaQuery.of(context).size.height * 0.25,
      //color: Colors.yellow,
      child: Column(
        children: <Widget>[
          Flexible(
            child: Row(
              children: <Widget>[
                _buildStateCard('Total Global Cases', '${globalSummaryData[0]}',
                    Colors.orange),
                _buildStateCard(
                    'Deaths', '${globalSummaryData[1]}', Colors.red),
              ],
            ),
          ),
          Flexible(
            child: Row(
              children: <Widget>[
                _buildStateCard(
                    'Recovered', '${globalSummaryData[2]}', Colors.green),
                _buildStateCard(
                    'Active',
                    '${globalSummaryData[0] - (globalSummaryData[1] + globalSummaryData[2])}',
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
