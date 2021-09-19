import 'dart:io';

import 'package:flutter/material.dart';
import 'package:resonate/screen_home.dart';
import 'package:resonate/screen_join.dart';
import 'package:resonate/screen_settings.dart';
import 'package:resonate/dashboard.dart';
import 'package:resonate/login_page.dart';
import 'package:resonate/register_teacher.dart';
import 'constants.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late PageController _pageController;
  int _page = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => _confirmExit(context),
      child: Scaffold(
        appBar: AppBar(
        ),
        body: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: _pageController,
          onPageChanged: pageChanged,
          children: const <Widget>[
            LoginPage(),
            RegisterTeacher(),
            Dashboard(),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: _page,
            onTap: navigationTap,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                ),
                title: Text(
                  "Home",
                ),
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.person_pin,
                ),
                title: Text(
                  "Join Conference",
                ),
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.settings,
                ),
                title: Text(
                  "Settings",
                ),
              ),
            ]),
      ),
    );
  }

  void navigationTap(pageIdx) {
    _pageController.jumpToPage(pageIdx);
  }

  void pageChanged(pageIdx) {
    setState(() {
      this._page = pageIdx;
    });
  }

  _confirmExit(context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Are you sure to exit?'),
          content: Text("You wont be connected"),
          actions: <Widget>[
            FlatButton(
              child: Text('Yes'),
              onPressed: () => exit(0),
            ),
            FlatButton(
              child: Text('No'),
              onPressed: () => Navigator.pop(context),
            ),
          ],
        );
      },
    );
  }
}
