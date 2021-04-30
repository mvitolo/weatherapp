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
      return list.map((i) => Forecast.fromJson(i)).toList().fold([],
          (previousValue, element) {
        List<Forecast> l = (previousValue as List<Forecast>);

        if (l.length == 0) {
          l.add(element);
          return l;
        }
        if (l.length == 5) {
          return l;
        }
        DateTime previous =
            DateTime.fromMillisecondsSinceEpoch(l.last.dt * 1000);
        DateTime next = DateTime.fromMillisecondsSinceEpoch(element.dt * 1000);
        if (previous.day != next.day) {
          l.add(element);
        }
        return l;
      });
    } else {
      throw Exception('Failed to load Forecast');
    }
  }
}
