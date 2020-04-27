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
  Map userProfile;
  final facebookLogin = FacebookLogin();


  _loginWithFB() async{
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
        setState(() => _isLoggedIn = false );
        break;
      case FacebookLoginStatus.error:
        setState(() => _isLoggedIn = false );
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
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarBrightness: Brightness.light
      ));
      // TODO: implement build
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          /*backgroundColor: Colors.lightGreen[400],*/
          body: Container(
            decoration: BoxDecoration(color: Color(0xff95d865)),
            padding: EdgeInsets.only(
                top: 60,
                left: 40,
                right: 40,
            ),
            child: Center(
              child:SingleChildScrollView(




                child: _isLoggedIn
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                            padding: EdgeInsets.only(bottom: 32),
                            child: Image.network(
                              userProfile["picture"]["data"]["url"],
                              height: 50.0,
                              width: 50.0,
                            ),
                          ),
                          Text(userProfile["name"]),
                          OutlineButton(
                            child: Text("Logout"),
                            onPressed: (){
                              _logout();
                              },
                            )
                        ],
                    )


                  : RaisedButton(
                      color: Colors.blue[800],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(39)
                      ),
                      child: Text(
                          "Login com o Facebook",
                      style: TextStyle(
                        fontSize: 17,
                        color: Colors.white,
                        fontWeight: FontWeight.w800
                      ),),
                      onPressed: () {
                        _loginWithFB();
                      },
                  ),
                ),
              ),
            ),
          ),

        );
    }
  }