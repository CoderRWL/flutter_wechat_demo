import 'package:flutter/material.dart';
import 'package:flutterwechat/pages/root_page.dart';

import 'package:flutterwechat/state_demo/state_demo.dart';

void main() => runApp(APP()) ;

class APP extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          highlightColor: Color.fromRGBO(1, 1, 1, 0),//长按
          splashColor: Color.fromRGBO(1, 1, 1, 0),// 点击 highlightColor，splashColor都设置透明，去掉水波纹效果
        cardColor: Color.fromRGBO(1, 1, 1, 0.65),

      ),
      debugShowCheckedModeBanner:false,
      home: rootPage(),
    );
  }
}
