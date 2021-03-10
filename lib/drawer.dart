import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:ynotradio/googleSignIn.dart';
import 'package:ynotradio/signin.dart';

class MyDrawer extends StatelessWidget {
  FirebaseAuth _auth = FirebaseAuth.instance ;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
              decoration: BoxDecoration(),
              child: Image.asset('images/logo.png')),
          ListTile(
            title: Text('Ma Radio'),
            leading: Icon(
              Icons.person,
              color: Colors.black,
            ),
            onTap: () {},
          ),
          ListTile(
            title: Text('A propos'),
            leading: Icon(
              Icons.error_outline,
              color: Colors.black,
            ),
            onTap: () {},
          ),
          ListTile(
            title: Text('Contact'),
            leading: Icon(
              Icons.contact_mail,
              color: Colors.black,
            ),
            onTap: () {},
          ),
          ListTile(
            title: Text('Déconnexion'),
            leading: Icon(
              Icons.lock,
              color: Colors.black,
            ),
            onTap: () async{
              await _auth.signOut().then((value) => Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => LoginIN()
                ),
              )
              );
            },
            // await FirebaseAuth.instance.signOut();
            // firebaseUser = await await _auth.currentUser();
          ),
        ],
      ),
    );

  }
}
