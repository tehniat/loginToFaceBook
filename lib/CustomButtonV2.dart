
//class  extends StatefulWidget
//{
  //@override

//}


import 'package:flutter/material.dart';

class MyCustomButton extends StatelessWidget
{ 
    // Function _onTap;
    // const double height;
     //const double width;
     //String label;
      //String buttonType;
    //MyCustomButtonCustomBotton(height, width, buttonType)
    //{
      //  this.height=height;
        //this.width=width;
        //this.label=label;
        //this.buttonType=buttonType;
        //this._onTap=onTap;
    //}

    @override
    Widget build (BuildContext context) {
      //switch (this.buttonType) {
        //case "RaisedButton":
          //{
            return RaisedButton(
              color: Colors.green,
              splashColor: Colors.greenAccent,
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const <Widget>[
                    Icon(
                      Icons.face,
                      color: Colors.amber,
                    ),
                    SizedBox(width:10.0,),
                    Text('login', maxLines: 1,
                      style: TextStyle(color: Colors.white),),
                  ],

                ),

              ),
              shape: StadiumBorder(),
              onPressed: (){},

            );
          }
      }








