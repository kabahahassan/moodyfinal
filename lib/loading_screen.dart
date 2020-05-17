import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'welcome_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  static String id = 'LoadingScreen';
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getdata();
  }

  void getdata() async {
    final _firebase = Firestore.instance;
    var message_reference = await _firebase.collection("shop1").getDocuments();
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return WelcomeScreen(
        message_reference: message_reference,
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.white,
          size: 100.0,
        ),
      ),
    );
  }
}
