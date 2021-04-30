// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forecast.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Forecast _$ForecastFromJson(Map<String, dynamic> json) {
  return Forecast(
    json['dt'] as int,
    json['dt_txt'] as String,
  );
}

Map<String, dynamic> _$ForecastToJson(Forecast instance) => <String, dynamic>{
      'dt': instance.dt,
      'dt_txt': instance.dt_txt,
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
