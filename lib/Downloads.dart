import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DownloadPage extends StatefulWidget {
  const DownloadPage({super.key});

  @override
  State<DownloadPage> createState() => _DownloadPageState();
}

class _DownloadPageState extends State<DownloadPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'Downloads',
          style: TextStyle(color: Colors.white),
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
          child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Column(
          children: [
            Row(
              children: [
                Icon(
                  Icons.settings,
                  color: Colors.grey,
                ),
                SizedBox(
                  width: 7,
                ),
                Text(
                  'Smart Downloads',
                  style: TextStyle(color: Colors.grey),
                )
              ],
            ),
            SizedBox(
              height: 100,
            ),
            Row(
              children: [
                Text(
                  'Turn on Downloads for You',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 23,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              children: [
                Expanded(
                  child: Text(
                    'We will download movies and shows just for you, so you will always have something to watch.',
                    softWrap: true,
                    style: TextStyle(color: Colors.grey),
                  ),
                )
              ],
            )
          ],
        ),
      )),
    );
  }
}
