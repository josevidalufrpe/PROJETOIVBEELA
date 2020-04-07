import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as JSON;
import 'dart:async';


class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  bool _isLoggedIn = false;
  String _message = 'Log in/out by pressing the buttons below';
  Map userProfile;
  final facebookLogin = FacebookLogin();

  _loginWithFB() async {
    final result = await facebookLogin.logInWithReadPermissions(['email']);

    switch (result.status) {
      case FacebookLoginStatus.loggedIn:
        final FacebookAccessToken  accessToken = result.accessToken;
        _showMessage('''
         Logged in!
         Token: ${accessToken.token}
         User id: ${accessToken.userId}
         Expires: ${accessToken.expires}
         Permissions: ${accessToken.permissions}
         Declined permissions: ${accessToken.declinedPermissions}''');

        break;

      case FacebookLoginStatus.cancelledByUser:
        _showMessage('Login cancelled by the user.');
        break;
      case FacebookLoginStatus.error:
        _showMessage('Something went wrong with the login process.\n'
            'Here\'s the error Facebook gave us: ${result.errorMessage}');
        break;
    }
  }
  _logout(){
    facebookLogin.logOut();
    setState(() {
      _isLoggedIn = false;
    });

  }
  void _showMessage(String message) {
    setState(() {
      _message = message;
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