import 'package:doctorapp/Doctor_files/D_Location.dart';
import 'package:flutter/material.dart';
import 'D_Location.dart';

class Doctoreg extends StatefulWidget {
  static const String id='Doctoreg';
  @override
  _DoctoregState createState() => _DoctoregState();
}

class _DoctoregState extends State<Doctoreg> {
  String k_d_email;
  String k_d_password;
  String k_d_phonenumber;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          TextField(
            autofocus: true,
            cursorColor: Colors.amber,
            keyboardType: TextInputType.emailAddress,
            textAlign: TextAlign.center,
            onChanged: (value){
              k_d_email=value;
            },
            decoration: InputDecoration(
              hintText: 'Enter your Email',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.0),
                borderSide: BorderSide(
                  color: Colors.amber,
                  style: BorderStyle.solid,
                ),
              ),
            ),
          ),
          SizedBox(height: 10.0),
          TextField(
            autofocus: true,
            cursorColor: Colors.amber,
            obscureText: true,
            textAlign: TextAlign.center,
            onChanged: (value){
              k_d_password=value;
            },
            decoration: InputDecoration(
              hintText: 'Enter your Password',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.0),
                borderSide: BorderSide(
                  color: Colors.amber,
                  style: BorderStyle.solid,
                ),
              ),
            ),
          ),
          SizedBox(height: 10.0),
          TextField(
            autofocus: true,
            cursorColor: Colors.amber,
            textAlign: TextAlign.center,
            onChanged: (value){
              k_d_phonenumber=value;
            },
            decoration: InputDecoration(
              hintText: 'Enter your Phone Number',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.0),
                borderSide: BorderSide(
                  color: Colors.amber,
                  style: BorderStyle.solid,
                ),
              ),
            ),
          ),
          SizedBox(height: 30.0),
          Material(
            color: Colors.blueAccent,
            borderRadius: BorderRadius.circular(5.0),
            child: MaterialButton(
              onPressed: () {
                setState(() {});
                print('Alert Emergency Triggerd');
                Navigator.pushNamed(context, D_Location.id);
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
        ],
      ),
    );
  }
}
