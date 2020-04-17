import 'package:flutter/material.dart';
import 'UserLogin.dart';
import 'UserRegistration.dart';

class User1 extends StatefulWidget {
  static const String id='User1';
  @override
  _User1State createState() => _User1State();
}

class _User1State extends State<User1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
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
                  Navigator.pushNamed(context, UserRegistration.id);
                },
                child: Text(
                  'User Register',
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
                  Navigator.pushNamed(context, UserLogin.id);
                },
                child: Text(
                  'User Login',
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
