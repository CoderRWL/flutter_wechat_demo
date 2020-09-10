
import 'package:flutter/material.dart';
import 'package:flutterwechat/childpage/childpage.dart';
import 'package:flutterwechat/data/pub_define.dart';


class discoverCell extends StatefulWidget {

  final String title;
  final String subTitle;
  final String imgName;
  final String subImgName;

  discoverCell(

      this.title,
      this.imgName,
      {
    this.subTitle,
    this.subImgName
    });


  @override
  _discoverCellState createState() => _discoverCellState();
}

class _discoverCellState extends State<discoverCell> {

  Color _cell_color = Colors.white;

  jumpPage(){
    Navigator.of(context).push(MaterialPageRoute(builder:(BuildContext context) => ChildPage(toptitle: widget.subTitle == null ? widget.title :widget.subTitle )));
  }

  setColorGrey(TapDownDetails details){
      setState(() {
  _cell_color = Colors.grey;
  });
  }
  setColorWhite(TapUpDetails details){

    setState(() {
      _cell_color = Colors.white;
    });


  }

  @override
  Widget build(BuildContext context) {


    return GestureDetector(
      onTapDown: setColorGrey,
      onTapUp: setColorWhite,
      onTap: jumpPage,




      child:  Container(
        color: _cell_color,
        height: 54.0,
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,

              children: <Widget>[
                //leftview
                Container(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    children: <Widget>[
                      Image(image: AssetImage(widget.imgName),width: 25),
                      SizedBox(width: 10,),
                      Text(widget.title),
                    ],
                  ),
                ),

                //rightview
                Container(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    children: <Widget>[
                      widget.subTitle != null ? Text(widget.subTitle) : Text(''),
                      SizedBox(width: 5,),
                      widget.subImgName != null ?Image(image: AssetImage(widget.subImgName),width: 15,):Container(),
                      SizedBox(width: 5,),
                      Image(image: AssetImage('images/icon_right.png'),width: 15),


                    ],
                  ),
                ),
              ],

            ),
          ],
        ),


      ),
    );
  }


}
