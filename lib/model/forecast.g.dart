// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forecast.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Forecast _$ForecastFromJson(Map<String, dynamic> json) {
  return Forecast(
    (json['list'] as List<dynamic>)
        .map((e) => WForecast.fromJson(e as Map<String, dynamic>))
        .toList(),
    City.fromJson(json['city'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ForecastToJson(Forecast instance) => <String, dynamic>{
      'list': instance.list,
      'city': instance.city,
    };

WForecast _$WForecastFromJson(Map<String, dynamic> json) {
  return WForecast(
    json['dt'] as int,
    json['dt_txt'] as String,
    (json['weather'] as List<dynamic>)
        .map((e) => Weather.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$WForecastToJson(WForecast instance) => <String, dynamic>{
      'dt': instance.dt,
      'dt_txt': instance.dt_txt,
      'weather': instance.weather,
    };

Weather _$WeatherFromJson(Map<String, dynamic> json) {
  return Weather(
    json['id'] as int,
    json['main'] as String,
    json['description'] as String,
    json['icon'] as String,
  );
}

Map<String, dynamic> _$WeatherToJson(Weather instance) => <String, dynamic>{
      'id': instance.id,
      'main': instance.main,
      'description': instance.description,
      'icon': instance.icon,
    };
