import 'package:flutter/material.dart';

class D_Location extends StatefulWidget {
  static const String id='D_Location';
  @override
  _D_LocationState createState() => _D_LocationState();
}

class _D_LocationState extends State<D_Location> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Text('Your Location is being sent and if an urgency pops up, we will contact you',),
        ],
      ),
    );
  }
}

