import 'package:flutter/material.dart';

class ULocation extends StatefulWidget {
  static const String id='U_Location';
  @override
  _ULocationState createState() => _ULocationState();
}
class _ULocationState extends State<ULocation> {
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
