import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    return new Scaffold(
      backgroundColor: Colors.lightGreen[400],
      /*appBar: AppBar(
        //title: Text("Beela"),
        backgroundColor: Colors.lightGreen[400],
      ),*/
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            border: Border.all(width: 0, color: Colors.white)
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(15),
            ),
            Image.asset("images/facebook.png", height: 70,),
            Text(
              "Continar o login com o seu Perfil",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                  color: Colors.black
              ),
            ),
            Text(
              "O LoginApp receberá seu perfil público.",
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.black
              ),
            ),
            Text(
              "Saber mais",
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.black
              ),
            ),
            RaisedButton(
              onPressed: () {
                setState(() {
                  //_texto = "Login efetuado com sucesso";
                });
              },
              color: Colors.blue[900],
              child: Text(
                "Continuar",
                style: TextStyle(
                    fontSize: 17,
                    color: Colors.white,
                    fontWeight: FontWeight.w500
                ),
              ),
            ),
            Text(
              "Isso não permite que o aplicativo seja postado no Facebook",
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.black
              ),
            ),
            //Text("Nome: $_texto ")
          ],
        ),
      ),

    );
  }
}