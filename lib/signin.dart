import 'dart:ui';

import 'package:auth_buttons/res/buttons/google_auth_button.dart';
import 'package:auth_buttons/res/shared/auth_style.dart';
import 'package:flutter/material.dart';

Future<String> _message = Future<String>.value('');
Color dwayaColor = Color.fromRGBO(55, 200, 171, 1.0);

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //final FirebaseAuth _auth = FirebaseAuth.instance;

  String _password, _email;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String phoneNo;
  String smsCode;
  String verificationId;

  /*Future<void> testVerifyPhoneNumber() async {
    final PhoneVerificationCompleted verificationCompleted =
        (FirebaseUser user) {
      setState(() {
        _message =
        Future<String>.value('signInWithPhoneNumber auto succeeded: $user');
      });
    };

    final PhoneVerificationFailed verificationFailed =
        (AuthException authException) {
      setState(() {
        _message = Future<String>.value(
            'Phone number verification failed. Code: ${authException.code}. Message: ${authException.message}');
      });
    };

    final PhoneCodeSent codeSent =
        (String verificationId, [int forceResendingToken]) async {
      this.verificationId = verificationId;
      smsCodeDialog(context).then((value){
        print('Signed in');
      });
    };

    final PhoneCodeAutoRetrievalTimeout codeAutoRetrievalTimeout =
        (String verificationId) {
      this.verificationId = verificationId;
    };

    await _auth.verifyPhoneNumber(
        phoneNumber: this.phoneNo,
        timeout: const Duration(seconds: 5),
        verificationCompleted: verificationCompleted,
        verificationFailed: verificationFailed,
        codeSent: codeSent,
        codeAutoRetrievalTimeout: codeAutoRetrievalTimeout);
  }*/
  /* Future<bool> smsCodeDialog (BuildContext context){
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Enter sms Code'),
            content: TextField(
              onChanged: (value){
                this.smsCode = value ;
              },
            ),
            contentPadding: EdgeInsets.all(10.0),
            actions: <Widget>[
              FlatButton(
                  onPressed: () {
                    FirebaseAuth.instance.currentUser().then((user){
                      if (user != null){
                        Navigator.of(context).pop();
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()));
                      }else{
                        Navigator.of(context).pop();
                      }
                    });
                  },
                  child: Text('done'))
            ],
          );
        }
    );
  }*/
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    AuthButtonStyle authButtonStyle = AuthButtonStyle.secondary;
    bool darkMode = false;
    return Scaffold(
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
                                // ignore: missing_return
                                validator: (input) {
                                  if (input.isEmpty) {
                                    return 'Veuillez saisir un e-mail';
                                  }
                                },
                                onSaved: (input) => _email = input,
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
                                  // ignore: missing_return
                                  validator: (input) {
                                    if (input.length < 8) {
                                      return 'Votre mot de passe doit contenir au moins 8 caractères';
                                    }
                                  },
                                  onSaved: (input) => _password = input,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      contentPadding: EdgeInsets.all(15.0),
                                      hintText: 'Mot de passe',
                                      hintStyle: TextStyle(
                                        color: Colors.grey.shade600,
                                      )),
                                  obscureText: true,
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
                        height: 15.0,
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
                          onPressed: () {},
                          child: Text(
                            'Connextion',
                            style:
                                TextStyle(fontSize: 30.0, color: Colors.white),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      SizedBox(height: 10.0),
                      GoogleAuthButton(
                        onPressed: () {},
                        text: "Se connecter avec Google",
                      ),
                      SizedBox(
                        height: 10.0,
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
                                fontSize: 14.0,
                                color: Colors.white,
                                inherit: false),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).padding.top * 2,
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
/* Future <void> signIn() async{
    final formState = _formKey.currentState;
    if (formState.validate()){
      formState.save();
      try{
        FirebaseUser user =  await FirebaseAuth.instance.signInWithEmailAndPassword(email: _email, password: _password);
        Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpPage()));
      }catch(e){
        print(e.message);
      }
    }
  }*/
/*void navigatorInscription() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => InscriptionPage()));
  }
  void navigatorPhone() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => PhonePage()));
  }*/
}

//ok
