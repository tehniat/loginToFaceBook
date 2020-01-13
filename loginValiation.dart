import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';
void main() => runApp(MyApp());
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(title: 'Flutter Demo Home Page'),
    );
  }
}

class LoginPage extends StatefulWidget {
  LoginPage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;
  @override
  // create LoginGUI state
  _LoginGUI createState() => _LoginGUI();
//
}

// Class to create two text field and one button
class _LoginGUI  extends State<LoginPage> {
  //first generate form key so that you can use the component of it for validation
  final _formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return
      Form(
        key: _formKey,
        child: new Column(
          children: <Widget>[
            new TextFormField(
              decoration: InputDecoration(
                  hintText: "aa@bb.com",
                  labelText: "Email"
              ),
              keyboardType: TextInputType.emailAddress,
              validator: (val) {
                if (val.length == 0)
                  return "Please enter email";
                else if (!val.contains("@"))
                  return "Please enter valid email";
                else
                  return null;
              },
              onSaved: (val) => _email = val,
            ),
            new TextFormField(
              decoration: InputDecoration(
                  hintText: "Password",
                  labelText: "Password"
              ),
              obscureText: true,
              validator: (val) {
                if (val.length == 0)
                  return "Please enter password";
                else if (val.length <= 5)
                  return "Your password should be more then 6 char long";
                else
                  return null;
              },
              onSaved: (val) => _password = val,
            ),
            new Padding(
              padding: const EdgeInsets.only(top: 20.0),
            ),
            new RaisedButton(
              child: new Text("Submit"),
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  _formKey.currentState.save();
                  _scaffoldKey.currentState.showSnackBar(new SnackBar(
                    content: new Text(
                        "Your email: $_email and Password: $_password"),
                  ));
                }
              },
              color: Colors.blue,
              highlightColor: Colors.blueGrey,
            )
          ],
        ),
      );

  }
}

























































}






















}