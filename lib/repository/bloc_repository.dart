import 'package:weatherapp/bloc/city_bloc.dart';
import 'package:weatherapp/bloc/forecast_bloc.dart';

class BlocRepository {
  // ignore: close_sinks
  var forecast = ForecastBloc();
  CityBloc? city;

  static final BlocRepository _singleton = BlocRepository._internal();

  factory BlocRepository() {
    return _singleton;
  }

  BlocRepository._internal() {
    this.city = CityBloc(forecast.repository.cityController);
  }
}
