import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '/screens/login_page.dart';
import '/shared/drawer.dart';
import '/services/firebaseauth_service.dart';
// import 'addrecord_page.dart';
// import 'showrecords_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final FirebaseAuthService _fbAuth = FirebaseAuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.red[900],
        title: Text('Home'),
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
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(
              'Fun and Healthy Activities',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
            ),
          ),
          CarouselSlider(
            items: [
              //Carousell Image 1
              Container(
                margin: EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  image: DecorationImage(
                    image: NetworkImage(
                        'https://www.ft.com/__origami/service/image/v2/images/raw/https%3A%2F%2Fd1e00ek4ebabms.cloudfront.net%2Fproduction%2F420e7555-72a1-4843-8326-26e602b3700e.jpg?fit=scale-down&source=next&width=700'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Playing Football',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text(
                        'Lowers Body Fat and Improves Muscle Tone, teaches Coordination ',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              //Carousell Image 2
              Container(
                margin: EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  image: DecorationImage(
                    image: NetworkImage(
                        'https://img.republicworld.com/republic-prod/stories/promolarge/xxhdpi/rqigkeyw5por6acl_1588243846.jpeg'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Playing Basketball',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text(
                        'Strengthens muscular endurance. Playing basketball requires agility, strength, and stamina',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              //Carousell Image 3
              Container(
                margin: EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  image: DecorationImage(
                    image: NetworkImage(
                        'https://www.redsports.sg/wp-content/uploads/2009/04/jschooling5.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Swimming',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text(
                        'Keeps your heart rate up but takes some of the impact stress off your body.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
            options: CarouselOptions(
              height: 180.0,
              enlargeCenterPage: true,
              autoPlay: true,
              aspectRatio: 16 / 9,
              autoPlayCurve: Curves.fastLinearToSlowEaseIn,
              enableInfiniteScroll: true,
              autoPlayAnimationDuration: Duration(
                milliseconds: 800,
              ),
              viewportFraction: 0.8,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(
              'Articles',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
            ),
          ),
          Card(
            elevation: 5,
            shape: Border(
                right: BorderSide(
              color: Colors.red,
              width: 5,
            )),
            child: ListTile(
              // leading: Image(image: AssetImage('images/articles/article1.jpg'),),
              title: Text(
                  'Singapore approves Moderna Covid-19 vaccine first shipment to arrive around March'),
              subtitle: Text('FEB 3, 2021'),
              tileColor: Colors.white,
              onTap: () {
                // ArticleData articleData = new ArticleData('Singapore approves Moderna Covid-19 vaccine first shipment to arrive around March','FEB 3, 2021','images/articles/article1.jpg');
                // Navigator.push(context,
                // MaterialPageRoute(
                // builder: (context) => Article(data: articleData,),
                // ),
                // );
              },
            ),
          ),
          Card(
            elevation: 5,
            shape: Border(
                right: BorderSide(
              color: Colors.red,
              width: 5,
            )),
            child: ListTile(
              // leading: Image(image: AssetImage('images/articles/article2.jpg'),),
              title: Text('No Gym Required: How to Get Fit at Home'),
              subtitle: Text('FEB 1, 2021'),
              tileColor: Colors.white,
              onTap: () {
                // ArticleData articleData = new ArticleData('No Gym Required: How to Get Fit at Home','FEB 1, 2021','images/articles/article2.jpg');
                // Navigator.push(context,
                // MaterialPageRoute(
                // builder: (context) => Article(data: articleData,),
                // ),
                // );
              },
            ),
          ),
          Card(
            elevation: 5,
            shape: Border(
                right: BorderSide(
              color: Colors.red,
              width: 5,
            )),
            child: ListTile(
              // leading: Image(image: AssetImage('images/articles/article3.jpg'),),
              title: Text('All You Need to Know About Childhood Immunisations'),
              subtitle: Text('FEB 1, 2021'),
              tileColor: Colors.white,
              onTap: () {
                // ArticleData articleData = new ArticleData('All You Need to Know About Childhood Immunisations','FEB 1, 2021','images/articles/article3.jpg');
                // Navigator.push(context,
                // MaterialPageRoute(
                // builder: (context) => Article(data: articleData,),
                // ),
                // );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Text('Health Articles'),
                IconButton(
                  icon: Icon(Icons.keyboard_arrow_right),
                  iconSize: 24.0,
                  color: Colors.lightGreen,
                  onPressed: () {
                    // Navigator.push(context,
                    // MaterialPageRoute(
                    // builder: (context) => HealthArticle(),
                    // ),
                    // );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
      drawer: MyDrawer(onTap: (context, i, txt) {
        setState(() {
          Navigator.pop(context);
        });
      }),
    );
  }
}
