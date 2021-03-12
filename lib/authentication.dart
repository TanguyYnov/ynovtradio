import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ynotradio/home.dart';
import 'package:ynotradio/signin.dart';

class Authentication extends StatefulWidget {
  @override
  _AuthenticationState createState() => _AuthenticationState();
}

class _AuthenticationState extends State<Authentication> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider(
        create: (context) => GoogleSignInProvider(),
        child: StreamBuilder(
          builder: (context, snapshot) {
            GoogleSignInProvider provider =
                Provider.of<GoogleSignInProvider>(context);
            if (provider.isSignIn) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasData) {
              return Home();
            } else {
              return SignIn();
            }
          },
          stream: FirebaseAuth.instance.authStateChanges(),
        ),
      ),
    );
  }
}
