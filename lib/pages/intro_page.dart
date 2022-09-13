import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:systemleavesubmission/pages/home_page.dart';

class IntroPage extends StatefulWidget {
  @override
  _IntroPageState createState() => new _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  List<PageViewModel> getPages() {
    return [
      PageViewModel(
          title: "Title of first page",
          bodyWidget:    Container(
          decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage("assets/images/logoIntro.png"))),),
      ),
      PageViewModel(
        image: Image.asset("assets/images/intro2.jpeg", height: 300),
        title: "Live Demo page 2 ",
        body: "Live Demo Text",
          decoration: const PageDecoration(
              pageColor: Colors.teal,
              titleTextStyle: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
              bodyTextStyle: TextStyle(color: Colors.white)
          )),
      PageViewModel(
        image: Image.asset("assets/images/intro3.jpeg", height: 300),
        title: "Live Demo page 3",
        body: "Welcome to Proto Coders Point",
          decoration: const PageDecoration(
              pageColor: Colors.teal,
              titleTextStyle: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
              bodyTextStyle: TextStyle(color: Colors.white)
          )),
    ];
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IntroductionScreen(
        dotsDecorator: DotsDecorator(
            size: const Size.square(10.0),
            activeSize: const Size(20.0, 10.0),
            activeColor: Colors.white,
            color: Colors.black26,
            spacing: const EdgeInsets.symmetric(horizontal: 3.0),
            activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0)
            )
        ),
        globalBackgroundColor: Colors.teal,
        pages: getPages(),
        showNextButton: false,
        showSkipButton: false,
        done: Text("Masuk", style: TextStyle(color: Colors.white)),
        onDone: () {
          Route route = MaterialPageRoute(builder: (context) => HomePage());
          Navigator.push(context, route);
        }
      ),
    );
  }
}