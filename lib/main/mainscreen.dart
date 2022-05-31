import 'dart:ui';

import 'package:clubstyle_users/main/chat.dart';
import 'package:clubstyle_users/main/club_life.dart';
import 'package:clubstyle_users/main/home_page.dart';
import 'package:clubstyle_users/main/settings.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  // Properties & Variables needed

  int currentTab = 0; // to keep track of active tab index
  final List<Widget> screens = [
    Home_Page(),
    Club_Life(),
    Chat(),
    Settings()
  ]; // to store nested tabs
  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = Home_Page(); // Our first view in viewport

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff060124),
      
      body: PageStorage(
        child: currentScreen,
        bucket: bucket,
      ),
      bottomNavigationBar: ClipRRect(
         borderRadius: BorderRadius.only(
        topLeft: Radius.circular(25),
        topRight: Radius.circular(25),
       
      ),
        child: BottomAppBar(
          shape: CircularNotchedRectangle(),
        
          notchMargin: 5, //
          color: Color(0xffF01454),
          child: Container(
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                MaterialButton(
                  minWidth: 40,
                  onPressed: () {
                    setState(() {
                      currentScreen =
                          Home_Page(); // if user taps on this dashboard tab will be active
                      currentTab = 0;
                    });
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                        currentTab == 0 ? Image.asset('assets/v.png',height: 30,width: 30,) : Image.asset('assets/v.png',height: 30,width: 30,)
                      // Icon(
                      //   Icons.home,
                      //   color: currentTab == 0
                      //       ? Color(0xff3f48cc)
                      //       : Color(0xff8d8282),
                      // ),
                     
                    ],
                  ),
                ),
                //Orders
                MaterialButton(
                  minWidth: 40,
                  onPressed: () {
                    setState(() {
                      currentScreen =
                          Club_Life(); // if user taps on this dashboard tab will be active
                      currentTab = 1;
                    });
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                       currentTab == 1 ? Image.asset('assets/nightclub.png',height: 30,width: 30,) : Image.asset('assets/nightclub.png',height: 30,width: 30,)
                      
                    ],
                  ),
                ),
                MaterialButton(
                  minWidth: 40,
                  onPressed: () {
                    setState(() {
                      currentScreen =
                          Chat(); // if user taps on this dashboard tab will be active
                      currentTab = 2;
                    });
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                        currentTab == 2 ? Image.asset('assets/message.png',height: 30,width: 30,) : Image.asset('assets/message.png',height: 30,width: 30,)
                     
                    ],
                  ),
                ),
      
                ///Create Orders
                 MaterialButton(
                  minWidth: 40,
                  onPressed: () {
                    setState(() {
                      currentScreen =
                          Settings(); // if user taps on this dashboard tab will be active
                      currentTab = 3;
                    });
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                        currentTab == 3 ? Image.asset('assets/person.png',height: 30,width: 30,) : Image.asset('assets/person.png',height: 30,width: 30,)
                     
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
