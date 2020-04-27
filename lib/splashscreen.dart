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
    var _duration = new Duration(seconds: 2);
    return new Timer(_duration, navigationToNextPage);
  }

  @override
  void initState() {
    super.initState();
    startSplashScreenTime();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.light
    ));



    return MaterialApp(
        debugShowCheckedModeBanner: false,

        home: Scaffold(

          backgroundColor: Colors.black54,
          body: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  width: 720,
                  height: 240,

                  child:Image.asset("images/logo.png",
                    width: 40,
                    height: 90,
                ),
                )
              /*Text(
                "BeelaApp",
                style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 50,
                    fontStyle: FontStyle.italic,
                    //height: 50,
                    color: Colors.lightGreenAccent[700]
                ),
              )*/
            ],
          ),
        )
    )
      //child: new Image.asset("images/facebook.png", height: 100,),
    );
  }
}