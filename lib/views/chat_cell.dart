
import 'package:flutter/material.dart';
import 'package:flutterwechat/childpage/childpage.dart';
import 'package:flutterwechat/data/pub_define.dart';

class ChatCell extends StatelessWidget {

  final String imgUrl;
  final String name;
  final String message;
  final String time;
  final RichText richText;


  ChatCell({

    this.imgUrl,
    this.name,
    this.message,
    this.time,
    this.richText,
  }) ;

  @override
  Widget build(BuildContext context) {

    return Column(
      children: <Widget>[
    Container(
    color: Colors.white,
      padding: EdgeInsets.all(10.0),
      child:GestureDetector(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){
            return ChildPage(toptitle: message,title: name,);
          }));
        },
        child:
        Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    image: DecorationImage(image: NetworkImage(imgUrl),),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),

                Container(
                  width: ScrW(context) -60-50,
                  height: 40,
                  child:  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      richText==null? Text(name,style: TextStyle(fontSize: 13,color: Colors.black),): richText,
                      Text(message,style: TextStyle(fontSize: 10,color: Color.fromRGBO(0, 0, 0, 0.7)),overflow:TextOverflow.ellipsis ,),

                    ],
                  ),
                ),

               Stack(
                 alignment: Alignment(0, 0.5),
                 children: <Widget>[
                   Container(
                     height: 48,
                   ),
                   Text(time,style: TextStyle(fontSize: 10,color: Colors.grey),),
                 ],
               ),





              ],

            ),

          ],
        ),
      ),


    ),
      line(),
      ],
    );
  }
}
