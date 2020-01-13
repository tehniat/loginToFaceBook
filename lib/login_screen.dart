import 'package:login4/MainFile.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:login4/CustomButtonV2.dart';
import 'package:email_validator/email_validator.dart';

class MyLoginScreenState extends State<MyConfigurationClass>
{
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
    //onTap() {}
  }
//This function is necessary for facebook to get app how many people has activate ur app and other demographic information
 /* @Override
  public void onCreate() {
    super.onCreate();
    FacebookSdk.sdkInitialize(getApplicationContext());
    AppEventsLogger.activateApp(this);
  }*/
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
                          value = value
                              .trim(); // trim any white space to avoid user press space
                          if (value.isEmpty) return 'Input email';
                          if (!EmailValidator.validate(value)) {
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
                      //MyCustomButton(


                       // onTap: () async {
                          //if (this._signUpForm.currentState.validate()) {
                          //  if (await auth(email.text, pass.text)) {
                            //  scaffoldKey.currentState.showSnackBar(SnackBar(
                              //  content: Text('Signed in Sucessfully!'),
                              //));
                            //} else {
                              //scaffoldKey.currentState.showSnackBar(SnackBar(
                                //content: Text('Sign in Failed!'),
                              //));
                           // }
                          //}
                          //pass.clear();
                          //email.clear();
                        //},
                        //buttonType: Constants.flatButton,
                        //text: 'Sign In',
 //                     ),
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
}