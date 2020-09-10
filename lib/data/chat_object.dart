
import 'package:flutter/foundation.dart';

class Chat{
  final String imgUrl;
  final String name;
  final String message;
  final String time;


 Chat({

   this.imgUrl,
   this.name,
   this.message,
   this.time,
 }) ;

 factory  Chat.fromDict(Map dict){
   return Chat(
     imgUrl:  dict['imageUrl'],
     name: dict['name'],
     message: dict['message'],
     time: dict['time'],
   );
  }

}