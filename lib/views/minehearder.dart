
import 'package:flutter/material.dart';
class mineheader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Container(
      color: Colors.white,
      height: 150,
      child:Container(
        margin: EdgeInsets.only(bottom: 20),

        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Row(

              children: <Widget>[
                Container(
                  child: Row(
                    children: <Widget>[
                      Container(
                        width: 50,
                        height: 50,
                        margin: EdgeInsets.only(left: 20),
//                        child: Image(image: AssetImage('images/Hank.png'),width: 50,height: 50,),
                        decoration: BoxDecoration(
                          image:DecorationImage(image:  AssetImage('images/Hank.png')) ,
                            borderRadius: BorderRadius.circular(10)
                        ),


                      ),
                      SizedBox(width: 20,),
                      Container(
                        height: 50,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text('李仁伟',style: TextStyle(fontSize: 20),),
                            Row(
                              children: <Widget>[
                                Text('微信号： ',style: TextStyle(fontSize: 15,color: Colors.grey)),
                                Text('Tezhongbing7671',style: TextStyle(fontSize: 15,color: Colors.grey)),

                              ],
                            ),

                          ],
                        ),
                      ),
                    ],
                  ),
                ),

              ],
            ),
            Container(
              height: 45,
              margin: EdgeInsets.only(right: 10,),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Image(image: AssetImage('images/搜一搜2.png'),width: 15),
                      SizedBox(width: 5,),
                      Image(image: AssetImage('images/icon_right.png'),width: 15),
                    ],
                  ),
                ],
              ),
            ),





          ],


        ),
      ),
    );
  }
}
