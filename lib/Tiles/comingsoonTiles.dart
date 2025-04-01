import 'package:flutter/material.dart';

class ComingsoonTile extends StatelessWidget {
  final String desc;
  final String coverURL;
  final String rDate;
  final String name;

  const ComingsoonTile({
    super.key,
    required this.desc,
    required this.coverURL,
    required this.rDate,
    required this.name,
  });

  String month() {
    switch (rDate.substring(5, 7)) {
      case '01':
        return "JAN";
      case '02':
        return "FEB";
      case '03':
        return "MAR";
      case '04':
        return "APR";
      case '05':
        return "MAY";
      case '06':
        return "JUN";
      case '07':
        return "JUL";
      case '08':
        return "AUG";
      case '09':
        return "SEP";
      case '10':
        return "OCT";
      case '11':
        return "NOV";
      case '12':
        return "DEC";

      default:
        return "NA";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.blue,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.only(top: 10.0, left: 15.0, right: 15.0),
      child: Row(
        children: [
          //Date of release
          Column(
            children: [
              Text(
                month() + "\n" + rDate.substring(8, 10),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
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
                  height: 200,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(coverURL), fit: BoxFit.cover),
                      // color: Colors.red,
                      borderRadius: BorderRadius.circular(7)),
                ),
                SizedBox(
                  height: 5,
                ),
                // icons
                Container(
                  width: MediaQuery.of(context).size.width,
                  // color: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        name,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 19,
                            fontWeight: FontWeight.bold),
                      ),
                      Spacer(),
                      Icon(
                        Icons.notifications_none,
                        size: 30,
                        color: Colors.white,
                      ),
                      Icon(
                        Icons.info_outline_rounded,
                        size: 30,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                //description
                Container(
                  child: Text(
                    desc,
                    style: TextStyle(
                      color: Colors.grey,
                    ),
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
