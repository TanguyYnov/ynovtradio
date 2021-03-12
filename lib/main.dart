import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:ynotradio/authentication.dart';
import 'package:ynotradio/playlist.dart';
import 'package:ynotradio/votes.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static const String _title = 'YNOT RADIO';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'YNOT Radio',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SplashScreen(
        seconds: 5,
        navigateAfterSeconds: Authentication(),
        backgroundColor: Colors.white,
        loadingText: Text("Chargement..."),
        useLoader: true,
        image: Image.asset("images/logo.png"),
        photoSize: 50,
        loaderColor: Colors.red,
      ),
      routes: <String, WidgetBuilder>{
        '/second': (context) => MyHomePage2(),
        '/third': (context) => MyHomePage3(),
      },
    );
  }
}
