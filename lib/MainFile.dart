import 'package:flutter/material.dart';
import 'package:login4/login_screen.dart';
final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();//for form only
void main()
{
  runApp(MaterialApp(
      title:'CustomButtonDemoApp',
      home:Scaffold(
        body:MyConfigurationClass(),
        key:scaffoldKey,
      ),


    )
  );
}

class MyConfigurationClass extends StatefulWidget
{
  @override
  // write the name of class that is creating your state
MyLoginScreenState createState()=>MyLoginScreenState();
}
/*class MyLoginScreenState extends State<MyConfigurationClass>
{

// declare all the user defined variable here
// must write build function
// user defined functions can be written below or above build function
Widget build(BuildContext context)
{
  // where write code to generate screen
}
}*/