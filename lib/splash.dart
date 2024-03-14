import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:netflix/intro_pages/introduction.dart';
import 'package:netflix/intro_pages/introduction1.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    navigatetologin();
  }

  navigatetologin() async {
    await Future.delayed(
      const Duration(milliseconds: 4000),
      () {},
    );
    // ignore: use_build_context_synchronously
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const Introduction()));
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Center(
          child: Lottie.asset(
            'assets/netflixAnimation.json',
          ),
        ),
      ),
    );
  }
}
