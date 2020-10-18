import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:isp/pages/choose_location.dart';
import 'package:isp/pages/loading.dart';
import 'pages/home.dart';

void main() => runApp(MaterialApp(
  initialRoute: '/',
  routes: {
    '/': (context) => Loading(),
    '/home': (context) => Home(),
    '/location': (context) => ChooseLocation(),
  },
));