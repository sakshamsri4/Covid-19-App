import 'package:corona/screens/stats_screen.dart';
import 'package:flutter/material.dart';

import 'home_screen.dart';

class BottomNavScreen extends StatefulWidget {
  @override
  _BottomNavScreenState createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  final List _screens = [
    HomeScreen(),
    StateScreen(),
    Scaffold(),
    Scaffold(),
    Scaffold(),
  ];
  int _current_index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_current_index],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _current_index,
          onTap: (index) => setState(() => _current_index = index),
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey,
          elevation: 0.0,
          items: [Icons.home, Icons.insert_chart, Icons.event_note, Icons.info]
              .asMap()
              .map((key, value) => MapEntry(
                    key,
                    BottomNavigationBarItem(
                      title: Text(''),
                      icon: Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 6.0,
                          horizontal: 16.0,
                        ),
                        decoration: BoxDecoration(
                          color: _current_index == key
                              ? Colors.blue[600]
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Icon(value),
                      ),
                    ),
                  ))
              .values
              .toList()),
    );
  }
}
