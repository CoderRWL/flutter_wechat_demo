import 'package:flutter/material.dart';
import 'package:flutterwechat/pages/contact.dart';
import 'package:flutterwechat/pages/discover.dart';
import 'package:flutterwechat/pages/mine.dart';
import 'package:flutterwechat/pages/wechat.dart';

class rootPage extends StatefulWidget {
  @override
  _rootPageState createState() => _rootPageState();
}

class _rootPageState extends State<rootPage> {

  int _currentIndex = 0;
  List <Widget> _pages = [

    wechat(),contact(),discoverPage(),mine(),
  ];
  final PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex:_currentIndex ,
        fixedColor: Colors.green,
        selectedFontSize: 12,
        type: BottomNavigationBarType.fixed,
        onTap:(index){
          setState(() {
            _currentIndex = index;
          });
          pageController.jumpToPage(_currentIndex);

        },

        items: [
          BottomNavigationBarItem(
            title: Text('微信'),
            icon: Image.asset('images/tabbar_chat.png',height: 20,width: 20,),
            activeIcon: Image.asset('images/tabbar_chat_hl.png',height: 20,width: 20,),
          ),
          BottomNavigationBarItem(
            title: Text('通讯录'),
            icon: Image.asset('images/tabbar_friends.png',height: 20,width: 20,),
            activeIcon: Image.asset('images/tabbar_friends_hl.png',height: 20,width: 20,),
          ),
          BottomNavigationBarItem(
            title: Text('发现'),
            icon: Image.asset('images/tabbar_discover.png',height: 20,width: 20,),
            activeIcon:  Image.asset('images/tabbar_discover_hl.png',height: 20,width: 20,),
          ),
          BottomNavigationBarItem(
            title: Text('我'),
            icon: Image.asset('images/tabbar_mine.png',height: 20,width: 20,),
            activeIcon:  Image.asset('images/tabbar_mine_hl.png',height: 20,width: 20,),
          ),

        ],
      ),
body: PageView(
  controller: pageController,
onPageChanged: (index){
  setState(() {
    _currentIndex = index;
  });
},
//physics:NeverScrollableScrollPhysics() ,
  children: _pages,
),
    );
  }
}
