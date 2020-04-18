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
      appBar: AppBar
      (
          title : Text('Doctor App'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Your Location is being sent and if an urgency pops up, we will contact you',textAlign: TextAlign.center,),
          ],
        ),
      ),
    );
  }
}

