import 'package:flutter/material.dart';
import 'package:nulaundry/Homepage.dart';
import 'package:nulaundry/splash.dart';

import 'login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        
        primarySwatch: Colors.blue,
      ),
      // home: const MainMenu()
      // home: Login(),
      home: Splash(),
    );
  }
}


