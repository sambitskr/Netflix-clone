import 'dart:math';

import 'package:flutter/material.dart';

import 'package:netflix/ComingSoon.dart';
import 'package:netflix/Downloads.dart';
import 'package:netflix/HomePage.dart';

import 'package:netflix/fastLaughs.dart';

class MyHomeScreen extends StatefulWidget {
  const MyHomeScreen({super.key});

  @override
  State<MyHomeScreen> createState() => _MyHomeScreenState();
}

class _MyHomeScreenState extends State<MyHomeScreen> {
  int _currentIndex = 0;

  List widgetList = [
    Home(),
    ComingsoonPage(),
    FastLaughsPage(),
    DownloadPage(),
  ];

  Random random = Random();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,

      // appBar: AppBar(
      //   backgroundColor: Colors.transparent,
      //   elevation: 1,
      //   shadowColor: Colors.black,
      //   //Netflix Logo
      //   leading: Image.asset(
      //     'Images/netflixIcon.png',
      //   ),
      //   actions: [
      //     Padding(
      //       padding: EdgeInsets.only(right: 8.0),
      //       child: Row(
      //         children: [
      //           Icon(
      //             Icons.search_rounded,
      //             color: Colors.white,
      //           ),
      //           SizedBox(
      //             width: 15,
      //           ),
      //           Icon(
      //             Icons.person_pin,
      //             color: Colors.white,
      //           ),
      //         ],
      //       ),
      //     ),
      //   ],
      // ),
      body: widgetList[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Color.fromARGB(255, 23, 23, 23),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.video_collection_outlined),
            label: 'Coming Soon',
            backgroundColor: Color.fromARGB(255, 23, 23, 23),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.face),
            label: 'Fast Laughs',
            backgroundColor: Color.fromARGB(255, 23, 23, 23),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.download_for_offline_outlined),
            label: 'Downloads',
            backgroundColor: Color.fromARGB(255, 23, 23, 23),
          ),
        ],
        onTap: (index) {
          setState(
            () {
              _currentIndex = index;
            },
          );
        },
      ),
    );
  }
}
