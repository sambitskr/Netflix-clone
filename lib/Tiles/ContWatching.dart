import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:netflix/Info.dart';

class ContWatchingTiles extends StatelessWidget {
  final String imagePathh, titleNamee, descriptionn, bannerUrll, yearr;

  const ContWatchingTiles(
      {super.key,
      required this.imagePathh,
      required this.titleNamee,
      required this.descriptionn,
      required this.bannerUrll,
      required this.yearr});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 9),
      child: Column(
        children: [
          Container(
            height: 130,
            width: 100,
            decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(7),
                ),
                image: DecorationImage(
                    image: NetworkImage(imagePathh), fit: BoxFit.cover)),
          ),
          Container(
            height: 38,
            width: 100,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 42, 41, 41),
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(7),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 6.0, right: 6.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => InfoPage(
                              titleName: titleNamee,
                              description: descriptionn,
                              bannerUrl: bannerUrll,
                              year: yearr),
                        ),
                      );
                    },
                    child: Icon(
                      Icons.info_outline,
                      color: Colors.white,
                    ),
                  ),
                  Icon(
                    Icons.more_vert_rounded,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
