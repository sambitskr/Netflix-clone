import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:netflix/Info.dart';
import 'package:netflix/Tiles/ContWatching.dart';
import 'package:netflix/Tiles/Tiles.dart';
import 'package:tmdb_api/tmdb_api.dart';

class Randompage extends StatefulWidget {
  const Randompage({super.key});

  @override
  State<Randompage> createState() => _RandompageState();
}

class _RandompageState extends State<Randompage> {
  @override
  void initState() {
    loadmovies();
    super.initState();
  }

  List trendingMovies = [];
  List _tvshows = [];
  List _airingToday = [];
  final String apiKey = 'f04e5cc999451848ceaa18be32a4d5d4';
  final readaccesstoken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJmMDRlNWNjOTk5NDUxODQ4Y2VhYTE4YmUzMmE0ZDVkNCIsInN1YiI6IjY1ZDRjZDc1NDk4YmMyMDE3YTcyNWE0MiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.G9uZQIxMPHnsOlQWgpnLDLEE6F34utaLxYUn7QV8cpM';
  int _currentIndex = 0;

  loadmovies() async {
    TMDB tmdbWithCustomLogs = TMDB(
      ApiKeys(apiKey, readaccesstoken),
      logConfig: ConfigLogger(showLogs: true, showErrorLogs: true),
    );
    Map trendingResult = await tmdbWithCustomLogs.v3.trending.getTrending();
    Map tvshows = await tmdbWithCustomLogs.v3.tv.getPopular();
    Map airingToday = await tmdbWithCustomLogs.v3.movies.getRecommended(200);

    setState(() {
      trendingMovies = trendingResult['results'];
      _tvshows = tvshows['results'];
      _airingToday = airingToday['results'];
    });
    print(_airingToday[0]['poster_path']);
  }

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
    );
  }
}
