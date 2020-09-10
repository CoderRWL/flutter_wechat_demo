import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutterwechat/pages/search_page.dart';
import 'package:flutterwechat/views/chat_cell.dart';
import 'package:flutterwechat/childpage/childpage.dart';
import 'package:flutterwechat/data/chat_object.dart';
import 'package:flutterwechat/data/pub_define.dart';
import 'package:flutterwechat/views/search_bar.dart';
import 'package:http/http.dart' as http;


class wechat extends StatefulWidget  {
  @override
  _wechatState createState() => _wechatState();
}



class _wechatState extends State<wechat> with AutomaticKeepAliveClientMixin {


List <Chat> chats = [];
int chat_count = 0;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getDatas().then((value) {
     setState(() {
       chat_count = chats.length;
       print(value.length);
     });
    }).catchError((error){
      print(error);
    }).whenComplete(() =>print('complete2' )
    ).timeout(Duration(seconds: 1)).catchError((error){
      print(error);
    });

  }

Future <List<Chat>> getDatas() async{

    final respon  = await http.get  ('http://rap2.taobao.org:38080/app/mock/257079/api/chat/list',);
    if(respon.statusCode == 200){

      List dictAraay = json.decode(respon.body)['chart_list'];

      chats.addAll(dictAraay.map((e) => Chat.fromDict(e)).toList());


    }else{
      print(respon.statusCode);

    }

 return chats;
  }

  @override
  Widget build(BuildContext context) {

    List list = List();

   super.build(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: themeColor,
        centerTitle: true,
        title: Text('微信(${chat_count})',style:TextStyle(color: Colors.black)),
        elevation: 0.0,
        actions: <Widget>[
          Container(
            margin: EdgeInsets.only(right: 10),
            child:           PopupMenuButton(
              offset: Offset(0, 60),
                child:Image(image: AssetImage('images/圆加.png'),width: 25,),
                itemBuilder: (BuildContext context){
                  return <PopupMenuItem<String>>[
                    PopupMenuItem(child:_popupMenuButtonItem('images/发起群聊.png','发起群聊') ,),
                    PopupMenuItem(child:_popupMenuButtonItem('images/扫一扫1.png','扫一扫') ,),
                    PopupMenuItem(child:_popupMenuButtonItem('images/添加朋友.png','添加朋友'),),
                    PopupMenuItem(child:_popupMenuButtonItem('images/收付款.png','收付款') ,),
                  ];



            },

            ),
          ),

        ],

      ),
      body:Column(

        children: <Widget>[

          GestureDetector(
            child: SearchCell((){
              //点击事件
              Navigator.push(context, MaterialPageRoute(builder:(contex){
                return SearchPage(
                  data: chats,

                );
              }));

            },
            ),
          ),

Expanded(
    child:
    ListView.builder(
        itemCount: chats.length,
        itemBuilder: (BuildContext context, int index){
         return
            ChatCell(
            imgUrl: chats[index].imgUrl,
            name: chats[index].name,
            message: chats[index].message,
            time: chats[index].time,
          );


    })),


//          Container(
//
//            height: ScrH(context)-177,
//            color: themeColor,
//            child: FutureBuilder(
//  future: getDatas(),
//    builder: (BuildContext context, AsyncSnapshot snapshot){
//    print(snapshot.connectionState);
//    if(snapshot.connectionState == ConnectionState.done){
//      return    ListView.builder(
//                itemCount: chats.length,
//                itemBuilder: (BuildContext context, int index){
//                  return  ChatCell(
//                    imgUrl: chats[index].imgUrl,
//                    name: chats[index].name,
//                    time: chats[index].time,
//                    message: chats[index].message,
//                  );
//                });
//
////return ListView(
////  children: snapshot.data.map<Widget>(
////      (Chat item){
////        return ListTile(
////          title: Text(item.name),
////          subtitle: Container(
////            height: 20,
////            child: Text(item.message),
////          ),
////          leading: CircleAvatar(
////            backgroundImage:NetworkImage(item.imgUrl),
////          ),
////        );
////      }
////  ).toList(),
////);
//    }else{
//
//     return Center(
//       child:  Text('Loading'),
//     );
//    }
//
//
//    }),
//
//
//
//
//
//          ),
        ],
      ),


    );
  }
Widget _popupMenuButtonItem(String imgName,String title){
  return GestureDetector(
    child: Row(
      children: <Widget>[
        Image(image: AssetImage(imgName),width: 25,),
        SizedBox(width: 10,),
        Text(title,style: TextStyle(fontSize: 15,color:Colors.white),)
      ],


    ),
    onTap: (){
      Navigator.push(context, MaterialPageRoute(builder: (BuildContext contex){
        return ChildPage(toptitle: title,);

      }));
    },
  );
}

@override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

}



//requst http://rap2.taobao.org:38080/app/mock/257079/api/chat/list

