import 'package:flutter/material.dart';
import 'package:flutterwechat/data/pub_define.dart';
import 'package:flutterwechat/views/discover_cell.dart';

class discoverPage extends StatefulWidget {
  @override
  _discoverPageState createState() => _discoverPageState();
}

class _discoverPageState extends State<discoverPage> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: themeColor,
        centerTitle: true,
        title: Text('发现',style:TextStyle(color: Colors.black) ),
        elevation: 0.0,


      ),
      body: Container(
        color: themeColor,
        height: 600,
        child: ListView(

           children: <Widget>[
             discoverCell('朋友圈', 'images/朋友圈.png'),
             SizedBox(height: 5),

             discoverCell('扫一扫', 'images/扫一扫.png'),
             line(),
             discoverCell('摇一摇', 'images/摇一摇.png'),
             SizedBox(height: 5),

             discoverCell('看一看', 'images/看一看icon.png'),
             line(),
             discoverCell('搜一搜', 'images/搜一搜.png'),
             SizedBox(height: 5),

             discoverCell('附近的人', 'images/附近的人icon.png'),
             SizedBox(height: 5),

             discoverCell('购物', 'images/购物.png',subTitle: '钱龙618限时购物',subImgName: 'images/badge.png',),
             line(),
             discoverCell('游戏', 'images/游戏.png'),
             SizedBox(height: 5),

             discoverCell('小程序', 'images/小程序.png'),
             SizedBox(height: 5),




           ],


        ),
      ),
    );
  }
}

