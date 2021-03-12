import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'home.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _pseudoController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();
  bool _showPassword = true;
  bool _showPassword1 = true;

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
          Container(
            alignment: Alignment.center,
            child: SingleChildScrollView(
              padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top + 50),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
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
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Material(
                                  elevation: 5.0,
                                  borderRadius: BorderRadius.circular(10.0),
                                  child: TextFormField(
                                    controller: _pseudoController,
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
                                      return EmailValidator.validate(input)
                                          ? null
                                          : "E-mail incorrect";
                                    },
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
                                          return 'Mot de passe doit contenir au moins 8 caractères';
                                        } else if (_confirmPasswordController.text
                                            .toString() !=
                                            _passwordController.text.toString()) {
                                          return 'Mot de passe incorrect';
                                        }
                                        return null;
                                      },
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
                                SizedBox(
                                  height: 25.0,
                                ),
                                Container(
                                  child: Material(
                                    elevation: 5.0,
                                    borderRadius: BorderRadius.circular(10.0),
                                    child: TextFormField(
                                      controller: _confirmPasswordController,
                                      // ignore: missing_return
                                      validator: (input) {
                                        if (input.length < 8) {
                                          return 'Mot de passe doit contenir au moins 8 caractères';
                                        } else if (_confirmPasswordController.text
                                            .toString() !=
                                            _passwordController.text.toString()) {
                                          return 'Mot de passe incorrect';
                                        }
                                        return null;
                                      },
                                      decoration: InputDecoration(
                                          border: InputBorder.none,
                                          contentPadding: EdgeInsets.all(15.0),
                                          suffixIcon: IconButton(
                                            onPressed: () {
                                              setState(() {
                                                _showPassword1 = !_showPassword1;
                                              });
                                            },
                                            icon: Icon(
                                              _showPassword1
                                                  ? Icons.visibility
                                                  : Icons.visibility_off,
                                              color: Colors.grey.shade600,
                                            ),
                                          ),
                                          hintText: 'Confirmer le mot de passe',
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
                                borderSide:
                                BorderSide(color: Colors.red, width: 2),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              onPressed: () async {
                                if (_formKey.currentState.validate()) {
                                  await _registerAccount();
                                }
                              },
                              child: Text(
                                'Inscription',
                                style: TextStyle(
                                    fontSize: 30.0, color: Colors.white),
                              ),
                            ),
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

  void _registerAccount() async {
    try{
      final User user = (await _auth.createUserWithEmailAndPassword(
        email: _emailController.text.toString(), password: _passwordController.text.toString(),))
          .user;
      if (user != null) {
        if (!user.emailVerified) {
          await user.sendEmailVerification();
        }
        await user.updateProfile(displayName: _pseudoController.text.toString());
        final user1 = _auth.currentUser;
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => Home(
              user: user1,
            ),
          ),
        );
      }
    }catch(e){
      print(e.toString());
    }
  }
}
