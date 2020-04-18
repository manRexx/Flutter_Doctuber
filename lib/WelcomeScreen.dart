import 'package:doctorapp/Doctor_files/Doctor1.dart';
import 'package:doctorapp/user_files/U_Location.dart';
import 'package:doctorapp/user_files/User1.dart';
import 'package:flutter/material.dart';


class WelcomeScreen extends StatefulWidget {
  static const String id = 'WelcomeScreen';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar
      (
          title: Center(child: Text('Emergency App'),),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
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
                      Navigator.pushNamed(context, Doctor1.id);
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
                      Navigator.pushNamed(context, User1.id);
                    },
                    child: Text(
                      'User Page',
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                child: MaterialButton(
                  onPressed: (){
                    setState(() {});
                    Navigator.pushNamed(context, U_Location.id);
                  },
                  child: Image.asset('images/Emergency1.png',
                  scale: 5, ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
