import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StatsGridGlobal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.25,
      //color: Colors.yellow,
      child: Column(
        children: <Widget>[
          Flexible(
            child: Row(
              children: <Widget>[
                _buildStateCard(
                    'Total Global Cases', '3,16,719', Colors.orange),
                _buildStateCard('Deaths', '8,942', Colors.red),
              ],
            ),
          ),
          Flexible(
            child: Row(
              children: <Widget>[
                _buildStateCard('Recovered', '1,57,308', Colors.green),
                _buildStateCard('Active', '1,50,445', Colors.lightBlue),
                _buildStateCard('Critical', '8,944', Colors.purple),
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
