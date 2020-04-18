import 'package:geolocator/geolocator.dart';

class Location {
  double kLatitude;
  double kLongitude;

  Future<void> getCurrentLocation() async {
    try {
      Position kPosition = await Geolocator()
          .getCurrentPosition(desiredAccuracy: LocationAccuracy.best);

      kLatitude = kPosition.latitude;
      kLongitude = kPosition.longitude;
    } catch (e) {
      print(e);
    }
  }
}