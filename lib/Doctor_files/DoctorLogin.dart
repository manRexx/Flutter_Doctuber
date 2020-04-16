import 'package:doctorapp/Doctor_files/D_emergency.dart';
import 'package:flutter/material.dart';
import 'package:doctorapp/services/auth.dart';

class DoctorLogin extends StatefulWidget {
  static const String id='DoctorLogin';
  final auth = new Auth();
  @override
  _DoctorLoginState createState() => _DoctorLoginState();
}

class _DoctorLoginState extends State<DoctorLogin> {
  
  String get k_d_email => _dEmailController.text;
  String get k_d_password => _dPasswordController.text;

  final TextEditingController _dEmailController = TextEditingController();
  final TextEditingController _dPasswordController = TextEditingController();

  void _submit() async
  {
     try
     { 
      await widget.auth.signInWithEmailAndPassword(k_d_email, k_d_password);
      Navigator.pushNamed(context, D_Emergency.id);
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
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            child: TextField(
              autofocus: true,
              cursorColor: Colors.amber,
              keyboardType: TextInputType.emailAddress,
              textAlign: TextAlign.center,
              controller : _dEmailController,
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
          SizedBox(height : 10.0),
          Container(
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
          SizedBox(height: 10.0),
          Container(
            child: Material(
              child: MaterialButton(
                onPressed: _submit,
                child: Text('Next',),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
