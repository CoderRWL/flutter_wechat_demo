import 'package:flutter/material.dart';
import 'package:flutterwechat/data/pub_define.dart';

class ChildPage extends StatelessWidget {
  
  final String toptitle;
  final String title;
  
  ChildPage(
  {
    this.toptitle,
    this.title,
}
      );
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text(title ==null ? toptitle:title,style: TextStyle(color: Colors.black),),
        centerTitle: true,
        elevation: 0.0,
      ),
      
      body: Center(
        child: Text(toptitle),
      ),
      
    );
  }
}
