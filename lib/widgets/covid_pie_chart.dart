import 'package:corona/config/palette.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class CovidPieState extends StatefulWidget {
  // final List<int> covidCases;

  // const CovidBarState({Key key, this.covidCases}) : super(key: key);

  @override
  _CovidPieStateState createState() => _CovidPieStateState();
}

class _CovidPieStateState extends State<CovidPieState> {
  Map<String, double> data1 = new Map();
  int v = 0;
  @override
  Widget build(BuildContext context) {
    List<Color> _colors = [Colors.red, Colors.green, Colors.lightBlue];

    // print(dataIndianState[0]);
    /* List<int> dataDeath = Sdeaths.getInstance().getSdeaths();
    List<int> dataReover = Srecover.getInstance().getSrecover();
    List<int> dataActive = Srecover.getInstance().getSrecover();
    setState(() {
      data1.addAll({
        'Deaths': dataDeath[v] * 1.0,
        'Recovered': dataReover[v] * 1.0,
        'Active': dataActive[v] * 1.0
      });
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
              showChartValuesOutside: true,
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
