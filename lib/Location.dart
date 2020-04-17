import 'package:geolocator/geolocator.dart';
import 'package:flutter/material.dart';


class Location {
  double k_latitude;
  double k_longitude;

  Future<void> getCurrentLocation() async {
    try {
      Position k_position = await Geolocator()
          .getCurrentPosition(desiredAccuracy: LocationAccuracy.bestForNavigation);

      k_latitude = k_position.latitude;
      k_longitude = k_position.longitude;
    } catch (e) {
      print(e);
    }
  }
}