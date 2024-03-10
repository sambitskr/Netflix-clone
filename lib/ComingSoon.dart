import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:netflix/Tiles/comingsoonTiles.dart';

class ComingsoonPage extends StatelessWidget {
  const ComingsoonPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'Coming soon ',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          Icon(
            Icons.notifications_none,
            color: Colors.white,
          ),
          SizedBox(
            width: 15,
          ),
          Icon(
            Icons.search,
            color: Colors.white,
          ),
          SizedBox(
            width: 15,
          ),
          Icon(
            Icons.person_pin,
            color: Colors.white,
          ),
        ],
      ),
      body: Column(
        children: [
          //top row
          Row(
            children: [],
          ),
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.81,
                    child: ListView(
                      scrollDirection: Axis.vertical,
                      children: [
                        ComingsoonTile(),
                        ComingsoonTile(),
                        ComingsoonTile(),
                      ],
                    ),
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
