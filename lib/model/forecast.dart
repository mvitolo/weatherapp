import 'package:json_annotation/json_annotation.dart';
import 'package:weatherapp/model/city.dart';
part 'forecast.g.dart';

@JsonSerializable()
class Forecast {
  final List<WForecast> list;
  final City city;

  Forecast(this.list, this.city);

  factory Forecast.fromJson(Map<String, dynamic> json) =>
      _$ForecastFromJson(json);

  Map<String, dynamic> toJson() => _$ForecastToJson(this);
}

@JsonSerializable()
class WForecast {
  final int dt;
  final String dt_txt;
  final List<Weather> weather;

  WForecast(this.dt, this.dt_txt, this.weather);

  factory WForecast.fromJson(Map<String, dynamic> json) =>
      _$WForecastFromJson(json);

  Map<String, dynamic> toJson() => _$WForecastToJson(this);
}

@JsonSerializable()
class Weather {
  final int id;
  final String main;
  final String description;
  final String icon;

  Weather(this.id, this.main, this.description, this.icon);

  factory Weather.fromJson(Map<String, dynamic> json) =>
      _$WeatherFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherToJson(this);
}
