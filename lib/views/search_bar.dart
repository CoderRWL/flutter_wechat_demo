import 'package:flutter/material.dart';
import 'package:flutterwechat/data/pub_define.dart';

typedef  SearchBarClick =   Function();
typedef ValueChanged =   Function(String text);

class SearchCell extends StatelessWidget {

 SearchBarClick clickEvent;



 SearchCell(this.clickEvent);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: clickEvent,
      child: Container(
        margin: EdgeInsets.all(5),
        height: 30,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius:BorderRadius.circular(5),

        ),
        child:  Row(
          mainAxisAlignment:  MainAxisAlignment.center,
          children: <Widget>[
            Image(image: AssetImage('images/放大镜b.png'),width: 20,),
            SizedBox(width: 5,)
            ,                Text('搜索')
          ],
        ),


      ),
    );
  }
}

class SearchBar extends StatefulWidget {
 final ValueChanged valueChanged ;
  SearchBar({this.valueChanged});

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {

  String inputStr ='' ;
  final TextEditingController  textEditingController = TextEditingController();

  void valueChanged(text){
  setState(() {
  inputStr = text;
  });
  if(widget.valueChanged != null){
    widget.valueChanged(text);
  }


  }


  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: EdgeInsets.only(top: 25.0),
      color: themeColor,
      child:Container(
        height: 30,
        child: Row(
          children: <Widget>[
            Container(
              width: ScrW(context)-60,
              margin: EdgeInsets.only(left: 5,bottom: 5,right: 0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
              ),
              child:
              Row(

                children: <Widget>[
                  SizedBox(width: 5,),
                  Image(image: AssetImage('images/放大镜b.png'),width: 20,color: Colors.grey,),
                  Expanded(child:
                  TextField(
                    controller: textEditingController,
                    onChanged: valueChanged,
                    autofocus: true,
                    cursorColor: Colors.green,
                    style: TextStyle(fontSize: 12,color: Colors
                        .black,),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: '搜索',

                    ),
                  ),),
                  Container(
                    child: inputStr.length <=0 ? Container(): GestureDetector(
                        onTapDown: (d){
                          textEditingController.clear();
                          valueChanged('');
                        },
                        child: Container(
                          margin: EdgeInsets.only(right: 5),
                          child: Icon(Icons.cancel,size: 12,color: Colors.grey,),
                        ) ,
                  ),

                  ),

                ],

              ),
            ),
            GestureDetector(
              onTapDown: (d){
                Navigator.pop(context);
              },
              child: Text('  取消',style: TextStyle(fontSize: 15,color: Colors.black),),
            ),
          ],
        ),
      ),
    );
  }
}



