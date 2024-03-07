import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:netflix/HomeScreen.dart';

class InfoPage extends StatelessWidget {
  final String titleName, description, bannerUrl;
  final String year;

  const InfoPage(
      {super.key,
      required this.titleName,
      required this.description,
      required this.bannerUrl,
      required this.year});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          Icon(
            Icons.cast,
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
          SizedBox(
            width: 15,
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  image: DecorationImage(
                    image: NetworkImage(bannerUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Column(
                  children: [
                    //Title Name
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            titleName,
                            style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                    // Year, season, hd
                    Row(
                      children: [
                        Text(
                          year.substring(0, 4),
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.white),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Icon(
                          Icons.eighteen_up_rating,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'season no.',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.white),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Icon(
                          Icons.hd_outlined,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Icon(
                          Icons.chat_outlined,
                          color: Colors.white,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Container(
                          height: 45,
                          width: MediaQuery.of(context).size.width - 20,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.play_arrow),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                'Play',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 7,
                    ),
                    Row(
                      children: [
                        Container(
                          height: 45,
                          width: MediaQuery.of(context).size.width - 20,
                          decoration: BoxDecoration(
                              color: Color.fromRGBO(84, 83, 83, 1),
                              borderRadius: BorderRadius.circular(5)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.file_download_outlined,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                'Download S1:E1',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    //description
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            description,
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    //cast
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            'Starring: Daniel Kaggle, Mohit Chauhan, Deepika Chopra,Sumnit Anand',
                            style: TextStyle(color: Colors.grey),
                            softWrap: true,
                            overflow: TextOverflow.ellipsis,
                          ),
                        )
                      ],
                    ),
                    //Director
                    Row(
                      children: [
                        Text(
                          'Creator: Sunil Shetty',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    //button row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                        Icon(
                          Icons.thumb_up_outlined,
                          color: Colors.white,
                        ),
                        Icon(
                          Icons.share,
                          color: Colors.white,
                        ),
                        Icon(
                          Icons.file_download_outlined,
                          color: Colors.white,
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 7),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            'My List',
                            style: TextStyle(color: Colors.white),
                          ),
                          Text('Rate', style: TextStyle(color: Colors.white)),
                          Text('share', style: TextStyle(color: Colors.white)),
                          Text('download',
                              style: TextStyle(color: Colors.white)),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
