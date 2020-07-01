/*import 'package:corona/config/palette.dart';
import 'package:corona/data/data.dart';
import 'package:corona/screens/stats_screen.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart'; // import the package

class CovidBarState extends StatefulWidget {
  // final List<int> covidCases;

  //const CovidBarState({Key key, this.covidCases}) : super(key: key);

  @override
  _CovidBarStateState createState() => _CovidBarStateState();
}

class _CovidBarStateState extends State<CovidBarState> {
  StateScreen stateScreen = StateScreen();
  List<int> globalDataVariable = GlobalData.getGlobalData();
  List<int> indiaDataVariable = IndiaData.getIndiaData();
  Map<String, double> data1 = new Map();

  @override
  Widget build(BuildContext context) {
    List<Color> _colors = [Colors.red, Colors.green, Colors.lightBlue];
    // data2.addAll({'Deaths': 25.0, 'Recovered': 25.0, 'Active': 25.0});

    int currentTap = StateScreen.getIndex();
//      if (currentTap == null) currentTap = 0;
    print("current tap=${currentTap}");
    if (currentTap == 0) {
      print("India");
      data1.addAll({
        'Deaths': indiaDataVariable[1] * 1.0,
        'Recovered': indiaDataVariable[2] * 1.0,
        'Active': indiaDataVariable[3] * 1.0
      });
    } else {
      print(currentTap);
      data1.addAll({
        'Deaths': globalDataVariable[1] * 1.0,
        'Recovered': globalDataVariable[2] * 1.0,
        'Active': globalDataVariable[3] * 1.0
      });
    }
    /*setState(() {
      //  int currentTap = 0;
      if (currentTap == 0) {
        indiaDataVariable = IndiaData.getIndiaData();
        data1.addAll({
          'Deaths': indiaDataVariable[0] * 1.0,
          'Recovered': indiaDataVariable[1] * 1.0,
          'Active': indiaDataVariable[2] * 1.0
        });
      } else {
        globalDataVariable = GlobalData.getGlobalData();

        data1.addAll({
          'Deaths': globalDataVariable[0] * 1.0,
          'Recovered': globalDataVariable[1] * 1.0,
          'Active': globalDataVariable[2] * 1.0
        });
      }
    });*/

    return Container(
      height: 350.0,
      decoration: BoxDecoration(
        color: Palette.primaryColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
      child: Column(
        children: <Widget>[
          Container(
            //padding: const EdgeInsets.only(top: 20.0),
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
          Container(
            width: MediaQuery.of(context).size.width * 0.85,
            child: PieChart(
              dataMap: data1,
              colorList: _colors,
              // if not declared, random colors will be chosen
              animationDuration: Duration(milliseconds: 1500),
              // chartLegendSpacing: 32.0,
              chartRadius: MediaQuery.of(context).size.width / 1.8,
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
              initialAngle: 200,
              chartValueStyle: defaultChartValueStyle.copyWith(
                color: Colors.blueGrey[900].withOpacity(0.9),
              ),
              chartType: ChartType.disc, //can be changed to ChartType.ring
            ),
          ),
        ],
      ),
    );
  }
}
*/
