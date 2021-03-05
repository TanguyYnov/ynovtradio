import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ynotradio/bottomnav.dart';
import 'package:ynotradio/drawer.dart';
import 'package:ynotradio/playlist.dart';
import 'package:ynotradio/votes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static const String _title = 'YNOT RADIO';
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'YNOT Radio',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
      initialRoute: '',
      routes: {
        '': (context) => MyHomePage(),
        '/second': (context) => MyHomePage2(),
        '/third': (context) => MyHomePage3(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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

          // This trailing comma makes auto-formatting nicer for build methods.
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
