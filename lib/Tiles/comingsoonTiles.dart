import 'package:flutter/material.dart';

class ComingsoonTile extends StatelessWidget {
  const ComingsoonTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.blue,
      height: MediaQuery.of(context).size.height * 0.5,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.only(top: 10.0, left: 15.0, right: 15.0),
      child: Row(
        children: [
          //Date of release
          Column(
            children: [
              Text(
                'MAR\n 21',
                style: TextStyle(color: Colors.white),
              )
            ],
          ),
          SizedBox(
            width: 20,
          ),
          // the trailer and other content

          Expanded(
            child: Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 150,
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(7)),
                ),
                SizedBox(
                  height: 5,
                ),
                // icons
                Container(
                  width: MediaQuery.of(context).size.width,
                  color: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Icon(
                        Icons.notifications_none,
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      Icon(Icons.info_outline_rounded),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                //description
                Container(
                  child: Text(
                    'A paragraph is a series of sentences that are organized and coherent, and are all related to a single topic. Almost every piece of writing you do that is longer than a few sentences should be organized into paragraphs. This is because paragraphs show a reader where the subdivisions of an essay begin and end, and thus help the reader see the organization of the essay and grasp its main points.',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
