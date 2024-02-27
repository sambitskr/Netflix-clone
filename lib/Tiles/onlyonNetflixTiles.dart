import 'package:flutter/material.dart';
import 'package:netflix/Info.dart';

class OnlyonNetflixTiles extends StatelessWidget {
  final String imagePath;
  const OnlyonNetflixTiles({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 9),
      child: Container(
        height: 130,
        width: 200,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(7),
          image: DecorationImage(
              image: NetworkImage(imagePath), fit: BoxFit.cover),
        ),
      ),
    );
  }
}
