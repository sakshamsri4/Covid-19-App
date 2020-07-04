import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:corona/config/palette.dart';
import 'package:corona/config/styles.dart';
import 'package:corona/data/data.dart';
import 'package:corona/data/gdata.dart';
import 'package:corona/data/idata.dart';
import 'package:corona/data/services.dart';
import 'package:corona/widgets/custom_app_bar.dart';
import 'package:corona/widgets/stats_grid.dart';
import 'package:corona/widgets/stats_grid_gloabal.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class StateScreen extends StatefulWidget {
  @override
  _StateScreenState createState() => _StateScreenState();
  static int getIndex() {
    _StateScreenState.getIndex();
  }
}

class _StateScreenState extends State<StateScreen> {
  static int currentTap = 0;
  IndiaData indiaData = IndiaData();
  List<Color> _colors = [Colors.red, Colors.green, Colors.lightBlue];
  Future<Summary> futureAlbum;
  Future<GlobalSummary> futureAlbumGlobal;
//  Map<String, double> data1 = new Map();
//  Map<String, double> data2 = new Map();
//  Map<String, double> data3 = new Map();
//  IndiaData indiaData = IndiaData();

  @override
  void initState() {
    super.initState();
    futureAlbum = fetchNationalData();
    futureAlbumGlobal = fetchGlobalData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.primaryColor,
      appBar: CustomAppBar(),
      body:
          CustomScrollView(physics: ClampingScrollPhysics(), slivers: <Widget>[
        _buildHeaders(),
        _buildRegionTabBar(),
        // _buildStatsTabBar(),

        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          sliver: SliverToBoxAdapter(
            child: currentTap == 0 ? buildStatsGrid() : buildStatsGridGlobal(),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          sliver: SliverToBoxAdapter(
            child: buildCovidBarState(),
          ),
        ),
      ]),
    );
  }

  Widget buildStatsGrid() {
    // India data Future Builder Summary
    return FutureBuilder<Summary>(
      future: futureAlbum,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          // print(snapshot.data.total.toString());
//          indiaData.setIndiaData(
//              snapshot.data.total,
//              snapshot.data.deaths,
//              snapshot.data.discharged,
//              snapshot.data.total -
//                  (snapshot.data.deaths + snapshot.data.discharged));
//          data1.addAll({
//            'Deaths': snapshot.data.deaths * 1.0,
//            'Recovered': snapshot.data.discharged * 1.0,
//            'Active': snapshot.data.total -
//                (snapshot.data.deaths + snapshot.data.discharged) * 1.0
//          });
//          print(data1);
//          IData.getObject().setIData(
//              snapshot.data.total,
//              snapshot.data.deaths,
//              snapshot.data.discharged,
//              snapshot.data.total -
//                  (snapshot.data.deaths + snapshot.data.discharged));

          //   List<int> abc = IndiaData.getIndiaData();

          return StatsGrid();
          //return Text("${snapshot.error}");
          // return Text('${snapshot.data}');
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }

        // By default, show a loading spinner.
        return CircularProgressIndicator();
      },
    );
  }

  Widget buildStatsGridGlobal() {
    // Global data Future Builder Summary
    return FutureBuilder<GlobalSummary>(
      future: futureAlbumGlobal,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          // print(snapshot.data.newConfirmed.toString());
//          GlobalData.setGlobalData(
//              snapshot.data.totalConfirmed,
//              snapshot.data.totalDeaths,
//              snapshot.data.totalRecovered,
//              snapshot.data.totalConfirmed -
//                  (snapshot.data.totalRecovered + snapshot.data.totalDeaths));
//          data2.addAll({
//            'Deaths': snapshot.data.totalDeaths * 1.0,
//            'Recovered': snapshot.data.totalRecovered * 1.0,
//            'Active': snapshot.data.totalConfirmed -
//                (snapshot.data.totalRecovered + snapshot.data.totalDeaths) * 1.0
//          });
          return StatsGridGlobal();
          // return Text('${snapshot.data}');
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }

        // By default, show a loading spinner.
        return CircularProgressIndicator();
      },
    );
