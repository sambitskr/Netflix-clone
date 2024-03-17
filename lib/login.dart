import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:netflix/HomeScreen.dart';
import 'package:netflix/Registration/registration1.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();

  void loginAccount() async {
    String email = emailcontroller.text.trim();
    String password = passwordcontroller.text.trim();

    if (email == '' || password == '') {
      log('please fill in the login details ');
    } else {
      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: email, password: password);
        if (userCredential.user != null) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const MyHomeScreen()),
          );
        }
      } on FirebaseAuthException catch (ex) {
        log(ex.code.toString());
      }

      log('Account signed in');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        // leading: Image.asset('Images/netflex.png'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_sharp),
          color: Colors.white,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Image.asset(
          'Images/netflex.png',
          height: 100,
          width: 100,
        ),
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.only(left: 25, right: 25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // email
            TextField(
              controller: emailcontroller,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                labelText: 'Email',
              ),
            ),
            SizedBox(
              height: 20,
            ),
            //password
            TextField(
              controller: passwordcontroller,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                labelText: 'Password',
              ),
            ),
            SizedBox(
              height: 20,
            ),
            //SIGN in
            GestureDetector(
              onTap: () {
                loginAccount();
              },
              child: Container(
                height: 50,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: Colors.white),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Sign in',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            //frogot password
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Forgot password?',
                  style: TextStyle(color: Colors.white),
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            //new to netflix
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Registration1()),
                    );
                  },
                  child: Text(
                    'New to Netflix? Sign up now.',
                    style: TextStyle(color: Colors.white),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            //google re captcha
            Row(
              children: [
                Expanded(
                  child: Text(
                    "Sign in is protected by Google reCAPTCHA to ensure you're not a bot. Learn more. ",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.grey),
                  ),
                )
              ],
            ),
          ],
        ),
      )),
    );
  }
}
