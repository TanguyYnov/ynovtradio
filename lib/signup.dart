import 'dart:ui';
import 'package:auth_buttons/res/buttons/google_auth_button.dart';
import 'package:auth_buttons/res/shared/auth_style.dart';
import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'home.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  final FirebaseAuth _auth = FirebaseAuth.instance ;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _pseudo = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool _showPassword = true ;
  bool _showPassword1 = true ;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    return Scaffold(
      body: SingleChildScrollView(
        reverse: true,
        child: Stack(
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
              mainAxisAlignment: MainAxisAlignment.center,
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
                            mainAxisAlignment: MainAxisAlignment.center  ,
                            children: <Widget>[
                              Material(
                                elevation: 5.0,
                                borderRadius: BorderRadius.circular(10.0),
                                child: TextFormField(
                                  controller: _pseudo,
                                  // ignore: missing_return
                                  decoration: InputDecoration(
                                    //focusedBorder: InputBorder.none,
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.all(15.0),
                                    hintText: 'Pseudo',
                                    hintStyle: TextStyle(
                                      color: Colors.grey.shade600,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 25.0,
                              ),
                              Material(
                                elevation: 5.0,
                                borderRadius: BorderRadius.circular(10.0),
                                child: TextFormField(
                                  keyboardType: TextInputType.emailAddress,
                                  controller: _emailController,
                                  // ignore: missing_return
                                  validator: (input) {
                                    return EmailValidator.validate(input) ? null : "Entre votre email correctement" ;
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
                                height: 25.0,
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
                                      return null ;
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
                              SizedBox(
                                height: 25.0,
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
                                    // onSaved: (input) => _password = input,
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        contentPadding: EdgeInsets.all(15.0),
                                        suffixIcon: IconButton(
                                          onPressed: (){
                                            setState(() {
                                              _showPassword1 = !_showPassword1 ;
                                            });
                                          },
                                          icon: Icon(
                                              _showPassword1 ? Icons.visibility : Icons.visibility_off),
                                        ),
                                        hintText: 'Confirmer mot de passe',
                                        hintStyle: TextStyle(
                                          color: Colors.grey.shade600,
                                        )),
                                    obscureText: _showPassword1,

                                  ),
                                ),
                              ),
                              SizedBox(height: 10.0),
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
                                await _registerAccunt() ;
                              }
                            },
                            child: Text(
                              'Connextion',
                              style:
                              TextStyle(fontSize: 30.0, color: Colors.white),
                            ),
                          ),
                        ),

                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),

    );

  }
  void _registerAccunt() async {
    final User user = (await _auth.createUserWithEmailAndPassword(
        email: _emailController.text , password: _passwordController.text)).user ;
      if(user != null){
        if(!user.emailVerified){
          await user.sendEmailVerification();
        }
        await user.updateProfile(displayName: _pseudo.text);
        final user1 = _auth.currentUser;
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => MyHome(user: user1,),
          ),
        );
        /*Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context){
          return MyHome(user: user1,);
        }));*/
      }
  }
}



