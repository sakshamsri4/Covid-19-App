/// Line chart example
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

class BarChart extends StatefulWidget {
  BarChart({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class ClicksPerYear {
  final String year;
  final int clicks;
  final charts.Color color;

  ClicksPerYear(this.year, this.clicks, Color color)
      : this.color = charts.Color(
            r: color.red, g: color.green, b: color.blue, a: color.alpha);
}

class _MyHomePageState extends State<BarChart> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    var data = [
      ClicksPerYear('2016', 12, Colors.red),
      ClicksPerYear('2017', 42, Colors.yellow),
      ClicksPerYear('2018', _counter, Colors.green),
    ];

    var series = [
      charts.Series(
        domainFn: (ClicksPerYear clickData, _) => clickData.year,
        measureFn: (ClicksPerYear clickData, _) => clickData.clicks,
        colorFn: (ClicksPerYear clickData, _) => clickData.color,
        id: 'Clicks',
        data: data,
      ),
    ];

    var chart = charts.BarChart(
      series,
      animate: true,
    );

    var chartWidget = Padding(
      padding: EdgeInsets.all(32.0),
      child: SizedBox(
        height: 200.0,
        child: chart,
      ),
    );

    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('You have pushed the button this many times:'),
            Text('$_counter', style: Theme.of(context).textTheme.headline4),
            chartWidget,
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}

//class LineChart extends StatelessWidget {
//  // This widget is the root of your application.
//  @override
//  Widget build(BuildContext context) {
//    return MaterialApp(
//        title: 'Frontline Flutter',
//        theme: ThemeData(
//          primarySwatch: Colors.blue,
//        ),
//        //home: MyHomePage(title: 'Flutter Demo Home Page'),
//        home: AreaAndLineChart()
//    );
//  }
//}
//
//class AreaAndLineChart extends StatelessWidget {
//
//  AreaAndLineChart();
//
//
//  @override
//  Widget build(BuildContext context) {
//    List<charts.Series> seriesList = _createSampleData();
//    bool animate = false;
//    return Scaffold(
//      appBar: AppBar(title: Text("Line chart"),),
//      body: Center(
//        child: ListView(
//          children: <Widget>[
//            SingleChildScrollView(
//              child: SizedBox(
//                height: 200.0,
//                  child: charts.LineChart(seriesList,
//                    animate: animate,
//                  ),
//              )
//            )
//          ],
//        )
//      ),
//    );
//
//
//  }
//
//  /// Create one series with sample hard coded data.
//  static List<charts.Series<LinearSales, int>> _createSampleData() {
//    final myFakeDesktopData = [
//      new LinearSales(0, 5),
//      new LinearSales(1, 25),
//      new LinearSales(2, 100),
//      new LinearSales(3, 75),
//    ];
//
//    var myFakeTabletData = [
//      new LinearSales(0, 10),
//      new LinearSales(1, 50),
//      new LinearSales(2, 200),
//      new LinearSales(3, 150),
//    ];
//
//    return [
//      new charts.Series<LinearSales, int>(
//        id: 'Desktop',
//        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
//        domainFn: (LinearSales sales, _) => sales.year,
//        measureFn: (LinearSales sales, _) => sales.sales,
//        data: myFakeDesktopData,
//      )
//      // Configure our custom bar target renderer for this series.
//        ..setAttribute(charts.rendererIdKey, 'customArea'),
//      new charts.Series<LinearSales, int>(
//        id: 'Tablet',
//        colorFn: (_, __) => charts.MaterialPalette.green.shadeDefault,
//        domainFn: (LinearSales sales, _) => sales.year,
//        measureFn: (LinearSales sales, _) => sales.sales,
//        data: myFakeTabletData,
//      ),
//    ];
//  }
//
//
//}
//
///// Sample linear data type.
//class LinearSales {
//  final int year;
//  final int sales;
//
//  LinearSales(this.year, this.sales);
//}
