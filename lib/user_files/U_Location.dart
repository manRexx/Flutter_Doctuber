import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


// Location of the user will be sent from initState {init state will give initial value of the user location}&& then we have to create a continues fn to update location value to firebase
// If we get a doctor the we will push location of user and doctor to the google maps
// Add a logout functionality using a logout button



class ULocation extends StatefulWidget {
  static const String id='U_Location';
  @override
  _ULocationState createState() => _ULocationState();
}
class _ULocationState extends State<ULocation> {

  GoogleMapController _controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar
      (
          title: Text('User App'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Your Location has been sent and Medical help will soon arrive', textAlign: TextAlign.center,
          ),
          // GoogleMap(
          //   onMapCreated: onMapCreated,
          //   initialCameraPosition: CameraPosition(
          //     target: LatLng(40.6782,-73.9442),
          //     zoom: 14.0,
          //   ),
          //   mapType: MapType.normal,
          // ),
        ],
      ),
    );
  }

//   void onMapCreated(GoogleMapController controller){
//     setState(() {
//       _controller=controller;
//     });
//   }
 }
