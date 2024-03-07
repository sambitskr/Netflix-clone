import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Container(
                    color: Colors.blue,
                    height: MediaQuery.of(context).size.height * 0.52,
                    width: MediaQuery.of(context).size.width,
                    padding:
                        EdgeInsets.only(top: 10.0, left: 15.0, right: 15.0),
                    child: Row(
                      children: [
                        //Date of release
                        Column(
                          children: [Text('MAR\n 21')],
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
                                    'A paragraph is a series of sentences that are organized and coherent, and are all related to a single topic. Almost every piece of writing you do that is longer than a few sentences should be organized into paragraphs. This is because paragraphs show a reader where the subdivisions of an essay begin and end, and thus help the reader see the organization of the essay and grasp its main points.'),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
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
