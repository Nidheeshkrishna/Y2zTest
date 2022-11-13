import 'package:geolocator/geolocator.dart';

class Location {
  late double latitude;
  late double longitide;
  String apiKey = 'your API key';
  late int status;
  Position? position;

  /// async and await are used for time consuming tasks
  /// Get your current loatitude and longitude
  /// Location accuracy depends on the type of app high,low ,
  /// high accuracy also result in more power consumed
  Future<Position?> getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);

      latitude = position.latitude;
      longitide = position.longitude;
      return position;
    } catch (e) {
      print(e);
    }
    return position;
  }
}
