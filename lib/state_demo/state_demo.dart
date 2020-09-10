import 'package:flutter/material.dart';
class StateDemo extends StatefulWidget {
  @override
  _StateDemoState createState() => _StateDemoState();
}

class _StateDemoState extends State<StateDemo> {

  int count = 0;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text('data'),),
      body: GestureDetector(
        child: Center(child: Text('$count')),
        onTap: (){
          setState(() {
            count++;
          });
        },
      ),
    );


  }
}

