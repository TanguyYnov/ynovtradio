import 'dart:ui';
import 'package:auth_buttons/res/buttons/google_auth_button.dart';
import 'package:auth_buttons/res/shared/auth_style.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'home.dart';

class GoogleSignIN extends StatefulWidget {
  @override
  _GoogleSignINState createState() => _GoogleSignINState();
}

class _GoogleSignINState extends State<GoogleSignIN> {
  final FirebaseAuth _auth = FirebaseAuth.instance ;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>() ;
  bool _showPassword = true ;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    AuthButtonStyle authButtonStyle = AuthButtonStyle.secondary;
    bool darkMode = false;
    return Scaffold(
      key: _scaffoldkey,
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(top: MediaQuery
                .of(context)
                .padding
                .top),
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    "images/micro2.jpg",
                  ),
                ),
              ),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                child: Container(
                  color: Colors.black.withOpacity(0.3),
                ),
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Form(
                key: _formKey,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding:
                        EdgeInsets.symmetric(horizontal: size.width * 0.06),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Material(
                              elevation: 5.0,
                              borderRadius: BorderRadius.circular(10.0),
                              child: TextFormField(
                                controller: _emailController,
                                // ignore: missing_return
                                validator: (input) {
                                  if (input.isEmpty) {
                                    return 'Veuillez saisir un e-mail';
                                  }
                                },
                                // onSaved: (input) => _email = input,
                                decoration: InputDecoration(
                                  //focusedBorder: InputBorder.none,
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.all(15.0),
                                  hintText: 'Email',
                                  hintStyle: TextStyle(
                                    color: Colors.grey.shade600,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            Container(
                              child: Material(
                                elevation: 5.0,
                                borderRadius: BorderRadius.circular(10.0),
                                child: TextFormField(
                                  controller: _passwordController,
                                  // ignore: missing_return
                                  validator: (input) {
                                    if (input.length < 8) {
                                      return 'Votre mot de passe doit contenir au moins 8 caractères';
                                    }
                                  },
                                  // onSaved: (input) => _password = input,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      contentPadding: EdgeInsets.all(15.0),
                                      suffixIcon: IconButton(
                                        onPressed: (){
                                          setState(() {
                                            _showPassword = !_showPassword ;
                                          });
                                        },
                                        icon: Icon(
                                            _showPassword ? Icons.visibility : Icons.visibility_off),
                                      ),
                                      hintText: 'Mot de passe',
                                      hintStyle: TextStyle(
                                        color: Colors.grey.shade600,
                                      )),
                                  obscureText: _showPassword,
                                ),
                              ),
                            ),
                            SizedBox(height: 10.0),
                            Container(
                              alignment: Alignment.centerRight,
                              child: MaterialButton(
                                shape: OutlineInputBorder(
                                  borderSide:
                                  BorderSide(color: Colors.transparent),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                onPressed: () {},
                                child: Text(
                                  'Mot de passe oublié ?',
                                  style: TextStyle(
                                      fontSize: 14.0,
                                      color: Colors.white,
                                      inherit: false),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 30.0,
                      ),
                      Container(
                        width: 250.0,
                        height: 50.0,
                        child: MaterialButton(
                          disabledColor: Colors.white10,
                          shape: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.red, width: 2),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          onPressed: () async {
                            if(_formKey.currentState.validate()){
                              _signinWithEmailPassword();
;                            }
                          },
                          child: Text(
                            'Connextion',
                            style:
                            TextStyle(fontSize: 30.0, color: Colors.white),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      SizedBox(height: 10.0),
                      GoogleAuthButton(
                        onPressed: () {
                          final provider =
                          Provider.of<GoogleSignInProvider>(context, listen: false) ;
                          provider.login();
                        },
                        text: "Se connecter avec Google",
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Container(
                        alignment: Alignment.center,
                        child: MaterialButton(
                          shape: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          onPressed: () {},
                          child: Text(
                            'Créer un compte',
                            style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.white,
                                inherit: false),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery
                            .of(context)
                            .padding
                            .top * 3,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
  void _signinWithEmailPassword () async {
    try {
      final User user = (
          await _auth.signInWithEmailAndPassword(
              email: _emailController.text, password: _passwordController.text)).user;
              if(!user.emailVerified){
                await user.sendEmailVerification();
              }
          Navigator.of(context).push(MaterialPageRoute(builder: (_){
            return MyHome() ;
          })) ;
    } catch (e){
      // ignore: deprecated_member_use
      _scaffoldkey.currentState.showSnackBar(
          SnackBar(content: Text("Fialed email and passowrd")));
      print(e);
    }
  }
}



class GoogleSignInProvider extends ChangeNotifier {
  final googleSignIn = GoogleSignIn() ;
  bool _isSignIn;

  GoogleSignInProvider(){
    _isSignIn = false ;
  }

  bool get isSignIn => _isSignIn ;

  set isSignIn(bool isSingIn) {
    _isSignIn = isSignIn ;
    notifyListeners() ;
  }

  Future login () async{
    isSignIn = true ;

    final user = await googleSignIn.signIn();

    if (user == null){
      isSignIn = false ;
      return ;
    }else {
      final   googleAuth= await user.authentication ;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      await FirebaseAuth.instance.signInWithCredential(credential) ;

      isSignIn = false ;
    }
  }

  void logout () async {
    await googleSignIn.disconnect();
    FirebaseAuth.instance.signOut();
  }
}
