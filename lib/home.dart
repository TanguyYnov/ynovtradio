import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ynotradio/bottomnav.dart';
import 'package:ynotradio/drawer.dart';
import 'package:ynotradio/playlist.dart';
import 'package:ynotradio/signup.dart';
import 'package:ynotradio/votes.dart';


class Home extends StatefulWidget {
  final User user;

  const Home({Key key, this.user, this.title}) : super(key: key);

  final String title;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;

  final tabs = [
    Center(child: Text('En Direct')),
    Center(child: Text('Playlists')),
    Center(child: Text('Mes votes')),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        toolbarHeight: 70,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(''),
            Container(
              child: Image.asset(
                'images/logo.png',
                fit: BoxFit.cover,
                height: 50,
                width: 100,
              ),
            )
          ],
        ),
        backgroundColor: Colors.white,
      ),

      drawer: MyDrawer(), //

      body: Center(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/micro2.jpg"),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
      floatingActionButton: Center(
        child: FlatButton(
          color: Colors.red.withOpacity(0.4),
          textColor: Colors.white,
          splashColor: Colors.white,
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
          child: Text(
            "ÉCOUTEZ",
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
            ),
          ),
          onPressed: () {},
        ),
      ),

      bottomNavigationBar: MyBottomNavBar(),
    );
  }
}

