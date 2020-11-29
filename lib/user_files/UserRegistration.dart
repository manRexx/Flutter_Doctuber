import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctorapp/services/auth.dart';
import 'package:doctorapp/user_files/U_Location.dart';
import 'package:location/location.dart';

import 'UserLogin.dart';

class UserRegistration extends StatefulWidget {
  static const String id='UserRegistration';
  final auth = new Auth();
  @override
  _UserRegistrationState createState() => _UserRegistrationState();
}


class _UserRegistrationState extends State<UserRegistration> {
  String get _kUEmail => _uEmailController.text;
  String get _kUPassword => _uPasswordController.text;
  String get _kUPhoneNumber => _uPhoneController.text;
  String get _kUEmergencyContact => _uEmergencyController.text;
  String get _kUAddress => _uAddressController.text;

  bool _load=false;
    final _firestore = Firestore.instance;


  void _submit() async
  {
     try
     { 
      setState(() {
        _load=true;
      });
      print('Alert Emergency Triggered');

      Location location = new Location();

      bool _serviceEnabled;
      PermissionStatus _permissionGranted;
      LocationData _locationData;

      _serviceEnabled = await location.serviceEnabled();
      if (!_serviceEnabled) {
        _serviceEnabled = await location.requestService();
        if (!_serviceEnabled) {
          return;
        }
      }

      _permissionGranted = await location.hasPermission();
      if (_permissionGranted == PermissionStatus.denied) {
        _permissionGranted = await location.requestPermission();
        if (_permissionGranted != PermissionStatus.granted) {
          return;
        }
      }

      _locationData = await location.getLocation();
      print(_locationData);
      print(_locationData.longitude);
      print(_locationData.latitude);

      await widget.auth.createUserWithEmailAndPassword(_kUEmail, _kUPassword);
      final docRef=_firestore.collection('user_id').add
      (
        {
          'address': _kUAddress,
          'emergencycontact':_kUEmergencyContact,
          'phoneno': _kUPhoneNumber,
          'user': _kUEmail,
          'latitude':_locationData.latitude,
          'longitude':_locationData.longitude,
        }
      );

      print('User Registered');

      // should be pushNamed to UserLogin

      Navigator.pushNamed(context,UserLogin.id);
      setState(() {
        _load=false;
      });
     }catch(e)
     {
       print(e.toString());
     }
  }


  final TextEditingController _uEmailController = TextEditingController();
  final TextEditingController _uPasswordController = TextEditingController();
  final TextEditingController _uPhoneController = TextEditingController();
  final TextEditingController _uEmergencyController = TextEditingController();
  final TextEditingController _uAddressController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar
      (
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
            Container(
              padding: EdgeInsets.all(20.0),
              child: TextField(
                autofocus: true,
                cursorColor: Colors.amber,
                keyboardType: TextInputType.phone,
                textAlign: TextAlign.center,
                controller:_uPhoneController,
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
            Container
            (
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: TextField(
                autofocus: true,
                cursorColor: Colors.amber,
                keyboardType: TextInputType.emailAddress,
                textAlign: TextAlign.center,
                controller: _uEmergencyController,
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
              padding: EdgeInsets.all(20.0),
              child: TextField(
                autofocus: true,
                cursorColor: Colors.amber,
                keyboardType: TextInputType.emailAddress,
                textAlign: TextAlign.center,
                controller: _uAddressController,
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
            Container(
              padding: EdgeInsets.symmetric(horizontal: 60.0),
              child: Material(
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
            ),
          ],
        ),
      ),
    );
  }
}
