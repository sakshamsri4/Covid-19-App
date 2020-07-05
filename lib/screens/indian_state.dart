import 'package:corona/data/services.dart';
import 'package:corona/data/state_data/sdata.dart';
import 'package:corona/data/state_data/state_count.dart';
import 'package:corona/screens/indian_screen.dart';
import 'package:flutter/material.dart';

import 'indian_screen.dart';

class IndianState extends StatefulWidget {
  @override
  _IndianStateState createState() => _IndianStateState();
}

class _IndianStateState extends State<IndianState> {
  Future<List<Regional>> futureAlbum;
  IndianScreen indianScreenVariable = IndianScreen();
  List<Color> _colors = [Colors.red, Colors.green, Colors.lightBlue];
  int v = StateCount.getInstance().getIData();

  @override
  void initState() {
    super.initState();
    futureAlbum = fetchRegionalData();
  }

  @override
  Widget build(BuildContext context) {
    if (v == null) {
      v = 4;
    }
    return FutureBuilder<List<Regional>>(
      future: futureAlbum,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          // v = IndianScreen.getIndex();
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

  Widget test(List<Regional> regional) {
    v = StateCount.data;
    List<states> regionalData = SData.getInstance().getSData();
    return Container(
      height: MediaQuery.of(context).size.height * 0.3,
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        children: <Widget>[
          Flexible(
            child: Row(
              children: <Widget>[
                _buildStatCard('Total Cases ${regionalData[v].region} ',
                    '${regionalData[v].total}', Colors.orange),
                _buildStatCard(
                    'Deaths', '${regionalData[v].death}', Colors.red),
              ],
            ),
          ),
          Flexible(
            child: Row(
              children: <Widget>[
                _buildStatCard(
                    'Recovered', '${regionalData[v].reovered}', Colors.green),
                _buildStatCard(
                    'Active', '${regionalData[v].active}', Colors.lightBlue),
                // _buildStatCard('Critical', 'N/A', Colors.purple),
              ],
            ),
          ),
          //_buildPieChart()
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
