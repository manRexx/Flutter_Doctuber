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
          Text('An emergency has occurred in your locality, would you like to go their?'),
          Material(
            color: Colors.blueAccent,
            borderRadius: BorderRadius.circular(5.0),
            child: MaterialButton(
              onPressed: (){
                setState(() {
                });
              },
              child: Text(
                'Yes',
              ),
            ),
          ),
      Material(
        color: Colors.blueAccent,
        borderRadius: BorderRadius.circular(5.0),
        child: MaterialButton(
          onPressed: (){
            setState(() {
            });
          },

          child: Text(
            'No',
          ),
        ) ,
      )],
      ),
    );
  }
}
