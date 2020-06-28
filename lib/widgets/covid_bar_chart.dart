import 'package:corona/config/palette.dart';
import 'package:corona/screens/stats_screen.dart';
import 'package:corona/widgets/stats_grid.dart';
import 'package:corona/widgets/stats_grid_gloabal.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart'; // import the package

class CovidBarState extends StatefulWidget {
  // final List<int> covidCases;

  //const CovidBarState({Key key, this.covidCases}) : super(key: key);

  @override
  _CovidBarStateState createState() => _CovidBarStateState();
}

class _CovidBarStateState extends State<CovidBarState> {
  Map<String, double> data1 = new Map();
/*  void initState() {
    data1.addAll(
        {'Total': 25.0, 'Deaths': 25.0, 'Recovered': 25.00, 'Active': 25.0});
  }*/

  @override
  Widget build(BuildContext context) {
    List<Color> _colors = [Colors.red, Colors.green, Colors.lightBlue];
    data1.addAll({'Deaths': 25.0, 'Recovered': 25.0, 'Active': 25.0});

    if (currentTap == 0) {
      data1.addAll({
        'Deaths': dataIndia[0] * 1.0,
        'Recovered': dataIndia[1] * 1.0,
        'Active': dataIndia[2] * 1.0
      });
    } else {
      data1.addAll({
        'Deaths': dataGlobal[0] * 1.0,
        'Recovered': dataGlobal[1] * 1.0,
        'Active': dataGlobal[2] * 1.0
      });
    }
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
          )
        ],
      ),
    );
  }
}
