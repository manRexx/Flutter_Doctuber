import 'package:doctorapp/user_files/DoctorCardList.dart';
import 'package:flutter/material.dart';
import 'package:doctorapp/user_files/U_Location.dart';

class UserEmergencyCall extends StatefulWidget {
  static const String id = 'UserEmergencyCall';
  @override
  _UserEmergencyCallState createState() => _UserEmergencyCallState();
}

class _UserEmergencyCallState extends State<UserEmergencyCall> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Emergency App'),
        ),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: MaterialButton(
              onPressed: () {},
              child: Text(
                'Log Out',
                style: TextStyle(
                  color: Colors.white,
                  //backgroundColor: Colors.red,
                  fontSize: 20.0,
                ),
              ),
            ),
          )
        ],
      ),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Please Tap the image to get a doctor\'s list',
              style: TextStyle(fontSize: 20),
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            child: MaterialButton(
              onPressed: () {
                print('Alert Emergency Triggered');
                setState(() {});
                Navigator.pushNamed(context, DoctorList.id);
              },
              child: Image.asset(
                'images/Emergency1.png',
                scale: 5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
