import 'register_page.dart';
import 'login_page.dart';
import 'package:flutter/material.dart';

class Authenticate extends StatefulWidget {
  Authenticate({Key key}) : super(key: key);

  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool showSignIn = true;
  void toggleView(){
    setState(() => showSignIn = !showSignIn);
  }
  @override
  Widget build(BuildContext context) {
    if(showSignIn){
      return SignIn(toggleView: toggleView);
    } else{
      return Register(toggleView: toggleView);
    }
  }
}