import 'package:flutter/material.dart';
import 'package:netflix/ComingSoon.dart';
import 'package:netflix/Downloads.dart';
import 'package:netflix/HomeScreen.dart';
import 'package:netflix/Info.dart';
import 'package:netflix/intro_pages/introduction.dart';
import 'package:netflix/random.dart';
import 'package:netflix/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Netflix',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SplashPage(),
    );
  }
}
