import 'package:flutter/material.dart';
import 'package:raccount/pages/buy.dart';
import 'package:raccount/pages/dashboard.dart';
import 'package:raccount/pages/sale.dart';
import 'package:raccount/styles/style.dart';

import 'package:raccount/pages/settings.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  List<String> menuTitle = [
    'Dashboard',
    'Sell',
    'Buy',
    'Settings',
  ];

  List<IconData> menuIcon = [
    Icons.dashboard,
    Icons.local_offer,
    Icons.local_grocery_store,
    Icons.settings,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          menuTitle[_currentIndex],
          style: kTextAppBarTitle,
        ),
        elevation: 0.0,
        backgroundColor: kAppBarBackground,
        centerTitle: kCenterTitle,
        iconTheme: kAppBarIconTheme,
        actionsIconTheme: kAppBarIconTheme,
      ),
      body: Container(
        child: IndexedStack(
          index: _currentIndex,
          children: [
            DashboardPage(),
            SalePage(),
            BuyPage(),
            SettingPage(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: kSelectedItemColor,
        unselectedItemColor: kUnselectedItemColor,
        type: BottomNavigationBarType.shifting,
        onTap: (value) {
          setState(() {
            _currentIndex = value;
          });
        },
        items: [
          for (int index = 0; index < menuTitle.length; index++)
            BottomNavigationBarItem(
              icon: Icon(menuIcon[index]),
              label: menuTitle[index],
            )
        ],
      ),
    );
  }
}
