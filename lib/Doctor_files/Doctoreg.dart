import 'package:doctorapp/Doctor_files/D_Location.dart';
import 'package:flutter/material.dart';
import 'D_Location.dart';
import 'package:doctorapp/services/auth.dart';

class Doctoreg extends StatefulWidget {
  static const String id='Doctoreg';
  final auth = new Auth();
  @override
  _DoctoregState createState() => _DoctoregState();
}

class _DoctoregState extends State<Doctoreg> {
  final TextEditingController _dEmailController = TextEditingController();
  final TextEditingController _dPasswordController = TextEditingController();
  final TextEditingController _dPhoneController = TextEditingController();
  
  String get k_d_email => _dEmailController.text;
  String get k_d_password => _dPasswordController.text;
  String get k_d_phonenumber => _dPhoneController.text;

  void _submit() async
  {
     try
     { 
      print('Alert Emergency Triggered');
      await widget.auth.createUserWithEmailAndPassword(k_d_email, k_d_password);
      Navigator.pushNamed(context, D_Location.id);
     }catch(e)
     {
       print(e.toString());
     }
  }

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
            controller: _dEmailController,
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
            controller: _dPasswordController,
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
            controller: _dPhoneController,
            keyboardType: TextInputType.number,
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
              onPressed: _submit,
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
