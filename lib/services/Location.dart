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
Future<Location> getLocation(Location location) async {
    await location.getCurrentLocation();
    return location;  
  }

double getLocationLongitude(Location location)
{
  return location.kLongitude;
}
double getLocationLatitude(Location location)
{
  return location.kLatitude;
}