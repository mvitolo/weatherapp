import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:weatherapp/model/city.dart';
import 'dart:convert';

import 'package:weatherapp/model/forecast.dart';

class Api {
  http.Client client = http.Client();
  static var openweathermapApiKey = "c2514f40d1e386073da3c9568f985aa0";

  Future<Forecast> forecasts(String city) async {
    final response = await client.get(Uri.parse(
        "http://api.openweathermap.org/data/2.5/forecast?q=" +
            city +
            "&appid=" +
            openweathermapApiKey));

    if (response.statusCode == 200) {
      Map<String, dynamic> map = json.decode(response.body);
      return Forecast.fromJson(map);
    } else {
      throw Exception('Failed to load Forecast');
    }
  }

  Future<List<City>> city(String value) async {
    final response = await client.get(Uri.parse(
        "http://api.openweathermap.org/geo/1.0/direct?q=" +
            value +
            "&limit=1&appid=" +
            openweathermapApiKey));

    if (response.statusCode == 200) {
      return (json.decode(response.body) as List)
          .map((i) => City.fromJson(i))
          .toList();
    } else {
      return [];
    }
  }
}
