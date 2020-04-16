import 'package:flutter/material.dart';

class U_Location extends StatefulWidget {
  static const String id='U_Location';
  @override
  _U_LocationState createState() => _U_LocationState();
}

class _U_LocationState extends State<U_Location> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar
      (
          title: Text('User App'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Your Location has been sent and Medical help will soon arrive', textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
