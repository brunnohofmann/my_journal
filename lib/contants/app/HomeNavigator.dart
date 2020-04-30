import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:my_journal/contants/theme.dart';
import 'package:my_journal/screens/app/HomeScreen.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: HomeScreen(),
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: currentIndex,
        showElevation: false,
        backgroundColor: Colors.transparent,
        itemCornerRadius: 10,
        curve: Curves.easeIn,
        onItemSelected: (index) => setState(() {
          currentIndex = index;
        }),
        items: [
          BottomNavyBarItem(
            icon: Icon(Icons.apps),
            title: Text('Home'),
            activeColor: secondaryColor,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.assignment),
            title: Text(
              'Records',
            ),
            activeColor: secondaryColor,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.person),
            title: Text('Profile'),
            activeColor: secondaryColor,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
