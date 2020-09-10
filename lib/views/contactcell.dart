

import 'package:flutter/material.dart';
import 'package:flutterwechat/data/pub_define.dart';

class contact_cell extends StatefulWidget {

  String imgUrl;
  String assetImgName;
  String name;
  String indexLetter;


  contact_cell(

      this.name,
      {
        this.imgUrl,
        this.assetImgName,
    this.indexLetter,
});


  @override
  _contact_cellState createState() => _contact_cellState();
}

class _contact_cellState extends State<contact_cell> {


  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: ScrW(context),
            padding: EdgeInsets.only(left: 10,top: 5,bottom: 5),
            height: widget.indexLetter == null ?0:25,
            color: themeColor,
            child: widget.indexLetter==null? null :Text(widget.indexLetter,style: TextStyle(fontSize: 13,color: Colors.grey),),
          ),

          Row(
            children: <Widget>[
              Container(
                width: 40,
                height: 40,
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  image: DecorationImage(image:widget.imgUrl != null ? NetworkImage(widget.imgUrl) : AssetImage(widget.assetImgName)),
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                ),

              ),
              Text(widget.name,style: TextStyle(fontSize: 15,color: Color.fromRGBO(0, 0, 0, 0.7)),)
            ],
          ),
          line(),
        ],
      ),

    );
  }
}
