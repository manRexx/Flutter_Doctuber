import 'package:doctorapp/Doctor_files/DoctorCard.dart';
import 'package:doctorapp/Doctor_files/DoctorCardList.dart';
import 'package:doctorapp/user_files/U_Location.dart';
import 'package:flutter/material.dart';
import 'package:doctorapp/services/auth.dart' as auth;
import 'package:modal_progress_hud/modal_progress_hud.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

class UserLogin extends StatefulWidget {
  static const String id = 'UserLogin';
  @override
  _UserLoginState createState() => _UserLoginState();
}

class _UserLoginState extends State<UserLogin> {
  String get _kUEmail => _uEmailController.text;
  String get _kUPassword => _uPasswordController.text;
  // String  _kUPhoneNumber;
  // String  _kUEmergencyContact;
  // String  _kUAddress;

  // final _firestore = Firestore.instance;

  final TextEditingController _uEmailController = TextEditingController();
  final TextEditingController _uPasswordController = TextEditingController();

  // void getData() async {
  //   final messages = await _firestore.collection('user_id').getDocuments();
  //   for (var message in messages.documents)
  //   {
  //     if(message.data['user']==_kUEmail)
  //     {
  //       _kUPhoneNumber=message.data['phoneno'];
  //       _kUAddress = message.data['address'];
  //       _kUEmergencyContact=message.data['emergencycontact'];
  //     }
  //   }
  // }

  void _submit() async {
    try {
      setState(() {
        _load = true;
      });
      await auth.auth.signInWithEmailAndPassword(_kUEmail, _kUPassword);
      Navigator.pushNamed(context, DoctorList.id);
      setState(() {
        _load = false;
      });
    } catch (e) {
      print(e.toString());
    }
  }

  bool _load = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User App'),
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
                controller: _uEmailController,
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
            //SizedBox(height: 10),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: TextField(
                autofocus: true,
                cursorColor: Colors.amber,
                obscureText: true,
                textAlign: TextAlign.center,
                controller: _uPasswordController,
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
            SizedBox(
              height: 20,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 100.0),
              child: Material(
                color: Colors.red[300],
                borderRadius: BorderRadius.circular(5.0),
                child: MaterialButton(
                  onPressed: _submit,
                  child: Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
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
