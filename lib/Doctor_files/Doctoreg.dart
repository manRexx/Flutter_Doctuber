import 'package:doctorapp/Doctor_files/D_Location.dart';
import 'package:flutter/material.dart';
import 'D_Location.dart';
import 'package:doctorapp/services/auth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Doctoreg extends StatefulWidget {
  static const String id='Doctoreg';
  final auth = new Auth();
  final _firestore = Firestore.instance;
  @override
  _DoctoregState createState() => _DoctoregState();
}

class _DoctoregState extends State<Doctoreg> {
  final TextEditingController _dEmailController = TextEditingController();
  final TextEditingController _dPasswordController = TextEditingController();
  final TextEditingController _dPhoneController = TextEditingController();
  
  bool _load=false;
  String userType; 
  
  String get k_d_email => _dEmailController.text;
  String get k_d_password => _dPasswordController.text;
  String get k_d_phonenumber => _dPhoneController.text;

  void _submit() async
  {
     try
     { 
      setState(() {
        _load=true;
      });
      print('Alert Emergency Triggered');
      await widget.auth.createUserWithEmailAndPassword(k_d_email, k_d_password);
      Navigator.pushNamed(context, D_Location.id);
      setState(() {
        _load=false;
      });
     }catch(e)
     {
       print(e.toString());
     }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar
      (
          title: Text('Doctor App'),
      ),
      body: ModalProgressHUD(
          inAsyncCall: _load,
              child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(20.0),
              child: TextField(
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
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: TextField(
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
            ),
            Container(
              padding: EdgeInsets.all(20.0),
              child: TextField(
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
            ),
            SizedBox(height: 30.0),
            Material(
              color: Colors.cyan,
              borderRadius: BorderRadius.circular(5.0),
              child: MaterialButton(
                onPressed: _submit,
                child: Text(
                  'Register',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
