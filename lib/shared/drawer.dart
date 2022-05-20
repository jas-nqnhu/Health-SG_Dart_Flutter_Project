import 'package:flutter/material.dart';
import 'package:project_sg_health/models/profileImg.dart';
import 'package:project_sg_health/screens/addUserProfile.dart';
import 'package:project_sg_health/screens/healthArticles.dart';
import 'package:project_sg_health/services/firebaseauth_service.dart';
import 'package:project_sg_health/services/firestore_sercive.dart';
import '/screens/urgentcare.dart';
import '/screens/aboutus.dart';
import '/screens/showUserProfile.dart';
import '/screens/addUserProfile.dart';
import '/screens/home_page.dart';
import '/models/userProfile.dart' as UserProfile;

class MyDrawer extends StatelessWidget {
  final FirebaseAuthService _fbAuth = FirebaseAuthService();
  final Function onTap;
  MyDrawer({this.onTap});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      child: Drawer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.red[900]),
              child: Padding(
                padding: EdgeInsets.all(6),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Container(
                      width: 60,
                      height: 60,
                      child: FutureBuilder<List<ProfileImage>>(
                          future: FirestoreService().readProfileImages(),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              for (int index = 0;
                                  index < snapshot.data.length;
                                  index++) {
                                if (snapshot.data[index].uid.toString() ==
                                    _fbAuth.getUid()) {
                                  return ClipRRect(
                                    borderRadius: BorderRadius.circular(50),
                                    child: Image.network(
                                      snapshot.data[index].url,
                                      width: 100,
                                      height: 100,
                                      fit: BoxFit.cover,
                                    ),
                                  );
                                }
                              }
                            } else if (snapshot.hasError) {
                              return Text("${snapshot.error}");
                            }
                            return Container(
                              alignment: AlignmentDirectional.center,
                              child: CircularProgressIndicator(),
                            );
                          }),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    FutureBuilder<List<UserProfile.User>>(
                        future: FirestoreService().readProfileData(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return ListView.builder(
                                scrollDirection: Axis.vertical,
                                shrinkWrap: true,
                                itemCount: snapshot.data.length,
                                itemBuilder: (context, index) {
                                  if (snapshot.data[index].id ==
                                      _fbAuth.getUid()) {
                                    return Text(
                                        "${snapshot.data[index].userName}",style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),);
                                  }
                                });
                          } else if (snapshot.hasError) {
                            return Text("${snapshot.error}");
                          }
                          return Text("User Name");
                        }),                    
                    SizedBox(
                      height: 3,
                    ),
                    Text(
                      _fbAuth.getUEmail(),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HomePage(),
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Profile'),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ShowRecordsPage(),
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.update),
              title: Text('Add Profile'),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddProfile(),
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.quick_contacts_dialer),
              title: Text('Urgent Care'),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => UrgentCare(),
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.article),
              title: Text('Health Article'),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HealthArticle(),
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.info),
              title: Text('About Us'),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AboutUs(),
                ),
              ),
            ),
          ],
        ), //Column
      ), //Drawer
    ); //SizedBox
  }
}

class User {}
