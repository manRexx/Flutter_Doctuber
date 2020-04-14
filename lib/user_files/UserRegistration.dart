import 'package:flutter/material.dart';
class UserRegistration extends StatefulWidget {
  static const String id='UserRegistration';
  @override
  _UserRegistrationState createState() => _UserRegistrationState();
}

class _UserRegistrationState extends State<UserRegistration> {
  String k_u_email;
  String k_u_password;
  String k_u_phone_number;
  String k_u_emergency_contact;
  String k_u_address;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            child: TextField(
              autofocus: true,
              cursorColor: Colors.amber,
              keyboardType: TextInputType.emailAddress,
              textAlign: TextAlign.center,
              onChanged: (value){
                k_u_email=value;
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
          ),
          Container(
            child: TextField(
              autofocus: true,
              cursorColor: Colors.amber,
              obscureText: true,
              textAlign: TextAlign.center,
              onChanged: (value){
                k_u_password=value;
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
          ),
          Container(
            child: TextField(
              autofocus: true,
              cursorColor: Colors.amber,
              keyboardType: TextInputType.emailAddress,
              textAlign: TextAlign.center,
              onChanged: (value){
                k_u_phone_number=value;
              },
              decoration: InputDecoration(
                hintText: 'Enter your Phone number',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                  borderSide: BorderSide(
                    color: Colors.amber,
                    style: BorderStyle.solid,
                  ),
                ),
              ),
            ),
          ),
          Container(
            child: TextField(
              autofocus: true,
              cursorColor: Colors.amber,
              keyboardType: TextInputType.emailAddress,
              textAlign: TextAlign.center,
              onChanged: (value){
                k_u_emergency_contact=value;
              },
              decoration: InputDecoration(
                hintText: 'Enter your Emergency Contact',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                  borderSide: BorderSide(
                    color: Colors.amber,
                    style: BorderStyle.solid,
                  ),
                ),
              ),
            ),
          ),
          Container(
            child: TextField(
              autofocus: true,
              cursorColor: Colors.amber,
              keyboardType: TextInputType.emailAddress,
              textAlign: TextAlign.center,
              onChanged: (value){
                k_u_address=value;
              },
              decoration: InputDecoration(
                hintText: 'Enter your Address',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                  borderSide: BorderSide(
                    color: Colors.amber,
                    style: BorderStyle.solid,
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
