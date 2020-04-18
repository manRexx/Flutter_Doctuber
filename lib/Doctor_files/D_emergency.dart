import 'package:flutter/material.dart';

class DEmergency extends StatefulWidget {
  static const String id='D_Emergency';
  @override
  _DEmergencyState createState() => _DEmergencyState();
}

class _DEmergencyState extends State<DEmergency> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar
      (
          title: Text('Doctor App'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center (child : Text('An emergency has occurred in your locality, would you like to go there?'),),
          SizedBox(height:20.0),
           Material(
            color: Colors.blueAccent,
            borderRadius: BorderRadius.circular(5.0),
            child: MaterialButton(
              onPressed: null,
              child: Text(
                'Yes',
              ),
            ),
           ),
           SizedBox(height: 10.0),
           Material(
            color: Colors.blueAccent,
            borderRadius: BorderRadius.circular(5.0),
            child: MaterialButton(
              onPressed: null,
              child: Text(
                'No',
              ),
            ) ,
           ),
        ],
      ),
    );
  }
}
