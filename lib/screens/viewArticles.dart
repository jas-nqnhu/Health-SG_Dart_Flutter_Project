import 'package:flutter/material.dart';
import 'package:project_sg_health/screens/healthArticles.dart';
import 'package:project_sg_health/screens/login_page.dart';
import '/services/firebaseauth_service.dart';

class ArticleData {
  final String title;
  final String date;
  final String img;
  final String content;
  ArticleData(this.title, this.date, this.img, this.content);
}

class Article extends StatefulWidget {
  final ArticleData data;
  Article({Key key, this.data}) : super(key: key);

  @override
  _ArticleState createState() => _ArticleState();
}

class _ArticleState extends State<Article> {
  final FirebaseAuthService _fbAuth = FirebaseAuthService();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.red[900],
          title: Text('Health Articles'),          
          elevation: 0.0,
          leading: TextButton.icon(onPressed: ()async{
            Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => HealthArticle()));
          }, icon: Icon(Icons.arrow_back, color: Colors.white,), label: Text('')),
          // actions: <Widget>[
          //   FlatButton.icon(
          //     onPressed: () async {
          //       await _fbAuth.signOut();
          //       Navigator.of(context).pushReplacement(
          //         MaterialPageRoute(builder: (context) => SignIn()));
          //     },
          //     icon: Icon(Icons.person, color: Colors.white),
          //     label: Text(
          //       'logout',
          //       style: TextStyle(
          //         color: Colors.white,
          //       ),
          //     ),
          //   )
          // ],
        ),
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                widget.data.title,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                widget.data.date,
                style: TextStyle(fontSize: 18),
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

            Image(image: NetworkImage(widget.data.img)),
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
              child: Text(
                widget.data.content,
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
