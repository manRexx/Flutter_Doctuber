import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctorapp/Doctor_files/D_emergency.dart';
import 'package:flutter/material.dart';
import 'DoctorA.dart';
import 'package:doctorapp/services/auth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';



class DoctorLogin extends StatefulWidget {
  static const String id='DoctorLogin';
  final auth = new Auth();
  @override
  _DoctorLoginState createState() => _DoctorLoginState();
}

class _DoctorLoginState extends State<DoctorLogin> {
  
  String get _kDEmail => _dEmailController.text;
  String get _kDPassword => _dPasswordController.text;
  String _kDPhone;

  bool _load=false;
  final _firestore = Firestore.instance;
  
  void getData() async {
    final messages = await _firestore.collection('doctor_id').getDocuments();
    for (var message in messages.documents)
    {
      if(message.data['user']==_kDEmail)
      {
        _kDPhone=message.data['phonenumber'];
      }
    }
  }

  final TextEditingController _dEmailController = TextEditingController();
  final TextEditingController _dPasswordController = TextEditingController();

  void _submit() async
  {
     try
     { 
      setState(() {
        _load=true;
      });
      await widget.auth.signInWithEmailAndPassword(_kDEmail, _kDPassword);
      Navigator.pushNamed(context, DEmergency.id);
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
      ),
    );
  }
}
