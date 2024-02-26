import 'dart:math';

import 'package:flutter/material.dart';
import 'package:netflix/Info.dart';
import 'package:netflix/Tiles/ContWatching.dart';
import 'package:netflix/Tiles/Tiles.dart';
import 'package:tmdb_api/tmdb_api.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  void initState() {
    loadmovies();

    super.initState();
  }

  List trendingMovies = [];
  List _tvshows = [];
  final String apiKey = 'f04e5cc999451848ceaa18be32a4d5d4';
  final readaccesstoken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJmMDRlNWNjOTk5NDUxODQ4Y2VhYTE4YmUzMmE0ZDVkNCIsInN1YiI6IjY1ZDRjZDc1NDk4YmMyMDE3YTcyNWE0MiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.G9uZQIxMPHnsOlQWgpnLDLEE6F34utaLxYUn7QV8cpM';

  Future loadmovies() async {
    TMDB tmdbWithCustomLogs = TMDB(
      ApiKeys(apiKey, readaccesstoken),
      logConfig: ConfigLogger(showLogs: true, showErrorLogs: true),
    );
    Map trendingResult = await tmdbWithCustomLogs.v3.trending.getTrending();
    Map tvshows = await tmdbWithCustomLogs.v3.tv.getPopular();

    setState(
      () {
        trendingMovies = trendingResult['results'];
        _tvshows = tvshows['results'];
      },
    );
  }

  Random random = Random();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 1,
        shadowColor: Colors.black,
        //Netflix Logo
        leading: Image.asset(
          'Images/netflixIcon.png',
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 8.0),
            child: Row(
              children: [
                Icon(
                  Icons.search_rounded,
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
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 10.0, top: 5.0),
            child: Column(
              children: [
                //Category row
                Row(
                  children: [
                    Container(
                      height: 25,
                      width: 75,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: Colors.white),
                      ),
                      child: Center(
                        child: Text(
                          'TV Shows',
                          style: TextStyle(fontSize: 12, color: Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      height: 25,
                      width: 75,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: Colors.white),
                      ),
                      child: Center(
                        child: Text(
                          'Movies',
                          style: TextStyle(fontSize: 12, color: Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      height: 25,
                      width: 75,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: Colors.white),
                      ),
                      child: Center(
                        child: Text(
                          'Categories',
                          style: TextStyle(fontSize: 12, color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
                // show of thr day
                Padding(
                  padding: EdgeInsets.only(
                    top: 15,
                    bottom: 15,
                    right: 25,
                    left: 25,
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.53,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(12),
                            image: DecorationImage(
                                image: AssetImage('Images/cars.jpg'),
                                // image: NetworkImage(
                                //     'https://image.tmdb.org/t/p/w500' +
                                //         _airingToday[random
                                //                 .nextInt(_airingToday.length)]
                                //             ['poster_path']),
                                fit: BoxFit.cover),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 15,
                        left: 10,
                        right: 10,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            //play button
                            Container(
                              height: 30,
                              width: 140,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(3),
                                color: Colors.white,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.play_arrow),
                                  Text(
                                    'Play',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),

                            //my list button
                            Container(
                              height: 30,
                              width: 130,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(3),
                                color: Color.fromRGBO(128, 128, 128, 0.5),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.add,
                                    color: Colors.white,
                                  ),
                                  Text(
                                    'My List',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
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
                //Continue watching
                Row(
                  children: [
                    Text(
                      'Continue Watching for [Profile name]',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.white),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                //continue watching tiles

                Container(
                  height: 200,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: trendingMovies.length,
                    itemBuilder: (context, index) {
                      return ContWatchingTiles(
                        imagePathh: 'https://image.tmdb.org/t/p/w500' +
                            trendingMovies[index]['poster_path'],
                        titleNamee: trendingMovies[index]['title'] != null
                            ? trendingMovies[index]['title']
                            : 'Loading',
                        descriptionn: trendingMovies[index]['overview'],
                        bannerUrll: 'https://image.tmdb.org/t/p/w500' +
                            trendingMovies[index]['backdrop_path'],
                        yearr: trendingMovies[index]['release_date'] != null
                            ? trendingMovies[index]['release_date']
                            : 'NA   ',
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                //ensemble TV shows
                Row(
                  children: [
                    Text(
                      'Whats Trending?',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.white),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  height: 150,
                  child: ListView.builder(
                    itemCount: trendingMovies.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => InfoPage(
                                titleName:
                                    trendingMovies[index]['title'] != null
                                        ? trendingMovies[index]['title']
                                        : 'Loading',
                                description: trendingMovies[index]['overview'],
                                bannerUrl: 'https://image.tmdb.org/t/p/w500' +
                                    trendingMovies[index]['backdrop_path'],
                                year: trendingMovies[index]['release_date'] !=
                                        null
                                    ? trendingMovies[index]['release_date']
                                    : 'NA   ',
                              ),
                            ),
                          );
                        },
                        child: Tiles(
                          imagePath: 'https://image.tmdb.org/t/p/w500' +
                              trendingMovies[index]['poster_path'],
                        ),
                      );
                    },
                    // children: [
                    //   Tiles(
                    //     imagePath: 'https://image.tmdb.org/t/p/w500' +
                    //         trendingMovies[index]['poster'],
                    //   ),
                    //   Tiles(),
                    //   Tiles(),
                    //   Tiles(),
                    //   Tiles(),
                    // ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                //Familiar TV favorites
                Row(
                  children: [
                    Text(
                      'Familiar TV Favorites',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.white),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  height: 150,
                  child: ListView.builder(
                    itemCount: _tvshows.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => InfoPage(
                                titleName:
                                    _tvshows[index]['original_name'] != null
                                        ? _tvshows[index]['original_name']
                                        : 'Loading',
                                description: _tvshows[index]['overview'],
                                bannerUrl: 'https://image.tmdb.org/t/p/w500' +
                                    _tvshows[index]['backdrop_path'],
                                year: _tvshows[index]['first_air_date'] != null
                                    ? _tvshows[index]['first_air_date']
                                    : 'NA   ',
                              ),
                            ),
                          );
                        },
                        child: Tiles(
                            imagePath: 'https://image.tmdb.org/t/p/w500' +
                                _tvshows[index]['poster_path']),
                      );
                    },
                  ),
                ),
                //Popular on netflix
                Row(
                  children: [
                    Text(
                      'Popular on Netflix',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.white),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                // Container(
                //   height: 150,
                //   child: ListView(
                //     scrollDirection: Axis.horizontal,
                //     children: [
                //       Tiles(),
                //       Tiles(),
                //       Tiles(),
                //       Tiles(),
                //       Tiles(),
                //     ],
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
