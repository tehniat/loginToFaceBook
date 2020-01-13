//import 'package:flutter/cupertino.dart';
//import 'package:flutter/material.dart';
//import 'dart:io';
//import 'package:flutter/services.dart';
//import 'package:regexed_validator/regexed_validator.dart';

//import 'package:flutter/services.dart';
//import 'package:flutter/widgets.dart';
//import 'package:regexed_validator/regexed_validator.dart';
//import 'package:email_validator/email_validator.dart';
//import'package:login4/login_screen.dart';
//import com.facebook.FacebookSdk;
//import com.facebook.appevents.AppEventsLogger;

//final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();
//void main(List<String> args) {
  //runApp(
    //MaterialApp(
      //debugShowCheckedModeBanner: false,
      //home: Scaffold(
        //body: MyConfigurationClass(),
        //key: scaffoldKey,
      //),
    //),
  //);
//}

//class MyConfigurationClass extends StatefulWidget
//{
  //@override
  //MyLoginScreenState createState() => MyLoginScreenState();
//}
//

import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as JSON;

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  bool _isLoggedIn = false;
  Map userProfile;
  final facebookLogin = FacebookLogin();

  _loginWithFB() async{


    final result = await facebookLogin.logInWithReadPermissions(['email']);

    switch (result.status) {
      case FacebookLoginStatus.loggedIn:
        final token = result.accessToken.token;
        final graphResponse = await http.get('https://graph.facebook.com/v2.12/me?fields=name,picture,email&access_token={$token}');
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
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        body: Center(
            child: _isLoggedIn
                ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.network(userProfile["picture"]["data"]["url"], height: 50.0, width: 50.0,),
                Text(userProfile["name"]),
                OutlineButton( child: Text("Logout"), onPressed: (){
                  _logout();
                },)
              ],
            )
                : Center(
              child: OutlineButton(
                child: Text("Login with Facebook"),
                onPressed: () {
                  _loginWithFB();
                },
              ),
            )),
      ),
    );
  }
}



































/*import 'package:flutter/material.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:loginscreen/Data/constants.dart';
//import 'package:loginscreen/widgets/custom_button.dart';

final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();
void main(List<String> args) {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: LoginScreen(),
        key: scaffoldKey,
      ),
    ),
  );
}

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with Functions {
  final dbref = Firestore.instance;
  Pattern passPattern = r'^[A-Za-z]+.*[0-9]+$';
  RegExp passRegex;
  TextEditingController email = TextEditingController();

  TextEditingController pass = TextEditingController();

  final _signUpForm = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    passRegex = new RegExp(passPattern);
    onTap() {}
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Center(
                child: Image(
              image: AssetImage('images/login_image.png'),
              height: 150,
              width: 150,
            )),
            Padding(
              padding: const EdgeInsets.all(50.0),
              child: Center(
                child: Form(
                  key: _signUpForm,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      TextFormField(
                        controller: email,
                        validator: (value) {
                          value = value.trim();
                          if (value.isEmpty) return 'Input email';
                          if (!value.contains('@') || !value.contains('.com')) {
                            return 'Input a valid email address';
                          }
                        },
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          hintText: 'Email',
                          prefixIcon: Icon(
                            Icons.person,
                          ),
                        ),
                      ),
                      TextFormField(
                        controller: pass,
                        obscureText: true,
                        validator: (value) {
                          value = value.trim();
                          if (value.isEmpty) return 'Input password';
                          if (!passRegex.hasMatch(value)) {
                            return "Start with alphabet and end with number.";
                          }
                        },
                        decoration: InputDecoration(
                            hintText: 'Password',
                            prefixIcon: Icon(
                              Icons.vpn_key,
                            )),
                      ),
                      /* RaisedButton(
                        onPressed: () async {
                          if (this._signUpForm.currentState.validate()) {
                            if (await auth(email.text, pass.text)) {
                              scaffoldKey.currentState.showSnackBar(SnackBar(
                                content: Text('Signed in Sucessfully!'),
                              ));
                            } else {
                              scaffoldKey.currentState.showSnackBar(SnackBar(
                                content: Text('Sign in Failed!'),
                              ));
                            }
                          }
                          pass.clear();
                          email.clear();
                        },
                        child: Text('Sign In'),
                      ) */
                      CustomButton(
                        ontap: () async {
                          if (this._signUpForm.currentState.validate()) {
                            if (await auth(email.text, pass.text)) {
                              scaffoldKey.currentState.showSnackBar(SnackBar(
                                content: Text('Signed in Sucessfully!'),
                              ));
                            } else {
                              scaffoldKey.currentState.showSnackBar(SnackBar(
                                content: Text('Sign in Failed!'),
                              ));
                            }
                          }
                          pass.clear();
                          email.clear();
                        },
                        buttonType: Constants.flatButton,
                        text: 'Sign In',
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  auth(paramUser, paramPass) async {
    bool check = false;
    QuerySnapshot snapshot = await dbref.collection("Users").getDocuments();
    snapshot.documents.forEach((f) {
      if (f.data['user'] == paramUser && f.data['password'] == paramPass) {
        check = true;
      }
    });
    return check;
  }
}
*/






























