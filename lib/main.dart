import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:isp/pages/choose_location.dart';
import 'package:isp/pages/loading.dart';
import 'pages/home.dart';
import 'pages/dashboard.dart';
import 'pages/security.dart';
import 'pages/register.dart';

void main() => runApp(App());

class App extends StatelessWidget {

  //TODO: Configure firebase to ios
  //TODO: Register page
  final Future<FirebaseApp> _initialisation = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      initialRoute: '/',
      routes: {
        '/': (context) => Loading(),
        '/security': (context) => Security(),
        '/register': (context) => Register(),
        '/dashboard': (context) => Dashboard(),
        '/home': (context) => Home(),
        '/location': (context) => ChooseLocation(),
      },
    );
  }
}
