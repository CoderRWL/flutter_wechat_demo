
import 'package:flutter/material.dart';
import 'package:flutterwechat/data/chat_object.dart';
import 'package:flutterwechat/data/pub_define.dart';
import 'package:flutterwechat/views/chat_cell.dart';
import 'package:flutterwechat/views/search_bar.dart';



 class SearchPage extends StatefulWidget {


 final List<Chat> data;

 String inputStr;

   SearchPage({this.data});


   @override
   _SearchPageState createState() => _SearchPageState();
 }



 class _SearchPageState extends State<SearchPage> {
   List<Chat> chats = [];
   String preInputStr = '';
   List<Chat> preList = [];


   setDataFunc(String str) {
     chats.clear();
     if (str.length == 0) return chats;

     if(preInputStr.length>0 && str.contains(preInputStr)){
       for (int i = 0; i < preList.length; i++) {
         if (preList[i].name.contains(str) == true) {
           chats.add(preList[i]);
         }
       }

     }else{
       for (int i = 0; i < widget.data.length; i++) {
         if (widget.data[i].name.contains(str) == true) {
           chats.add(widget.data[i]);
         }
       }
     }


     preInputStr = str;
     preList.clear();
     preList.addAll(chats);  print('object2');
   }

   @override
   Widget build(BuildContext context) {
     return Scaffold(
       body: Container(
         color: themeColor,
         child: Column(
           children: <Widget>[
             SearchBar(
               valueChanged: (text){
                 widget.inputStr = text;
                 chats.clear();
                setState(() {
                  setDataFunc(text);
                  print('收到筛选--$chats');
                });

               },
             ),
             Expanded(child:MediaQuery.removePadding(
                 removeTop: true,
                 context: context,
                 child: chats.length !=0?  ListView.builder(
                     itemCount: chats.length,
                     itemBuilder: (BuildContext context, int index){
                       return
                         ChatCell(
                           imgUrl: chats[index].imgUrl,
//                           name: chats[index].name,
                         richText: HLtrated(chats[index].name, widget.inputStr),
                           message:chats[index].message,
                           time: chats[index].time,
                         );


                     }): Container(),),
             ),
           ],


         ),
       ),


     );
   }
 }

//high light
RichText  HLtrated(String fromStr,String pattern){
   final list = fromStr.split(pattern);
   //首尾为pattern，数组里为空，连续的也为空，为n-1个空
//   RichText(text: null)
   List<TextSpan> spans = [];
   for(int i =0; i<list.length;i++){
     if(list[i] == '' && i < list.length-1 ){
         spans.add(TextSpan(text: pattern,style: TextStyle(fontSize: 20,color: Colors.green)));
     }else{
       spans.add(TextSpan(text: list[i],style: TextStyle(fontSize: 15,color: Colors.black)));
       if(i < list.length-1){
         spans.add(TextSpan(text: pattern,style: TextStyle(fontSize: 20,color: Colors.green)));
       }


     }
   }
   return RichText(text: TextSpan(children: spans));

 }