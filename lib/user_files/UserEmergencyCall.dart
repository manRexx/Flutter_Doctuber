import 'package:flutter/material.dart';
import 'package:doctorapp/user_files/U_Location.dart';


class UserEmergencyCall extends StatefulWidget {
  static const String id='UserEmergencyCall';
  @override
  _UserEmergencyCallState createState() => _UserEmergencyCallState();
}

class _UserEmergencyCallState extends State<UserEmergencyCall> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar
        (
        title: Center(child: Text('Emergency App'),),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: MaterialButton(onPressed: (){},
              child: Text(
                'LOG-OUT',
                style: TextStyle(
                  color: Colors.black,
                  backgroundColor: Colors.red,
                  fontSize: 20.0,
                ),
              ),),
          )
        ],

      ),
      body: Column(
        children: <Widget>[
          Container(
            child: MaterialButton(
              onPressed: (){
                print('Alert Emergency Triggered');
                setState(() {});
                Navigator.pushNamed(context, ULocation.id);
              },
              child: Image.asset('images/Emergency1.png',
                scale: 5, ),
            ),
          ),
        ],
      ),
    );
  }
}
