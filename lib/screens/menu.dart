import 'package:flutter/material.dart';
import 'package:hiragana_katakana/screens/home.dart';

class MenuScreen extends StatefulWidget {
  static const String id = 'menu';
  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: RaisedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return HomeScreen();
                  }));
                },
                child: Text('Start quiz'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
