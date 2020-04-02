import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as JSON;


class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  bool _isLoggedIn = false;
  Map userProfile;
  final facebookLogin = FacebookLogin();

  _loginWithFB() async {
    final result = await facebookLogin.logInWithReadPermissions(['email']);

    switch (result.status) {
      case FacebookLoginStatus.loggedIn:
        final token = result.accessToken.token;
        final graphResponse = await http.get(
            'https://graph.facebook.com/v2.12/me?fields=name,picture,email&access_token=${token}');
        final profile = JSON.jsonDecode(graphResponse.body);
        print(profile);
        setState(() {
          userProfile = profile;
          _isLoggedIn = true;
        });
        break;

      case FacebookLoginStatus.cancelledByUser:
        setState(() => _isLoggedIn = false);
        break;
      case FacebookLoginStatus.error:
        setState(() => _isLoggedIn = false);
        break;
    }
  }
  _logout(){
    facebookLogin.logOut();
    setState(() {
      _isLoggedIn = false;
    });

  }


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
        child: _isLoggedIn
          ? Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(15),
              ),
              Image.network(
                userProfile["picture"]["data"]["url"],
                height: 50.0,
                width: 50.0,
              ),
              Text(userProfile["name"]),
              //Image.asset("images/facebook.png", height: 70,),
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
                  _loginWithFB();
                  setState(() {
                    //_texto = "Login efetuado com sucesso";
                  });
                },
                color: Colors.blue[900],
                child: Text(
                  "Login com Facebook",
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
          )
         : OutlineButton(
            child: Text("Sair") ,
            onPressed: (){
              _logout();
          },
        ),

        ),
      );


  }
}