
import 'package:flutter/material.dart';

final Color themeColor = Color.fromRGBO(240, 240, 240, 1);

double  ScrW(BuildContext context) => MediaQuery.of(context).size.width;
double  ScrH(BuildContext context) => MediaQuery.of(context).size.height;

Widget line(){
  return Container(
    height: 0.5,

    child: Row(
      children: <Widget>[
        Container(
          width: 45,
          height: 0.5,
          color: Colors.white,
        ),
        Expanded(
          child:  Container(
            height: 0.5,
            color: Color.fromRGBO(1, 1, 1, 0.1),
          ),)
      ],

    ),

  );
}


