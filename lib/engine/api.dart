import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:weatherapp/model/forecast.dart';

class Api {
  http.Client client = http.Client();
  static var openweathermapApiKey = "c2514f40d1e386073da3c9568f985aa0";

  Future<List<Forecast>> forecasts() async {
    final response = await client.get(Uri.parse(
        "http://api.openweathermap.org/data/2.5/forecast?q=London&appid=" +
            openweathermapApiKey));

    if (response.statusCode == 200) {
      var body = json.decode(response.body) as Map<String, dynamic>;
      var list = body["list"] as List;
      return list.map((i) => Forecast.fromJson(i)).toList();
    } else {
      throw Exception('Failed to load Forecast');
    }
  }
}
