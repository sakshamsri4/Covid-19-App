import 'package:corona/config/palette.dart';
import 'package:corona/screens/indian_state.dart';
import 'package:corona/widgets/covid_pie_chart.dart';
import 'package:corona/widgets/custom_app_bar.dart';
import 'package:corona/widgets/state_dropdown.dart';
import 'package:flutter/material.dart';

int v = 0;

class IndianScreen extends StatefulWidget {
  @override
  _IndianScreenState createState() => _IndianScreenState();
}

class _IndianScreenState extends State<IndianScreen> {
  String state = "Andaman and Nicobar Islands";

  static List<String> statesName = [
    "Andaman and Nicobar Islands",
    "Andhra Pradesh",
    "Arunachal Pradesh",
    "Assam",
    "Bihar",
    "Chandigarh",
    "Chhattisgarh",
    "Dadra and Nagar Haveli and Daman and Diu",
    "Delhi",
    "Goa",
    "Gujarat",
    "Haryana",
    "Himachal Pradesh",
    "Jammu and Kashmir",
    "Jharkhand",
    "Karnataka",
    "Kerala",
    "Ladakh",
    "Madhya Pradesh",
    "Maharashtra",
    "Manipur",
    "Meghalaya",
    "Mizoram",
    "Nagaland",
    "Odisha",
    "Puducherry",
    "Punjab",
    "Rajasthan",
    "Sikkim",
    "Tamil Nadu",
    "Telangana",
    "Tripura",
    "Uttarakhand",
    "Uttar Pradesh",
    "West Bengal",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Palette.primaryColor,
        appBar: CustomAppBar(),
        body: CustomScrollView(
          physics: ClampingScrollPhysics(),
          shrinkWrap: true,
          slivers: <Widget>[
            _buildHeaders(),
            _buildRegionDropDown(),
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              sliver: SliverToBoxAdapter(
                child: IndianState(),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.only(top: 20.0),
              sliver: SliverToBoxAdapter(
                child: CovidPieState(),
              ),
            )
          ],
        ));
  }

  SliverPadding _buildHeaders() {
    return SliverPadding(
      padding: const EdgeInsets.all(20.0),
      sliver: SliverToBoxAdapter(
        child: Text(
          'State Statistics',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 25.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  SliverToBoxAdapter _buildRegionDropDown() {
    return SliverToBoxAdapter(
        child: Column(
      children: <Widget>[
        StateDropDown(
          states: statesName,
          state: state,
          onChanged: (val) => setState(() {
            state = val;
            v = (statesName.indexOf(state));
          }),
        ),
      ],
    ));
  }
}
