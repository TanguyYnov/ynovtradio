import 'dart:ui';

import 'package:auth_buttons/res/buttons/google_auth_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'package:ynotradio/signup.dart';

import 'home.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool _showPassword = true;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      key: _scaffoldKey,
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
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
          Container(
            alignment: Alignment.bottomCenter,
            child: SingleChildScrollView(
              padding:
                  EdgeInsets.only(top: MediaQuery.of(context).padding.top + 50),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Form(
                    key: _formKey,
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: size.width * 0.06),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                Material(
                                  elevation: 5.0,
                                  borderRadius: BorderRadius.circular(10.0),
                                  child: TextFormField(
                                    keyboardType: TextInputType.emailAddress,
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
                                      hintText: 'E-mail',
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
                                          return 'Mot de passe doit contenir au moins 8 caractères';
                                        }
                                      },
                                      // onSaved: (input) => _password = input,
                                      decoration: InputDecoration(
                                          border: InputBorder.none,
                                          contentPadding: EdgeInsets.all(15.0),
                                          suffixIcon: IconButton(
                                            onPressed: () {
                                              setState(() {
                                                _showPassword = !_showPassword;
                                              });
                                            },
                                            icon: Icon(
                                              _showPassword
                                                  ? Icons.visibility
                                                  : Icons.visibility_off,
                                              color: Colors.grey.shade600,
                                            ),
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
                                borderSide:
                                    BorderSide(color: Colors.red, width: 2),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              onPressed: () async {
                                if (_formKey.currentState.validate()) {
                                  _signInWithEmailPassword();
                                  ;
                                }
                              },
                              child: Text(
                                'Connexion',
                                style: TextStyle(
                                    fontSize: 30.0, color: Colors.white),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 50.0,
                          ),
                          GoogleAuthButton(
                            onPressed: () {
                              final provider =
                                  Provider.of<GoogleSignInProvider>(
                                context,
                                listen: false,
                              );
                              provider.login();
                            },
                            text: "Se connecter avec Google",
                          ),
                          SizedBox(
                            height: 30.0,
                          ),
                          Container(
                            alignment: Alignment.center,
                            child: Column(
                              children: [
                                Text("Vous n’avez pas de compte ?",
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      color: Colors.white,
                                      inherit: false,
                                    )),
                                MaterialButton(
                                  shape: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.transparent),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => SignUp()));
                                  },
                                  child: Text(
                                    'Inscrivez-vous',
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      color: Colors.white,
                                      inherit: false,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).padding.top * 2.5,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _signInWithEmailPassword() async {
    try {
      final User user = (await _auth.signInWithEmailAndPassword(
              email: _emailController.text, password: _passwordController.text))
          .user;
      if (!user.emailVerified) {
        await user.sendEmailVerification();
      }
      Navigator.of(context).push(MaterialPageRoute(builder: (_) {
        return Home();
      }));
    } catch (e) {
      // ignore: deprecated_member_use
      _scaffoldKey.currentState
          // ignore: deprecated_member_use
          .showSnackBar(
              SnackBar(content: Text("E-mail ou mot de passe incorrect")));
      print(e);
    }
  }
}

class GoogleSignInProvider extends ChangeNotifier {
  final googleSignIn = GoogleSignIn();
  bool _isSignIn;

  GoogleSignInProvider() {
    _isSignIn = false;
  }

  bool get isSignIn => _isSignIn;

  set isSignIn(bool isSingIn) {
    _isSignIn = isSignIn;
    notifyListeners();
  }

  Future login() async {
    isSignIn = true;

    final user = await googleSignIn.signIn();

    if (user == null) {
      isSignIn = false;
      return;
    } else {
      final googleAuth = await user.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      await FirebaseAuth.instance.signInWithCredential(credential);
      isSignIn = false;
    }
  }

  void logout() async {
    await googleSignIn.disconnect();
    FirebaseAuth.instance.signOut();
    notifyListeners();
    isSignIn = false;
  }
}
