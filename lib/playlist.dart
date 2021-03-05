import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ynotradio/drawer.dart';
import 'package:ynotradio/main.dart';
import 'package:ynotradio/bottomnav.dart';
import 'package:ynotradio/drawer.dart';


class MyHomePage2 extends StatefulWidget {
  MyHomePage2({Key key, this.title}) : super(key: key);


  final String title;

  @override
  _MyHomePageState2 createState() => _MyHomePageState2();
}


class _MyHomePageState2 extends State<MyHomePage2> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        toolbarHeight: 70,
        title:
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(''),
            Container(
              child: Image.asset('images/logo.png', fit: BoxFit.cover, height: 50, width: 100,),
            )
          ],
        ),
        backgroundColor: Colors.white,
      ),


      drawer: MyDrawer(),

      body: Center (
        child: Container(

        ),
      ),
      floatingActionButton: Center(
        child: FlatButton(
          color: Colors.red.withOpacity(0.4),
          textColor: Colors.white,
          splashColor: Colors.white,
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal :20.0),

          child: Text(
            "PLAYLIST",
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
            ),
          ),
          onPressed:(){},

        ),
      ),


      bottomNavigationBar: MyBottomNavBar(),
    );
  }
}