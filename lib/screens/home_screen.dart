import 'package:corona/config/palette.dart';
import 'package:corona/config/styles.dart';
import 'package:corona/data/data.dart';
import 'package:corona/widgets/custom_app_bar.dart';
import 'package:corona/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _country = 'IN';
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: CustomAppBar(),
      body: CustomScrollView(
        physics: ClampingScrollPhysics(),
        slivers: <Widget>[
          _buildHeader(screenHeight),
          _buildPreventionTips(screenHeight),
          _buildYourOwnTest(screenHeight),
        ],
      ),
    );
  }

  SliverToBoxAdapter _buildHeader(double screenHeight) {
    return SliverToBoxAdapter(
      child: Container(
        padding: const EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: Palette.primaryColor,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(40.0),
            bottomRight: Radius.circular(40.0),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Covid-19',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 28.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                CircleAvatar(
                  radius: 25.0,
                  child: Image.asset(
                      'assets/images/${_country.toLowerCase()}_flag.png'),
                ),
              ],
            ),
            SizedBox(
              height: screenHeight * 0.03,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Are  you feeling Sick?',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 22.0,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(height: screenHeight * 0.01),
                Text(
                  'If you feel sick with any COVID-19 symptoms, please call '
                  'or text us immediately ',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15.0,
                  ),
                ),
                SizedBox(
                  height: screenHeight * 0.03,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    FlatButton.icon(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 20.0),
                      onPressed: () {
                        launch('tel:112');
                      },
                      color: Colors.red,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0)),
                      icon: const Icon(Icons.phone, color: Colors.white),
                      label: Text(
                        'Call Now',
                        style: Styles.buttonTextStyle,
                      ),
                      textColor: Colors.white,
                    ),
                    FlatButton.icon(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 20.0),
                      onPressed: () {
                        launch('sms:112');
                      },
                      color: Colors.blue,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0)),
                      icon: const Icon(Icons.chat_bubble, color: Colors.white),
                      label: Text(
                        'Send SMS',
                        style: Styles.buttonTextStyle,
                      ),
                      textColor: Colors.white,
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  SliverToBoxAdapter _buildPreventionTips(double screenHeight) {
    return SliverToBoxAdapter(
      child: Container(
        padding: const EdgeInsets.all(20.0),
        // color: Colors.orange,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Prevention Tips',
              style:
                  const TextStyle(fontSize: 22.0, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: prevention
                  .map(
                    (e) => Column(
                      children: <Widget>[
                        Image.asset(e.keys.first, height: screenHeight * 0.12),
                        SizedBox(
                          height: screenHeight * 0.015,
                        ),
                        Text(
                          e.values.first,
                          style: const TextStyle(
                              fontSize: 16.0, fontWeight: FontWeight.w500),
                          textAlign: TextAlign.center,
                        )
                      ],
                    ),
                  )
                  .toList(),
            )
          ],
        ),
      ),
    );
  }

  SliverToBoxAdapter _buildYourOwnTest(double screenHeight) {
    return SliverToBoxAdapter(
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
        padding: const EdgeInsets.all(10.0),
        //color: Colors.orange,
        height: screenHeight * 0.15,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFAD9FE4), Palette.primaryColor],
          ),
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Image.asset('assets/images/own_test.png'),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Do your own test!',
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: screenHeight * 0.01,
                ),
                //FlatButton(),
                /*Text(
                  'Follow the instructions\nto do your own test.',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                  ),
                  maxLines: 2,
                ),*/
                FlatButton(
                  onPressed: () {
                    launch(
                        "https://covid.apollo247.com/?utm_source=linkedin&utm_medium=organic&utm_campaign=bot_scanner");
                  },
                  child: Text(
                    'Follow the instructions\nto do your own test.',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
