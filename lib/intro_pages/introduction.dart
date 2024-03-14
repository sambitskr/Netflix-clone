import 'package:flutter/material.dart';
import 'package:netflix/HomeScreen.dart';
import 'package:netflix/Registration/registration1.dart';
import 'package:netflix/intro_pages/introduction1.dart';
import 'package:netflix/intro_pages/introduction2.dart';
import 'package:netflix/intro_pages/introduction3.dart';
import 'package:netflix/intro_pages/introduction4.dart';
import 'package:netflix/login.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Introduction extends StatefulWidget {
  const Introduction({super.key});

  @override
  State<Introduction> createState() => _IntroductionState();
}

class _IntroductionState extends State<Introduction> {
  final PageController _controller = PageController();

  bool onLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 2,
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
                Text(
                  'PRIVACY',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                Text(
                  'FAQs',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                Text(
                  'HELP',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginPage()),
                    );
                  },
                  child: Text(
                    'LOG IN',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            onPageChanged: (index) {
              setState(
                () {
                  onLastPage = (index == 2);
                },
              );
            },
            children: [
              Introduction1(),
              Introduction2(),
              Introduction3(),
              Introduction4(),
            ],
          ),
          Container(
            alignment: const Alignment(0, 0.65),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SmoothPageIndicator(controller: _controller, count: 4),
              ],
            ),
          ),
          Container(
            // color: Color.fromRGBO(0, 0, 0, 0.5),
            alignment: const Alignment(0, 0.85),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const Registration1()),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(4),
                ),
                height: 50,
                width: MediaQuery.of(context).size.width * 0.9,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Get started',
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
