import 'dart:io';
import 'package:doctorapp/Doctor_files/DoctorA.dart';
import 'package:flutter/material.dart';
import 'package:doctorapp/services/auth.dart' as auth;
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/services.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:firebase_core/firebase_core.dart' as firebase_core;

class Doctoreg extends StatefulWidget {
  static const String id = 'Doctoreg';
  @override
  _DoctoregState createState() => _DoctoregState();
}

class _DoctoregState extends State<Doctoreg> {
  final TextEditingController _dEmailController = TextEditingController();
  final TextEditingController _dPasswordController = TextEditingController();
  final TextEditingController _dPhoneController = TextEditingController();

  bool _load = false;
  String userType;
  FilePickerResult _paths;
  final _firestore = FirebaseFirestore.instance;

  String get _kDEmail => _dEmailController.text;
  String get _kDPassword => _dPasswordController.text;
  String get _kDPhone => _dPhoneController.text;

  void _submit() async {
    try {
      setState(() {
        _load = true;
      });
      print('Alert Emergency Triggered');
      await auth.auth.createUserWithEmailAndPassword(_kDEmail, _kDPassword);
      _firestore.collection('doctor_id').add({
        'phonenumber': _kDPhone,
        'user': _kDEmail,
      });
      if (_paths != null) {
        File filePath = File(_paths.files.first.path);
        uploadFileWithMetadata(filePath);
      }
      Navigator.pushNamed(context, DoctorA.id);
      setState(() {
        _load = false;
      });
    } catch (e) {
      print(e.toString());
    }
  }

  // @override
  // void initState() {
  //   super.initState();
  // }

  void _openFileExplorer() async {
    try {
      _paths = (await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowMultiple: false,
        allowedExtensions: ['pdf', 'jpg', 'jpeg'],
      ));
    } on PlatformException catch (e) {
      print("Unsupported operation" + e.toString());
    } catch (e) {
      print(e.toString());
    }
    if (!mounted) return;
  }

  Future<void> uploadFileWithMetadata(File file) async {
    // Create your custom metadata.
    if (file == null) {
      NullThrownError();
    }
    firebase_storage.StorageMetadata metadata =
        firebase_storage.StorageMetadata(
      customMetadata: <String, String>{
        'userId': _kDEmail,
      },
    );

    try {
      await firebase_storage.FirebaseStorage.instance
          .ref()
          .child(_kDPhone)
          .putFile(file, metadata);
    } on firebase_core.FirebaseException catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
              color: Colors.red[300],
              borderRadius: BorderRadius.circular(5.0),
              child: MaterialButton(
                onPressed: _openFileExplorer,
                child: Text(
                  'Upload Certificate',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            SizedBox(height: 30.0),
            Material(
              color: Colors.red[300],
              borderRadius: BorderRadius.circular(5.0),
              child: MaterialButton(
                onPressed: _submit,
                child: Text(
                  'Register',
                  style: TextStyle(
                    fontSize: 30,
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
