import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:netflix/Tiles/comingsoonTiles.dart';
import 'package:tmdb_api/tmdb_api.dart';

class ComingsoonPage extends StatefulWidget {
  const ComingsoonPage({super.key});

  @override
  State<ComingsoonPage> createState() => _ComingsoonPageState();
}

class _ComingsoonPageState extends State<ComingsoonPage> {
  void initState() {
    loadmovies();

    super.initState();
  }

  List trendingMovies = [];
  List _tvshows = [];
  List _movies = [];
  List _tvThrillers = [];
  List _contWatch = [];
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
    Map movies = await tmdbWithCustomLogs.v3.movies.getPopular();
    Map tvThrillers = await tmdbWithCustomLogs.v3.tv.getTopRated();
    Map contWatch = await tmdbWithCustomLogs.v3.movies.getNowPlaying();

    setState(
      () {
        trendingMovies = trendingResult['results'];
        _tvshows = tvshows['results'];
        _movies = movies['results'];
        _tvThrillers = tvThrillers['results'];
        _contWatch = contWatch['results'];
      },
    );
  }

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
      body: SingleChildScrollView(
        child: Column(
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
                      child: ListView.builder(
                          itemCount: trendingMovies.length,
                          scrollDirection: Axis.vertical,
                          itemBuilder: (context, index) {
                            return ComingsoonTile(
                              desc: trendingMovies[index]['overview'],
                              coverURL: 'https://image.tmdb.org/t/p/w500' +
                                  trendingMovies[index]['backdrop_path'],
                              rDate:
                                  trendingMovies[index]['release_date'] != null
                                      ? trendingMovies[index]['release_date']
                                      : 'Nothingg  ',
                              name: trendingMovies[index]['title'] != null
                                  ? trendingMovies[index]['title']
                                  : 'Loading',
                            );
                          }),
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
