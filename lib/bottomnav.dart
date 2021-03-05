import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:ynotradio/main.dart';




class MyBottomNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 75,
      padding: EdgeInsets.only(top: 15, bottom: 20),
      color: Colors.red[800],
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
        IconButton(
          icon: Icon(Icons.radio, size: 30, color: Colors.white,),
          onPressed: (){
          Navigator.pushReplacementNamed(context, '');
          },
        ),
        IconButton(
          icon: Icon(Icons.queue_music, size: 30,color: Colors.white,),
          onPressed: (){
            Navigator.pushReplacementNamed(context, '/second');
          },
        ),
        IconButton(
          icon: Icon(Icons.favorite, size: 30,color: Colors.white,),
          onPressed: (){
            Navigator.pushReplacementNamed(context, '/third');
          },
        ),
       ],
      ),
    );
  }
}