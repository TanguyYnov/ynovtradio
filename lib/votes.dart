import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ynotradio/drawer.dart';
import 'package:ynotradio/main.dart';
import 'package:ynotradio/bottomnav.dart';
import 'package:ynotradio/drawer.dart';

class MyHomePage3 extends StatefulWidget {
  MyHomePage3({Key key, this.title}) : super(key: key);


  final String title;

  @override
  _MyHomePageState3 createState() => _MyHomePageState3();
}


class _MyHomePageState3 extends State<MyHomePage3> {

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
            "VOTEZ",
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