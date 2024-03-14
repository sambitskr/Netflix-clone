import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:netflix/HomeScreen.dart';

class Introduction1 extends StatelessWidget {
  const Introduction1({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage(
              'Images/Background.jpg',
            ),
            fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        extendBodyBehindAppBar: true,
        // appBar: AppBar(
        //   backgroundColor: Colors.transparent,
        //   elevation: 2,
        //   shadowColor: Colors.black,
        //   //Netflix Logo
        //   leading: Image.asset(
        //     'Images/netflixIcon.png',
        //   ),
        //   actions: [
        //     Padding(
        //       padding: EdgeInsets.only(right: 8.0),
        //       child: Row(
        //         children: [
        //           Text(
        //             'PRIVACY',
        //             style: TextStyle(
        //               color: Colors.white,
        //               fontWeight: FontWeight.bold,
        //             ),
        //           ),
        //           SizedBox(
        //             width: 15,
        //           ),
        //           Text(
        //             'FAQs',
        //             style: TextStyle(
        //               color: Colors.white,
        //               fontWeight: FontWeight.bold,
        //             ),
        //           ),
        //           SizedBox(
        //             width: 15,
        //           ),
        //           Text(
        //             'HELP',
        //             style: TextStyle(
        //               color: Colors.white,
        //               fontWeight: FontWeight.bold,
        //             ),
        //           ),
        //           SizedBox(
        //             width: 15,
        //           ),
        //           GestureDetector(
        //             onTap: () {
        //               Navigator.push(
        //                 context,
        //                 MaterialPageRoute(
        //                     builder: (context) => const MyHomeScreen()),
        //               );
        //             },
        //             child: Text(
        //               'LOG IN',
        //               style: TextStyle(
        //                 color: Colors.white,
        //                 fontWeight: FontWeight.bold,
        //               ),
        //             ),
        //           ),
        //         ],
        //       ),
        //     ),
        //   ],
        // ),
        body: Column(
          children: [
            Container(
              color: Color.fromRGBO(0, 0, 0, 0.5),
              height: MediaQuery.of(context).size.height * 0.6,
              width: MediaQuery.of(context).size.width,
            ),
            Container(
              color: Color.fromRGBO(0, 0, 0, 0.5),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Unlimited\nentertainment, one\nlow price',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 35,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'All of netflix, starting at just ₹149.',
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
