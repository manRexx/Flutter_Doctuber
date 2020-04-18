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
      appBar: AppBar
      (
          title: Text('Doctor App'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20.0),
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
          SizedBox(height: 30.0),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 100.0),
            child: Material(
              color: Colors.cyan,
              borderRadius: BorderRadius.circular(5.0),
              child: MaterialButton(
                onPressed: _submit,
                child: Text('Login',
                style: TextStyle(
                  fontSize: 20.0,
                ),),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
