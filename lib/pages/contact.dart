import 'package:flutter/material.dart';
import 'package:flutterwechat/views/contactcell.dart';
import 'package:flutterwechat/views/discover_cell.dart';
import 'package:flutterwechat/views/index_view.dart';
import 'package:flutterwechat/data/friend.dart';
import 'package:flutterwechat/data/pub_define.dart';

class contact extends StatefulWidget {
  @override
  _contactState createState() => _contactState();
}





class _contactState extends State<contact> with AutomaticKeepAliveClientMixin{

  final List<Friends> _friends_datas = [];
  final ScrollController _scrollController = ScrollController();
   Map  amazetoY = {};


  @override
  void initState(){
    super.initState();
    _friends_datas..addAll(datas)..addAll(datas)..addAll(datas);
    _friends_datas.sort(
        (Friends A,Friends B) {
          return A.indexLetter.compareTo(B.indexLetter);
        }

    );

    String lastLetter = INDEX_WORDS.last;
    INDEX_WORDS.removeRange(2, INDEX_WORDS.length);


    double y = 61.0*top_header_datas.length;
    amazetoY.addAll({INDEX_WORDS[0]:0.0});
    amazetoY.addAll({INDEX_WORDS[1]:0.0});

    for(int i =0;i< _friends_datas.length;i++ ) {
      if ( i== 0 ||  _friends_datas[i].indexLetter != _friends_datas[i - 1].indexLetter) {
        amazetoY.addAll({_friends_datas[i].indexLetter: y});
        y += (61.0 + 25.0);
        INDEX_WORDS.add(_friends_datas[i].indexLetter);

      } else {
        y += 61.0;
      }
    }
  INDEX_WORDS.add(lastLetter);



  }

  String getindexLetter(int index){

    if(index == 0)
      return _friends_datas[index].indexLetter;
   return  _friends_datas[index].indexLetter == _friends_datas[index-1].indexLetter ?null:_friends_datas[index].indexLetter;


  }

  //List cell方法
 Widget cellWithIndex(BuildContext context, int index){




   final int topCount = top_header_datas.length;

   if(index < topCount){
     return contact_cell(
       top_header_datas[index].name,
       assetImgName: top_header_datas[index].imageUrl,);
   }

    return contact_cell(
      _friends_datas[index-topCount].name,
      imgUrl: _friends_datas[index-topCount].imageUrl,
      indexLetter:  getindexLetter(index-topCount),
    );

  }




  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: themeColor,
        centerTitle: true,
        title: Text('通讯录',style:TextStyle(color: Colors.black)),
        elevation: 0.0,

      ),
      body: Container(
        height: ScrH(context),
        color: themeColor,
        child:Stack(

          children: <Widget>[
            ListView.builder(
              controller: _scrollController,
              itemCount: _friends_datas.length+top_header_datas.length,
              itemBuilder: cellWithIndex,
            ),
            index_view(
              callback: (String value){
                double y = amazetoY[value];

                if(y != null){
                  _scrollController.animateTo(y, duration: Duration(microseconds: 1000), curve: Curves.easeInOut);
                }


              },
            ),

            Container(

            ),
          ],

        ),

      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}

