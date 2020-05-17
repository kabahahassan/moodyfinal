import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'round_button.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_image/firebase_image.dart';

class WelcomeScreen extends StatefulWidget {
  static String id = 'WelcomeScreen';
  final message_reference;
  WelcomeScreen({this.message_reference});
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final _firebase = Firestore.instance;
  String develpoer = "";
  String shopMoto = "";
  String shopText = "";
  String shopPhone = "";
  String url = "";
  String title = "";
  Uint8List imageFile;
  Uint8List logoFile;
  String imageurl;

  void getMessages(var message_reference) async {
    develpoer = message_reference.documents[1].data['developer'];
    shopMoto = message_reference.documents[1].data['shopMoto'];
    shopText = message_reference.documents[1].data['shopText'];
    shopPhone = message_reference.documents[1].data['shopPhone'];
    url = message_reference.documents[1].data['url'];
    title = message_reference.documents[1].data['title'];
  }

  @override
  void initState() {
    // TODO: implement initState

    // print(shopText);
    super.initState();
    // print(shopText);
    getMessages(widget.message_reference);
  }

  _launchURL() async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    getMessages(widget.message_reference);
    print(shopText);
    return MaterialApp(
      //theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Text(title),
          backgroundColor: Colors.black,
        ),
        //backgroundColor: Colors.white,
        body: Container(
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                CircleAvatar(
                  backgroundColor: Colors.black,
                  backgroundImage: FirebaseImage(
                    'gs://moody-e317d.appspot.com/photos/mobile_logo_white.png',
                  ),
                  radius: 150.0,
                ),
                Text(
                  shopMoto,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white70,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2.5,
                  ),
                ),
                Text(
                  shopText,
                  style: TextStyle(
                    fontSize: 24.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 20.0,
                  width: 150.0,
                  child: Divider(
                    color: Colors.black45,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        RoundIconButton(
                          icon: Icons.sms,
                          onPressed: () => launch("sms:$shopPhone"),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          'SMS',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        RoundIconButton(
                          icon: Icons.store,
                          onPressed: _launchURL,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          'לחנות',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  width: 30,
                  height: 30,
                ),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'BY: $develpoer',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
