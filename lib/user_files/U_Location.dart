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
      body: Column(
        children: <Widget>[
          Text(
            'Your Location has been sent and Medical help will soon arrive',
          ),
        ],
      ),
    );
  }
}
