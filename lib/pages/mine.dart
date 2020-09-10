import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterwechat/views/discover_cell.dart';
import 'package:flutterwechat/childpage/childpage.dart';
import 'package:flutterwechat/data/pub_define.dart';
import 'package:flutterwechat/views/minehearder.dart';

class mine extends StatefulWidget {
  @override
  _mineState createState() => _mineState();
}



class _mineState extends State<mine> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: themeColor,

      body: MediaQuery.removePadding(context: context, child: Container(
        child: Stack(
          children: <Widget>[
            Container(
              child:  ListView(
                children: <Widget>[
                  mineheader(),
                  SizedBox(height: 5,),
                  discoverCell('支付', 'images/微信 支付.png'),
                  discoverCell('收藏', 'images/微信收藏.png'),
                  discoverCell('相册', 'images/微信相册.png'),
                  discoverCell('卡包', 'images/微信卡包.png'),
                  discoverCell('表情', 'images/微信表情.png'),
                  discoverCell('设置', 'images/微信设置.png'),

                ],


              ),

            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                GestureDetector(
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder:(BuildContext context) =>ChildPage(toptitle: '拍照',) ));

                  },
                  child:  Container(
                    color: Colors.white,
                    margin: EdgeInsets.only(top: 40,right: 10),
                    child: Image(image: AssetImage('images/相机.png'),width: 20,),
                  ),
                )


              ],

            ),//相机


          ],

        ),

      ),removeTop: true,)


    );
  }
}

