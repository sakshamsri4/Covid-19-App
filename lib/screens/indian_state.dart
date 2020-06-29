import 'package:corona/data/services.dart';
import 'package:corona/screens/indian_screen.dart';
import 'package:flutter/material.dart';

List<int> dataIndianState = [];
void getData() {}

class IndianState extends StatefulWidget {
  @override
  _IndianStateState createState() => _IndianStateState();
}

class _IndianStateState extends State<IndianState> {
  Future<List<Regional>> futureAlbum;
  IndianScreen indianScreenVariable = IndianScreen();
  List<Color> _colors = [Colors.red, Colors.green, Colors.lightBlue];

  @override
  void initState() {
    super.initState();
    futureAlbum = fetchRegionalData();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Regional>>(
      future: futureAlbum,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
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
    //  dataIndianState = [];
    dataIndianState.addAll({
      regional[v].deceased,
      regional[v].recovered,
      regional[v].totalInfected
    });
    dataIndianState[0] = regional[v].deceased;
    dataIndianState[1] = regional[v].recovered;
    dataIndianState[2] = regional[v].totalInfected;
    return Container(
      height: MediaQuery.of(context).size.height * 0.3,
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        children: <Widget>[
          Flexible(
            child: Row(
              children: <Widget>[
                _buildStatCard('Total Cases ${regional[v].region} ',
                    '${regional[v].totalCases}', Colors.orange),
                _buildStatCard('Deaths', '${regional[v].deceased}', Colors.red),
              ],
            ),
          ),
          Flexible(
            child: Row(
              children: <Widget>[
                _buildStatCard(
                    'Recovered', '${regional[v].recovered}', Colors.green),
                _buildStatCard(
                    'Active', '${regional[v].totalInfected}', Colors.lightBlue),
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

  /*Expanded _buildPieChart() {
    return Expanded(
        child: Container(
      height: 700.0,
      child: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.only(top: 20.0),
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                'Pie Chart',
                style: const TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Scaffold(
              //width: MediaQuery.of(context).size.width * 1,
              body: Center(
                child: Column(
                  children: <Widget>[
                    PieChart(
                      dataMap: data1,
                      colorList: _colors,
                      // if not declared, random colors will be chosen
                      animationDuration: Duration(milliseconds: 1500),
                      // chartLegendSpacing: 32.0,
                      chartRadius: MediaQuery.of(context).size.width / 2,
                      //determines the size of the chart
                      showChartValuesInPercentage: true,
                      showChartValues: true,
                      showChartValuesOutside: false,
                      chartValueBackgroundColor: Colors.grey[200],
                      showLegends: false,
                      //legendPosition: LegendPosition.right,
                      //can be changed to top, left, bottom
                      decimalPlaces: 1,

                      showChartValueLabel: true,
                      initialAngle: 0,
                      chartValueStyle: defaultChartValueStyle.copyWith(
                        color: Colors.blueGrey[900].withOpacity(0.9),
                      ),
                      chartType:
                          ChartType.disc, //can be changed to ChartType.ring
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    ));
  }*/
}
