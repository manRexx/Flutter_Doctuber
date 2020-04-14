import 'package:flutter/material.dart';


class DoctorLogin extends StatefulWidget {
  static const String id='DoctorLogin';
  @override
  _DoctorLoginState createState() => _DoctorLoginState();
}

class _DoctorLoginState extends State<DoctorLogin> {
  String k_d_email;
  String k_d_password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            child: TextField(
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
          ),
          Container(
            child: TextField(
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
          ),
          Container(
            child: Material(
              child: MaterialButton(
                onPressed: (){
                  setState(() {
                  });
                },
                child: Text('Next',),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
