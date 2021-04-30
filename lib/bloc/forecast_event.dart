import 'package:equatable/equatable.dart';
import 'package:weatherapp/model/forecast.dart';

abstract class ForecastEvent extends Equatable {
  const ForecastEvent(this.forecast);

  final List<Forecast> forecast;

  @override
  List<Object> get props => [];
}

class ForecastChanged extends ForecastEvent {
  const ForecastChanged(this.forecast) : super(forecast);

  final List<Forecast> forecast;

  @override
  List<Object> get props => [forecast];
}

class ForecastLoading extends ForecastEvent {
  ForecastLoading() : super([]);

  final List<Forecast> forecast = [];

  @override
  List<Object> get props => [forecast];
}
