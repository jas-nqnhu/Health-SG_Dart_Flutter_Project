import '/services/firebaseauth_service.dart';
import '/shared/loading.dart';
import 'package:flutter/material.dart';
import '/shared/constants.dart';
import 'home_page.dart';

class Register extends StatefulWidget {
  final Function toggleView;
  Register({this.toggleView});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final FirebaseAuthService _auth = FirebaseAuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;
  // text field state
  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            backgroundColor: Colors.red[50],
            appBar: AppBar(
              backgroundColor: Colors.red[900],
              elevation: 0.0,
              title: Text('SG-Health'),
              automaticallyImplyLeading: false,
              actions: <Widget>[
                FlatButton.icon(
                  icon: Icon(Icons.person,color: Colors.white,),
              label: Text('Login',style: TextStyle(color: Colors.white),),
                  onPressed: () => widget.toggleView(),
                ),
              ],
            ),
            body: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
                child: Form(
                  autovalidateMode: AutovalidateMode.always,
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 20.0),
                      Text(
                        "Create a new account",
                        style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 50.0,
                            color: Colors.red[800]),
                      ),
                      SizedBox(height: 20.0),
                      TextFormField(
                        decoration:
                            textInputDecoration.copyWith(hintText: 'Email'),
                        validator: (val) {
                          if (val.isEmpty) {
                            return 'Enter an email';
                          } else if (!val.contains(RegExp(
                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+"))) {
                            return 'Enter a valid email';
                          } else {
                            return null;
                          }
                        },
                        onChanged: (val) {
                          setState(() => email = val);
                        },
                      ),
                      SizedBox(height: 20.0),
                      TextFormField(
                        decoration:
                            textInputDecoration.copyWith(hintText: 'Password'),
                        obscureText: true,
                        validator: (val) => val.length < 6
                            ? 'Enter a password 6 chars long'
                            : null,
                        onChanged: (val) {
                          setState(() => password = val);
                        },
                      ),
                      SizedBox(height: 20.0),
                      TextFormField(
                        decoration: textInputDecoration.copyWith(
                            hintText: 'Confirm Password'),
                        obscureText: true,
                        validator: (val) {
                          if (val.isEmpty) {
                            return 'Enter a password 6 chars long';
                          }
                          if (val != password) {
                            return 'Password does not Match';
                          } else if (val.length < 6) {
                            return 'Enter a password 6 chars long';
                          } else {
                            return null;
                          }
                        },
                      ),
                      RaisedButton(
                          color: Colors.red,
                          child: Text(
                            'Register',
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: () async {
                            if (_formKey.currentState.validate()) {
                              setState(() => loading = true);
                              dynamic result = await _auth.signUp(
                                  email: email, password: password);
                              if (result == null) {
                                setState(() {
                                  loading = false;
                                });
                              }
                              if (result != null) {
                                Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                        builder: (context) => HomePage()));
                              }
                            }
                          }),
                      SizedBox(height: 12.0),
                      Text(
                        error,
                        style: TextStyle(color: Colors.red, fontSize: 14.0),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
  }
}
