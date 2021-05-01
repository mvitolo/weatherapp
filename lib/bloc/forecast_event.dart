import 'package:equatable/equatable.dart';
import 'package:weatherapp/model/forecast.dart';

abstract class ForecastEvent extends Equatable {
  const ForecastEvent();

  @override
  List<Object> get props => [];
}

class ForecastChanged extends ForecastEvent {
  const ForecastChanged(this.forecast) : super();

  final Forecast forecast;

  @override
  List<Object> get props => [forecast];
}

class ForecastLoading extends ForecastEvent {
  ForecastLoading() : super();

  @override
  List<Object> get props => [];
}
