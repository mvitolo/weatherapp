import 'package:equatable/equatable.dart';
import 'package:weatherapp/model/forecast.dart';

class ForecastValue extends ForecastState {
  ForecastValue(this.forecast);

  final Forecast forecast;

  @override
  List<Object> get props => [forecast];
}

class ForecastEmpty extends ForecastState {}

class ForecastState extends Equatable {
  ForecastState();

  @override
  List<Object> get props => [];
}
