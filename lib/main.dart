import 'package:beela/homescreen.dart';
import 'package:beela/splashscreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



void main() => runApp(new MyApp());




class MyApp extends StatelessWidget {

  @override
 Widget build(BuildContext context) {

    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Principal',
      home: new SplashPage(),
      routes: <String, WidgetBuilder>{
        '/HomePage': (BuildContext context)=> new HomePage()
      },
    );

  }
}


