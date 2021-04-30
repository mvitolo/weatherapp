import 'package:equatable/equatable.dart';
import 'package:weatherapp/model/forecast.dart';

class ForecastState extends Equatable {
  ForecastState(this.forecast);

  final List<Forecast> forecast;

  @override
  List<Object> get props => [forecast];
}

class ForecastEmpty extends ForecastState {
  ForecastEmpty() : super([]);

  @override
  List<Object> get props => [];
}
