import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'Authentication/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 5), () async {

        Route route = MaterialPageRoute(builder: (_) => const LoginScreen());
        Navigator.pushReplacement(context, route);

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          //-------------------logo & title-----------------------//
          Expanded(
            flex: 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const CircleAvatar(
                  backgroundColor: Color(0xFFF8991D),
                  radius: 65.0,
                  child: Image(
                    image: AssetImage('assets/splash/autoparts.png'),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 10.0),
                ),
                RichText(
                  text: const TextSpan(
                    text: "Auto",
                    style: TextStyle(
                      shadows: [
                        BoxShadow(
                          color: Colors.deepPurple,
                          blurRadius: 2,
                        ),
                      ],
                      color: Colors.black,
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: "Shop",
                        style: TextStyle(
                          shadows: [
                            BoxShadow(
                              color: Colors.deepPurple,
                              blurRadius: 2,
                            ),
                          ],
                          color: Colors.deepOrange,
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          //------------------------short msg----------------------------//
          const Expanded(
            flex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SpinKitThreeBounce(
                  color: Colors.deepOrangeAccent,
                  size: 25.0,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20.0),
                ),
                Text(
                  'Save Time \nBook your repairs ahead of time',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
