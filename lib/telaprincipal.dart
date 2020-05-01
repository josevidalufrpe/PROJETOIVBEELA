import 'package:beela/homescreen.dart';
import 'package:flutter/cupertino.dart';

import 'main.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

class telaprincipal extends StatefulWidget {
  @override
  _telaprincipalState createState() => _telaprincipalState();
}

class _telaprincipalState extends State<telaprincipal> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.light));
    return Scaffold(
        //backgroundColor: Color(0xff95d865),
        body: Container(
            child: Center(
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 70, bottom: 30),
            height: 250,
            decoration: BoxDecoration(color: Color(0xff95d865)),
            child: Center(
              child: Image.asset("images/foto.png"),
            ),
          ),


          Padding(
            padding: EdgeInsets.only(top: 20,bottom: 10),
            child: GestureDetector(
                child: Text(
                  "Bem-vindo ao beela",
                  style: TextStyle(
                      fontSize: 21,
                      color: Colors.black,
                      fontWeight: FontWeight.w800),
                ),
                onTap: () {

                }),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 90),
            child: Text("Um aplicativo com recomendações de lazer"),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 90),
            child: Text("Acesso exclusivo com conta do Facebook",
            style: TextStyle(
              color: Color(0xff95d865),
              fontWeight: FontWeight.w600,
              fontStyle: FontStyle.italic
            ),),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 10),
            child: RaisedButton.icon(
              icon: Icon(
                Icons.sentiment_satisfied,
                color: Colors.black,
            ),
            color: Color(0xff95d865),
            label: Text('Entrar no App',
            style: TextStyle(
              color: Colors.black
            ),),
            onPressed: () {
                Navigator.push(
                  context,MaterialPageRoute(builder: (context)=> HomePage()),
                );
            },),
          ),

          Padding(
            padding: EdgeInsets.only(bottom: 10),
            child: RaisedButton.icon(
              icon: Icon(
                Icons.sentiment_dissatisfied,
                color: Colors.black,
              ),
              color: Colors.red,
              label: Text('Sair do App    ',
                style: TextStyle(
                    color: Colors.black
                ),),
              onPressed: () {
                SystemNavigator.pop();
              },),
          ),
        ],

        /*child: Text(
                  "Bem-vindo ao beela",
                  //textDirection: TextDirection.rtl,
                  style: TextStyle(
                    height: 2,
                    fontSize: 25,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    decoration: TextDecoration.none,
                  ),
                ),*/
      ),
      /*Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(top: 16, bottom: 250),
                      child: Center(
                        child: GestureDetector(
                          //color: Colors.blue[900],
                          //shape: RoundedRectangleBorder(
                          //borderRadius: BorderRadius.circular(39)),
                          child: Text(

                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            )*/
    )));
  }
}
