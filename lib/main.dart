import 'package:flutter/material.dart';
import 'package:moodyfinal/loading_screen.dart';
import 'welcome_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: LoadingScreen.id,
      routes: {
        WelcomeScreen.id: (context) => WelcomeScreen(),
        LoadingScreen.id: (context) => LoadingScreen(),
      },
    );
  }
}