/* To be implemented   */
  }

  Widget buildCovidBarState() {
    //Covid data pie Future Builder Summary
    //  List<int> globalDataVariable = GlobalData.getGlobalData();
    //List<int> indiaDataVariable = IData.getObject().getIData();
    // print(indiaDataVariable[0]);
    //print(globalDataVariable[0]);
    if (currentTap == 0) {
      print("india");
      //data3 = data1;
    } else {
      print("global");
      //data3 = data2;
    }

    return Container(
      //height: 350.0,
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
                  color: Colors.white,
                ),
              ),
            ),
          ),
          currentTap == 0 ? covidIndiaChart() : covidGlobalChart(),

//          Container(
//            width: MediaQuery.of(context).size.width * 0.85,
//            child: PieChart(
//              dataMap: data3,
//              colorList: _colors,
//              // if not declared, random colors will be chosen
//              animationDuration: Duration(milliseconds: 1500),
//              // chartLegendSpacing: 32.0,
//              chartRadius: MediaQuery.of(context).size.width / 1.8,
//              //determines the size of the chart
//              showChartValuesInPercentage: true,
//              showChartValues: true,
//              showChartValuesOutside: false,
//              chartValueBackgroundColor: Colors.grey[200],
//              showLegends: false,
//              //legendPosition: LegendPosition.right,
//              //can be changed to top, left, bottom
//              decimalPlaces: 1,
//
//              showChartValueLabel: true,
//              initialAngle: 200,
//              chartValueStyle: defaultChartValueStyle.copyWith(
//                color: Colors.blueGrey[900].withOpacity(0.9),
//              ),
//              chartType: ChartType.disc, //can be changed to ChartType.ring
//            ),
//          ),
        ],
      ),
    );
  }

  Widget covidIndiaChart() {
    return FutureBuilder<Summary>(
      future: futureAlbum,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<int> idata = IData.getInstance().getIData();
          return buildPieChart(idata);
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }

        // By default, show a loading spinner.
        return CircularProgressIndicator();
      },
    );
  }

  Widget covidGlobalChart() {
    return FutureBuilder<GlobalSummary>(
      future: futureAlbumGlobal,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<int> gdata = GData.getInstance().getGData();
          return buildPieChart(gdata);
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }

        // By default, show a loading spinner.
        return CircularProgressIndicator();
      },
    );
  }

  Widget buildPieChart(List<int> igdata) {
    Map<String, double> data = new Map();
    data.addAll({
      'Deaths': igdata[1] * 1.0,
      'Recovered': igdata[2] * 1.0,
      'Active': igdata[3] * 1.0
    });

    return Container(
      width: MediaQuery.of(context).size.width * 0.85,
      child: PieChart(
        dataMap: data,
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
    );
  }

  SliverPadding _buildHeaders() {
    return SliverPadding(
      padding: const EdgeInsets.all(20.0),
      sliver: SliverToBoxAdapter(
        child: Text(
          'Statistics',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 25.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  static int getIndex() {
    print("current tap ${currentTap}");
    return currentTap;
  }

  SliverToBoxAdapter _buildRegionTabBar() {
    return SliverToBoxAdapter(
      child: DefaultTabController(
        length: 2,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 20.0),
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 20.0),
            height: 50.0,
            decoration: BoxDecoration(
              color: Colors.white24,
              borderRadius: BorderRadius.circular(25.0),
            ),
            child: TabBar(
              indicator: BubbleTabIndicator(
                tabBarIndicatorSize: TabBarIndicatorSize.tab,
                indicatorHeight: 40.0,
                indicatorColor: Colors.white,
              ),
              labelStyle: Styles.tabTextStyle,
              labelColor: Colors.black,
              unselectedLabelColor: Colors.white,
              tabs: <Widget>[
                Text('India'),
                Text('Global'),
              ],
              onTap: (index) {
                setState(() {
                  currentTap = index;
                });
              },
            ),
          ),
        ),
      ),
    );
  }

  /* SliverPadding _buildStatsTabBar() {
    return SliverPadding(
      padding: const EdgeInsets.all(20.0),
      sliver: SliverToBoxAdapter(
        child: DefaultTabController(
          length: 3,
          child: TabBar(
            indicatorColor: Colors.transparent,
            labelStyle: Styles.tabTextStyle,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white60,
            tabs: <Widget>[
              Text('Total'),
              Text('Today'),
              Text('Yesterday'),
            ],
            onTap: (index) {},
          ),
        ),
      ),
    );
  }*/

}
