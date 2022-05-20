import 'dart:async';

import 'package:flutter/material.dart';
import '/models/healthArticles.dart';
import '/screens/login_page.dart';
import '/models/healthArticles.dart' as Health;
import '/screens/viewArticles.dart' as ViewArticle;
import '/services/firebaseauth_service.dart';
import '/services/httpservice.dart';

class HealthArticle extends StatefulWidget {
  @override
  _HealthArticleState createState() => _HealthArticleState();
}

class Debouncer {
  final int msecond;
  VoidCallback action;
  Timer _timer;
  Debouncer({this.msecond});
  run(VoidCallback action) {
    if (null != _timer) {
      _timer.cancel();
    }
    _timer = Timer(Duration(milliseconds: msecond), action);
  }
}

class _HealthArticleState extends State<HealthArticle> {
  final debouncer = Debouncer(msecond: 1000);
  List<Health.Article> _healthArticles;
  bool _loading;

  @override
  void initState() {
    super.initState();
    _loading = true;
    HttpService.getHealthArticles().then((ha) {
      setState(() {
        _healthArticles = ha;
        _loading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final FirebaseAuthService _fbAuth = FirebaseAuthService();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.red[900],
        title: Text(_loading ? 'Loading..' : 'Health Articles'),
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
      body: Container(
        child: Column(
          children: <Widget>[
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
            Expanded(
                child: ListView.builder(
                    itemCount:
                        null == _healthArticles ? 0 : _healthArticles.length,
                    itemBuilder: (context, index) {
                      Health.Article haAvail = _healthArticles[index];
                      return Card(
                        elevation: 5,
                        shape: Border(
                            right: BorderSide(
                          color: Colors.red,
                          width: 5,
                        )),
                        child: ListTile(
                          leading: Image(
                            image: NetworkImage(haAvail.urlToImage != null
                                ? haAvail.urlToImage
                                : 'https://freepikpsd.com/file/2019/10/loading-icon-png-6-Transparent-Images.png'),
                          ),
                          title: Text(haAvail.title),
                          subtitle: Text(haAvail.publishedAt.toString()),
                          tileColor: Colors.white,
                          onTap: () {
                            ViewArticle
                                .ArticleData articleData = new ViewArticle
                                    .ArticleData(
                                haAvail.title,
                                haAvail.publishedAt.toString(),
                                haAvail.urlToImage,
                                haAvail.description);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ViewArticle.Article(
                                  data: articleData,
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    })),           
          ],
        ),
      ),
    );
  }
}
