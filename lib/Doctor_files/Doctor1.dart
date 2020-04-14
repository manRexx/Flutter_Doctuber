import 'package:flutter/material.dart';
import 'DoctorLogin.dart';
import 'Doctoreg.dart';

class Doctor1 extends StatefulWidget {
  static const String id='Doctor1';
  @override
  _Doctor1State createState() => _Doctor1State();
}

class _Doctor1State extends State<Doctor1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            child: Material(
              color: Colors.blueAccent,
              borderRadius: BorderRadius.circular(30.0),
              child: MaterialButton(
                onPressed: () {
                  setState(() {});
                  print('Changing to Doctor Registration');
                  Navigator.pushNamed(context, Doctoreg.id);
                },
                child: Text(
                  'Doctor\nRegistration',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(20.0),
            child: Material(
              color: Colors.blueAccent,
              borderRadius: BorderRadius.circular(30.0),
              child: MaterialButton(
                onPressed: () {
                  setState(() {});
                  print('Changing to Doctor Login');
                  Navigator.pushNamed(context, DoctorLogin.id);
                },
                child: Text(
                  'Doctor Login',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}