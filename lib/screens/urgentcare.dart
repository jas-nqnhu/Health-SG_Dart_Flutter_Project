import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:project_sg_health/screens/login_page.dart';
import 'package:project_sg_health/screens/mapPage.dart';
import '/shared/drawer.dart';
import '/services/firebaseauth_service.dart';
import 'package:url_launcher/url_launcher.dart';

class UrgentCare extends StatefulWidget {
  @override
  _UrgentCareState createState() => _UrgentCareState();
}

class _UrgentCareState extends State<UrgentCare> {
  var location = new Location();
  LocationData userLocation;
  Future<LocationData> _getLocation() async {
    LocationData currentLocation;
    try {
      currentLocation = await location.getLocation();
    } catch (e) {
      currentLocation = null;
    }
    return currentLocation;
  }

  @override
  Widget build(BuildContext context) {
    final FirebaseAuthService _fbAuth = FirebaseAuthService();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.red[900],
          title: Text('Urgent Care'),
          elevation: 0.0,
          actions: <Widget>[
            FlatButton.icon(
              onPressed: () async {
                await _fbAuth.signOut();
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => SignIn()));
              },
              icon: Icon(Icons.person, color: Colors.white),
              label: Text(
                'logout',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                'What would you like to do today?',
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24.0),
              ),
            ),
            Divider(
              thickness: 3,
            ),
            ListTile(
              leading: Icon(Icons.phone),
              onTap: () => launch("tel://555"),
              title: Text(
                'Call Urgent Care',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Divider(
              thickness: 3,
            ),
            ListTile(
              leading: Icon(Icons.calendar_today),
              title: Text(
                'Book Appointment',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Divider(
              thickness: 3,
            ),
            ListTile(
              onTap: () async {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => NearbyMap(),
                //   ),
                // );
                _getLocation().then((value) {
                  setState(() {
                    userLocation = value;
                  });
                }).catchError((e) => print('${e.error}'));
                 userLocation != null
                          ?Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            MapPage(userLocation: userLocation))): DoNothingAction();
              },
              leading: Icon(Icons.fact_check_outlined),
              title: Text(
                'Find Nearby Hospital',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Divider(
              thickness: 3,
            ),
          ],
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
