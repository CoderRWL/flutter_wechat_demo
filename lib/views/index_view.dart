
import 'package:flutter/material.dart';
import 'package:flutterwechat/data/friend.dart';
import 'package:flutterwechat/data/pub_define.dart';

typedef  index_view_calback =  void Function(String value);

class index_view extends StatefulWidget {
  final double maxRare = 1.4;//-1.4-1.15

  String _currentLetter = null;
  Color bgColor = Colors.white;
  Color textColor = Colors.black;
  double index_y = 0;

  index_view_calback callback;



  index_view({this.callback});


  @override
  _index_viewState createState() => _index_viewState();
}



class _index_viewState extends State<index_view> {

  List<Widget> letterViews()
  {
    List <Widget> letterViews = [];
    for(int i = 0 ;i< INDEX_WORDS.length;i++){
      letterViews.add(
          Container(
            child: Text(INDEX_WORDS[i],style: TextStyle(fontSize: 12,color:widget.textColor)),
            height: 15,
          )
      );
    }
    return letterViews;
  }


  @override
  Widget build(BuildContext context) {
    print(widget.index_y);
    return Container(

      child:  Positioned(
         right: 0, width: 120,top:ScrH(context)*0.2 ,height: 15.0*INDEX_WORDS.length,
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Container(
                width: 80,
                margin: EdgeInsets.only(right: 10),
                child: widget._currentLetter == null ? null : Stack(

                  alignment: Alignment(0,widget.index_y),
                  
                  children: <Widget>[
                    Container(),
                    Stack(
                      alignment: Alignment(-0.2, 0),
                      children: <Widget>[
                        Image.asset('images/气泡.png'),
                        Text(widget._currentLetter,style: TextStyle(fontSize: 20,color: Colors.white),)
                      ],
                    ),
                  ],
                  
                ),

              ),
              Container(
                color: widget.bgColor,
                child: GestureDetector(

                  onVerticalDragDown:(DragDownDetails details){
                    RenderBox box = context.findRenderObject();
                    Offset offset = box.globalToLocal(details.globalPosition);
                    int index = offset.dy ~/15.0;
                    if(index >= 0 && index < INDEX_WORDS.length){
                      setState(() {
                        widget._currentLetter = INDEX_WORDS[index];
                        widget.bgColor = Colors.grey;
                        widget.textColor = Colors.white;
                        widget.index_y = -widget.maxRare + 2*widget.maxRare*index/(INDEX_WORDS.length-1);
//                        print(widget.index_y);index_y
                        if(widget.callback != null) widget.callback(INDEX_WORDS[index]);


                      });
                    }





                  } ,
                  onVerticalDragUpdate:(DragUpdateDetails details){
                    RenderBox box = context.findRenderObject();
                    Offset offset = box.globalToLocal(details.globalPosition);
                    int index = offset.dy ~/15.0;
                    if(index >= 0 && index< INDEX_WORDS.length){
                      setState(() {
                        widget._currentLetter = INDEX_WORDS[index];
                        widget.bgColor = Colors.grey;
                        widget.textColor = Colors.white;
                        widget.index_y = -widget.maxRare + 2*widget.maxRare*index/(INDEX_WORDS.length-1);
                        if(widget.callback != null) widget.callback(INDEX_WORDS[index]);
                      });
                    }else{
                      widget.bgColor = Colors.white;
                      widget.textColor = Colors.black;
                      widget._currentLetter = null;

                    }
                  },
                  onVerticalDragEnd: (DragEndDetails details){
                    setState(() {
                      widget.bgColor = Colors.white;
                      widget.textColor = Colors.black;
                      widget._currentLetter = null;
                    });
                  },



                  child:Container(
                    child:  Column(
                      children:letterViews(),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),


    );
  }
}


