import 'dart:ui';

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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              /*
              Form(
                key: _formKey,
                child: Container(
                  color: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(left: 25.0, right: 25.0),
                            child: Material(
                              elevation: 5.0,
                              borderRadius: BorderRadius.circular(10.0),
                              child: TextFormField(
                                // ignore: missing_return
                                validator: (input) {
                                  if (input.isEmpty) {
                                    return 'Please type an email';
                                  }
                                },
                                onSaved: (input) => _email = input,
                                decoration: InputDecoration(
                                  //focusedBorder: InputBorder.none,
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.all(15.0),
                                  hintText: 'Pseudo',
                                  hintStyle: TextStyle(
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          Container(
                            child: Padding(
                              padding: EdgeInsets.only(left: 25.0, right: 25.0),
                              child: Material(
                                elevation: 5.0,
                                borderRadius: BorderRadius.circular(10.0),
                                child: TextFormField(
                                  // ignore: missing_return
                                  validator: (input) {
                                    if (input.length < 6) {
                                      return 'Your password needs to be atleast 6 characters';
                                    }
                                  },
                                  onSaved: (input) => _password = input,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      contentPadding: EdgeInsets.all(15.0),
                                      hintText: 'Password',
                                      hintStyle: TextStyle(
                                        color: Colors.grey,
                                      )),
                                  obscureText: true,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 5.0),
                          Padding(
                              padding: const EdgeInsets.only(right: 30.0, top: 5.0),
                              child: Container(
                                  alignment: Alignment.centerRight,
                                  width: MediaQuery.of(context).size.width,
                                  child: Text(
                                    'Forget Password ?',
                                    style: TextStyle(
                                        fontSize: 11.0,
                                        color: Colors.white,
                                        inherit: false),
                                  ))),
                        ],
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      Container(
                        width: 250.0,
                        height: 50.0,
                        // ignore: deprecated_member_use
                        child: RaisedButton(
                          disabledColor: Colors.white10,
                          // onPressed: signIn,
                          shape: StadiumBorder(
                            side: BorderSide(
                              color: dwayaColor,
                              width: 2.0,
                              style: BorderStyle.solid,
                            ),
                          ),
                          onPressed: () {},
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'CONNEXION',
                              style: TextStyle(fontSize: 30.0, color: dwayaColor),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Divider(
                            color: Colors.black,
                          ),
                          Text(
                            ' or ',
                            style: TextStyle(fontSize: 20.0, inherit: false),
                          ),
                          Divider(
                            color: Colors.black,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      SizedBox(height: 10.0),
                      Container(
                        width: 300.0,
                        height: 50.0,
                        // ignore: deprecated_member_use
                        child: RaisedButton(
                          shape: StadiumBorder(
                            side: BorderSide(color: Colors.redAccent, width: 1.5),
                          ),
                          onPressed: () {
                            setState(() {
                              //_message = _testSignInWithGoogle();
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(left: 40.0),
                            child: GoogleAuthButton(
                              onPressed: () {
                                // TODO
                                // Google auth
                              },
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'Are you new here ?',
                            style: TextStyle(
                              fontSize: 15.0,
                              color: dwayaColor,
                              inherit: false,
                            ),
                          ),
                          Material(
                            color: Colors.white10,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: InkWell(
                                  //  onTap: navigatorInscription,
                                  child: Text(
                                'Create an account',
                                style: TextStyle(
                                    fontSize: 15.0,
                                    color: dwayaColor,
                                    inherit: false),
                              )),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),*/
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
