import 'package:doctorapp/Doctor_files/DoctorCard.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctorapp/services/auth.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class DoctorList extends StatefulWidget {
  static const String id = 'DoctorList';
  @override
  _DoctorListState createState() => _DoctorListState();
}

class _DoctorListState extends State<DoctorList> {
  @override
  CollectionReference doctors =
      FirebaseFirestore.instance.collection('doctor_id');
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Doctor List'),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: MaterialButton(
              onPressed: () {
                auth.signOut();
                Navigator.pop(context);
              },
              child: Text(
                'Log Out',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
            ),
          )
        ],
      ),
      body: StreamBuilder<QuerySnapshot>(
          stream: doctors.snapshots(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasError) {
              return Text('Something went wrong');
            }
            if (!snapshot.hasData) {
              return Container(
                child: SpinKitCircle(
                  color: Colors.white,
                  size: 50.0,
                ),
              );
            }
            print(snapshot.connectionState);
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Container(
                child: SpinKitCircle(
                  color: Colors.white,
                  size: 50.0,
                ),
              );
            }
            return ListView(
              children: snapshot.data.documents
                  .map<Widget>((DocumentSnapshot document) {
                return DoctorCard(
                  phonenumber: document.data()['phoneno'],
                  name: document.data()['name'],
                  email: document.data()['email'],
                  address: document.data()['address'],
                  onTap: () {},
                  color: Colors.red[300],
                );
              }).toList(),
            );
          }),
    );
  }
}
