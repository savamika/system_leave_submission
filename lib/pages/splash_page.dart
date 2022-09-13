import 'package:splashscreen/splashscreen.dart';
import 'package:flutter/material.dart';
import 'package:systemleavesubmission/pages/intro_page.dart';
import 'package:systemleavesubmission/pages/home_page.dart';

class SpashPage extends StatefulWidget {
  @override
  _SpashPageState createState() => new _SpashPageState();
}

class _SpashPageState extends State<SpashPage> {

  @override
  Widget build(BuildContext context) {
    return new SplashScreen(
        seconds: 4,
        navigateAfterSeconds: new HomePage(),
        image: new Image.asset('assets/images/logoIntro.png'),
        backgroundColor: Colors.teal,
        photoSize: 120.0,
        loaderColor: Colors.black
    );
  }
}