import 'package:flutter/material.dart';
import '/screens/home_page.dart';
import '/screens/login_page.dart';
import 'package:firebase_core/firebase_core.dart';

import 'screens/authenticate.dart';
Future<void> main() async {
WidgetsFlutterBinding.ensureInitialized();
await Firebase.initializeApp();
 runApp(MyApp());
}
class MyApp extends StatelessWidget {
 @override
Widget build(BuildContext context) {
  return MaterialApp(
   debugShowCheckedModeBanner: false,
   routes: {
    '/login': (context) => SignIn(),
    '/home': (context) => HomePage(),
   },
   home: Authenticate(),
  );
}
}