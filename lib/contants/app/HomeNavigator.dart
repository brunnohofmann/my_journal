import 'package:flutter/material.dart';
import 'package:my_journal/contants/theme.dart';
import 'package:my_journal/screens/app/HomeScreen.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  PersistentTabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController(initialIndex: 0);
  }

  List<Widget> _buildScreens() {
    return [HomeScreen(), Text('tela 2'), HomeScreen()];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(Icons.home),
        title: ("Home"),
        activeColor: secondaryColor,
        inactiveColor: Colors.grey,
        isTranslucent: false,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.search),
        title: ("Search"),
        activeColor: secondaryColor,
        inactiveColor: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.settings),
        title: ("Settings"),
        activeColor: secondaryColor,
        inactiveColor: Colors.grey,
      ),
    ];
  }


  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      controller: _controller,
      items: _navBarsItems(),
      screens: _buildScreens(),
      showElevation: false,
      confineInSafeArea: true,
      handleAndroidBackButtonPress: true,
      iconSize: 26.0,
      navBarStyle: NavBarStyle.style5, // Choose the nav bar style with this property
      onItemSelected: (index) {
        print(index);
      },
    );
  }
}
