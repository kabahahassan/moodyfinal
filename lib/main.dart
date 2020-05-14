import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('MOODY STYLE'),
          backgroundColor: Colors.black,
        ),
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CircleAvatar(
                  backgroundColor: Colors.white,
                  backgroundImage: AssetImage('images/mobile_logo_white.png'),
                  radius: 50.0,
                ),
                Text(
                  '#MoodyStyle',
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.black45,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2.5,
                    fontFamily: 'Source Sans Pro',
                  ),
                ),
                Text(
                  'Smiles Are Always In Fashion',
                  style: TextStyle(
                    fontSize: 28.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Pacifico',
                  ),
                ),
                SizedBox(
                  height: 20.0,
                  width: 150.0,
                  child: Divider(
                    color: Colors.black45,
                  ),
                ),
                InkWell(
                  onTap: () => launch("sms:0502801437"),
                  child: Card(
                    color: Colors.black,
                    margin:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                    child: ListTile(
                      leading: Icon(
                        Icons.phone,
                        color: Colors.white70,
                      ),
                      title: Text(
                        'צור קשר',
                        style: TextStyle(
                          fontFamily: 'Source Sans Pro',
                          color: Colors.white70,
                        ),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: _launchURL,
                  child: Card(
                    color: Colors.black,
                    margin:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                    child: ListTile(
                      leading: Icon(
                        Icons.store,
                        color: Colors.white70,
                      ),
                      title: Text(
                        'בקר בחנות שלנו',
                        style: TextStyle(
                          fontFamily: 'Source Sans Pro',
                          color: Colors.white70,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

_launchURL() async {
  const url = 'https://hsenlalawe.wixsite.com/moody4';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
