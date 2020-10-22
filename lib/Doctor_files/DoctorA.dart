import 'package:flutter/material.dart';
import 'D_emergency.dart';

class DoctorA extends StatefulWidget {
  static const String id = 'DoctorA';
  @override
  _DoctorAState createState() => _DoctorAState();
}

class _DoctorAState extends State<DoctorA> {
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
                'LOG-OUT',
                style: TextStyle(
                  color: Colors.black,
                  backgroundColor: Colors.red,
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
              'Are you available at the moment to take emergency cases',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
          Row(
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(20.0),
                child: Material(
                  color: Colors.cyan,
                  borderRadius: BorderRadius.circular(5.0),
                  child: MaterialButton(
                    onPressed: () {
                      setState(() {});
                      print('Alert Emergency Triggerd');
                      Navigator.pushNamed(context, DEmergency.id);
                    },
                    child: Text(
                      'Doctor Page',
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
                  color: Colors.cyan,
                  borderRadius: BorderRadius.circular(5.0),
                  child: MaterialButton(
                    onPressed: () {
                      setState(() {});
                      print('Alert Emergency Triggerd');
                      //Navigator.pushNamed(context, );
                    },
                    child: Text(
                      'Doctor Page',
                      style: TextStyle(
                        fontSize: 40,
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
