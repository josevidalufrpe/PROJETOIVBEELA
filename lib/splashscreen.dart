import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/services.dart';

class SplashPage extends StatefulWidget {
  @override
  SplashPageState createState() => SplashPageState();

}

class SplashPageState extends State<SplashPage> {
  void navigationToNextPage(){
    Navigator.pushReplacementNamed(context, '/HomePage');
  }

  startSplashScreenTime() async {
    var _duration = new Duration(seconds: 4);
    return new Timer(_duration, navigationToNextPage);
  }

  @override
  void initState() {
    super.initState();
    startSplashScreenTime();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);

    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset("images/facebook.png", height: 100,),
            Text(
                "Beela",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.lightGreen[400]
              ),
            )
          ],
        ),
      )
      //child: new Image.asset("images/facebook.png", height: 100,),
    );
  }
}