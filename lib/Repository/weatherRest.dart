import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:y2ztest/UTILITY/Location.dart';

const weatherApiUrl =
    'https://api.openweathermap.org/data/2.5/onecall?lat=12.9082847623315&lon=77.65197822993314&units=imperial&appid=b143bb707b2ee117e62649b358207d3e';

/// weather API network helper
/// pass the weatherAPI url
///  to this class to get geographical coordinates
class NetworkData {
  final String url;
  NetworkData(this.url);

  /// get geographical coordinates from open weather API call
  Future getData() async {
    http.Response response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      String data = response.body;
      return jsonDecode(data);
    } else {
      print(response.statusCode);
    }
  }
}

class Weatherdatafetch {
  Future<dynamic> getLocationWeather() async {
    /// await for methods that return future
    Location location = Location();
    await location.getCurrentLocation();

    /// Get location data
    ///&units=metric change the temperature metric
    NetworkData networkHelper = NetworkData(
        '$weatherApiUrl?lat=${location.latitude}&lon=${location.longitide}&units=imperial&appid=b143bb707b2ee117e62649b358207d3e');
    var weatherData = await networkHelper.getData();
    return weatherData;
  }
}
