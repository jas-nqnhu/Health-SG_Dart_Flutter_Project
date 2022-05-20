import 'package:flutter/material.dart';
import '/screens/login_page.dart';
import '/services/firebaseauth_service.dart';
import '/shared/drawer.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutUs extends StatefulWidget {
  @override
  _AboutUsState createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  @override
  Widget build(BuildContext context) {
  final FirebaseAuthService _fbAuth = FirebaseAuthService();
    return MaterialApp(  
      debugShowCheckedModeBanner: false,
      home: Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.red[900],
        title: Text('About Us'),
        elevation: 0.0,
        actions: <Widget>[
          FlatButton.icon(
            onPressed: ()async {
              await _fbAuth.signOut();
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => SignIn()));
            }, 
            icon: Icon(Icons.person,
            color: Colors.white),
            label: Text('logout',
            style: TextStyle(
              color: Colors.white,
            ),
            ),
          )
        ],
        ),
        body: Container(
      child: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              // child: Image(image: AssetImage('images/logo.jpg'),),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('SG-Health was build to make it more convenience for patients and encourage citizen to have a healthy lifestyle.\n \n Objective of this app: \n •	Affordable price, time saving \n •	Reduce unnecessary physical contact to prevent the speared of virus. \n •	Make it more convenience for patients.'),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Divider(
                color: Colors.grey,
                height: 1,
                thickness: 1,
                endIndent: 0,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Version 1.0',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
                color: Colors.grey
              ),
              ),
            ),

            //Screen Devider
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Divider(
                color: Colors.grey,
                height: 1,
                thickness: 1,
                endIndent: 0,
              ),
            ),
            ListTile(
              leading: Icon(Icons.email, color: Colors.red[200],),
              title: Text('Email'),
            ),
            //Screen Devider
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Divider(
                color: Colors.grey,
                height: 1,
                thickness: 1,
                endIndent: 0,
              ),
            ),

            ListTile(
              leading: Icon(Icons.phone, color: Colors.lightGreen,),
              title: Text('Contact Us'),
              onTap: () => launch("tel:/884353243"),
            ),

            //Screen Devider
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Divider(
                color: Colors.grey,
                height: 1,
                thickness: 1,
                endIndent: 0,
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Developed by Jasmine Nguyen',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14.0
              ),
              ),
            ),
          ],
        ),
      ),
    ),
        drawer: MyDrawer(onTap: (context, i, txt) {
          setState(() {
            Navigator.pop(context);
          });
        }),
      ),
    );
  }
}