import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:ynotradio/googleSignIn.dart';

class MyDrawer extends StatelessWidget {
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
            onTap: () {
              final provider =
              Provider.of<GoogleSignInProvider>(context, listen: false) ;
              provider.logout();
              },
          ),
        ],
      ),
    );
  }
}
