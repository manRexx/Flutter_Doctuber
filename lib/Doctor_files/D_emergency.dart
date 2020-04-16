import 'package:flutter/material.dart';

class D_Emergency extends StatefulWidget {
  static const String id='D_Emergency';
  @override
  _D_EmergencyState createState() => _D_EmergencyState();
}

class _D_EmergencyState extends State<D_Emergency> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
