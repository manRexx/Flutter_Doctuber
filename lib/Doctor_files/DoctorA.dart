import 'package:flutter/material.dart';
import 'D_emergency.dart';
import 'package:doctorapp/services/auth.dart' as auth;
import 'package:cloud_firestore/cloud_firestore.dart';

class DoctorA extends StatefulWidget {
  static const String id = 'DoctorA';
  @override
  _DoctorAState createState() => _DoctorAState();
}

class _DoctorAState extends State<DoctorA> {
  CollectionReference users =
      FirebaseFirestore.instance.collection('doctor_id');

  @override
  Widget build(BuildContext context) {
    final String args = ModalRoute.of(context).settings.arguments;
    print(args);
    Future<void> updateUser() {
      return users
          .doc(args)
          .update({'isAvailable': true})
          .then((value) => print("User Updated"))
          .catchError((error) => print("Failed to update user: $error"));
    }

    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Emergency App'),
        ),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: MaterialButton(
              onPressed: () {
                auth.auth.signOut();
                Navigator.pop(context);
              },
              child: Text(
                'Log Out',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
            ),
          )
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(20.0),
            child: Text(
              ''
              'Are you available at the moment to take emergency cases?',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(20.0),
                child: Material(
                  color: Colors.red[300],
                  borderRadius: BorderRadius.circular(5.0),
                  child: MaterialButton(
                    onPressed: () {
                      print('Alert Emergency Triggered');
                      updateUser();
                      Navigator.pushNamed(context, DEmergency.id);
                    },
                    child: Text(
                      'Yes',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(20.0),
                child: Material(
                  color: Colors.red[300],
                  borderRadius: BorderRadius.circular(5.0),
                  child: MaterialButton(
                    onPressed: () {
                      setState(() {});
                      print('Alert Emergency Triggerd');
                      Navigator.pop(context);
                    },
                    child: Text(
                      'No',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
